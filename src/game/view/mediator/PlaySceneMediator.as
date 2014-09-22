package game.view.mediator
{
	import com.utils.StageProxy;
	
	import flash.events.Event;
	
	import game.event.ChooseBackEvent;
	import game.event.GotoChooseEvent;
	import game.view.ChooseScene;
	import game.view.PlayScene;
	
	import org.robotlegs.mvcs.Mediator;

	public class PlaySceneMediator extends Mediator
	{
		[Inject]
		public var playScene :PlayScene;
//		[Inject]
//		public var chooseScene :ChooseScene;
		
		public function PlaySceneMediator()
		{
		}
		
		override public function onRegister():void
		{
			this.addContextListener(ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY_FOR_MEDIATOR,onBack);
			this.addContextListener(GotoChooseEvent.PLAY_GOTO_MISSION_FOR_MEDIATOR,onPlayClick);
			
			StageProxy.stage.addEventListener(Event.RESIZE,onResize);
			addViewListener(GotoChooseEvent.MISSION_CHOOOSE_BAN, onSendEnterGame, Event);
			
			eventMap.mapListener(playScene,GotoChooseEvent.PLAY_GOTO_MISSION,onPlay,Event);
		}
		private function onPlay(e:Event):void{
			dispatch(new Event(GotoChooseEvent.PLAY_GOTO_MISSION_FOR_COMMAND));
		}
		private function onBack(e:Event):void{
			playScene.addtoStage();
		}
		private function onPlayClick(e:Event):void{
			playScene.remove();
		}
		private function onSendEnterGame(e:Event):void
		{
			dispatch(e);
		}
		
		private function onResize(event:Event):void
		{
			playScene.x = (StageProxy.stageWidth()-640)/2;
			playScene.y = (StageProxy.stageHeight()-480)/2;
//			if(!chooseScene){
//				chooseScene.x = (StageProxy.stageWidth()-640)/2;
//				chooseScene.y = (StageProxy.stageHeight()-480)/2;
//			}
		}
		
	}
}