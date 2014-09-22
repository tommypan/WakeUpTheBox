package game.view.mediator
{
	import flash.events.Event;
	
	import game.event.GotoChooseEvent;
	import game.event.MissionEvent;
	import game.view.DrawScene;
	
	import org.robotlegs.mvcs.Mediator;

	public class DrawSceneMediator extends Mediator
	{
		[Inject]
		public var drawScene:DrawScene;
		public function DrawSceneMediator()
		{
		}
		override public function onRegister():void
		{
			
			this.addContextListener(MissionEvent.GOTO_NUM_MISSION_FOR_MEDIATOR,onGoToDrawPanel);
			this.addContextListener(MissionEvent.GOTO_NEXT_MISSION_FOR_MEDIATOR,onGoToNextDrawPanel);
//			this.addContextListener(ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY_FOR_MEDIATOR,onBack);
//			this.addContextListener(GotoChooseEvent.PLAY_GOTO_MISSION_FOR_MEDIATOR,onPlay);
//			this.addContextListener(MissionEvent.GOTO_NUM_MISSION_FOR_MEDIATOR,onGoToDrawPanel);
//			
//			//当点击物品的鼠标弹起的时候 
//			eventMap.mapListener(choose,ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY,onBackToPlay,Event);
//			//点击当前的关卡数
//			eventMap.mapListener(choose,MissionEvent.GOTO_NUM_MISSION,gotoNumMission,MissionEvent);
			
			//点击当前的关卡数
			eventMap.mapListener(drawScene,MissionEvent.GOTO_NEXT_MISSION,gotoNextMission,MissionEvent);
			
			eventMap.mapListener(drawScene,GotoChooseEvent.MISSION_CHOOOSE_BAN_NEXT_MISSION,gotoNextMission2,Event);
			
			addViewListener(GotoChooseEvent.MISSION_CHOOOSE_BAN, onSendEnterGame, Event);
		}
		
		private function gotoNextMission2(e:Event):void
		{
			dispatch(new Event(GotoChooseEvent.MISSION_CHOOOSE_BAN_NEXT_MISSION_FOR_COMMAND));
		}
		
		private function gotoNextMission(e:MissionEvent):void
		{
			dispatch(new MissionEvent(MissionEvent.GOTO_NEXT_MISSION_FOR_COMMAND));
		}
		
		private function onSendEnterGame(e:Event):void
		{
			dispatch(e);
		}
		
		
		private function onGoToDrawPanel(e:MissionEvent):void
		{
			drawScene.createMap(e.mapData);
		}
		private function onGoToNextDrawPanel(e:MissionEvent):void
		{
			drawScene.createMap(e.mapData);
		}
	}
}