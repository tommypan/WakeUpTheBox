package game.controller
{
	import com.utils.StageProxy;
	
	import flash.events.Event;
	
	import game.event.ChooseBackEvent;
	import game.event.GotoChooseEvent;
	import game.event.MissionEvent;
	import game.model.MissionModel;
	import game.view.ChooseScene;
	import game.view.DrawScene;
	import game.view.InitScene;
	import game.view.PlayScene;
	import game.view.mediator.ChooseSceneMediator;
	import game.view.mediator.DrawSceneMediator;
	import game.view.mediator.PlaySceneMediator;
	
	import org.robotlegs.mvcs.Command;

	public class LandingCommand extends Command
	{
		public function LandingCommand()
		{
		}
		override public function execute():void
		{
			contextView.removeChildAt(0);
			mediatorMap.unmapView(InitScene);
			injector.mapSingleton(MissionModel);
			commandMap.mapEvent(GotoChooseEvent.MISSION_CHOOOSE_BAN,MissionChooseBanCommand, Event);
			
			mediatorMap.mapView(PlayScene, PlaySceneMediator);
			var play:PlayScene = new PlayScene();
			contextView.addChild(play);
			play.name = "play";
			
			play.x = (StageProxy.stageWidth()-640)/2;
			play.y = (StageProxy.stageHeight()-480)/2;
			
			addListener();
		}
		
		/**
		 *添加进入主场景的 相应面板打开的映射
		 * 
		 */
		private function addListener():void
		{
			//command 监听Back时间
			commandMap.mapEvent(ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY_FOR_COMMAND, ChooseBackToPlayCommand, Event);
			
			commandMap.mapEvent(GotoChooseEvent.PLAY_GOTO_MISSION_FOR_COMMAND, PlayToChooseBanCommand, Event);
			
			commandMap.mapEvent(MissionEvent.GOTO_NUM_MISSION_FOR_COMMAND, MissionCommand, MissionEvent);
			
			commandMap.mapEvent(MissionEvent.GOTO_NEXT_MISSION_FOR_COMMAND, NextMissionCommand, MissionEvent);
			
			commandMap.mapEvent(GotoChooseEvent.MISSION_CHOOOSE_BAN_NEXT_MISSION_FOR_COMMAND, MissionChooseBan2Command, Event);
			
			mediatorMap.mapView(ChooseScene, ChooseSceneMediator);
			
			var draw:DrawScene = new DrawScene();
			mediatorMap.mapView(DrawScene, DrawSceneMediator);
			
		}
	}
}