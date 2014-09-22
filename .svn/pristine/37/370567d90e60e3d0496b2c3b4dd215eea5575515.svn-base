package game.view.mediator
{
	import flash.events.Event;
	
	import game.event.ChooseBackEvent;
	import game.event.GotoChooseEvent;
	import game.event.MissionEvent;
	import game.model.MissionModel;
	import game.view.ChooseScene;
	
	import org.robotlegs.mvcs.Mediator;

	public class ChooseSceneMediator extends Mediator
	{
		[Inject]
		public var choose :ChooseScene;
		[Inject]
		public var missionModel :MissionModel;
		public function ChooseSceneMediator()
		{
		}
		override public function onRegister():void
		{
			
			this.addContextListener(ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY_FOR_MEDIATOR,onBack);
			this.addContextListener(GotoChooseEvent.PLAY_GOTO_MISSION_FOR_MEDIATOR,onPlay);
			this.addContextListener(MissionEvent.GOTO_NUM_MISSION_FOR_MEDIATOR,onGoToDrawPanel);
			
			//当点击物品的鼠标弹起的时候 
			eventMap.mapListener(choose,ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY,onBackToPlay,Event);
			//点击当前的关卡数
			eventMap.mapListener(choose,MissionEvent.GOTO_NUM_MISSION,gotoNumMission,MissionEvent);
		}
		
		private function onGoToDrawPanel(e:MissionEvent):void
		{
			choose.remove();
		}
		
		private function gotoNumMission(e:MissionEvent):void
		{
			trace("gotoNumMission",e.missionNum);
			var evt:MissionEvent = new MissionEvent(MissionEvent.GOTO_NUM_MISSION_FOR_COMMAND);
			evt.missionNum = e.missionNum;
			dispatch(evt);
		}
		
		private function onBack(e:Event):void
		{
			choose.remove();
		}
		private function onPlay(e:Event):void{
			trace(missionModel.getMissionNum());
			choose.addtoStage(missionModel.getMissionNum());
		}
		private function onBackToPlay(e:Event):void{
			trace("backTo2");
			dispatch(new Event(ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY_FOR_COMMAND));
		}
	}
}