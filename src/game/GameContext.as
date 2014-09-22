package game
{
//	import com.utils.adapter.ContextViewManager;
//	
//	import game.controller.ConfigPanelCommand;
//	import game.controller.StartStarlingCommand;
//	import game.event.StarlingStartedEvent;
//	import game.event.StartStarlingEvent;
//	import game.model.MapModel;
//	import game.view.LoginSence;
//	import game.view.MainScene;
//	import game.view.meditor.LoginSenceMediator;
//	import game.view.meditor.MainSceneMeditor;
	
	import com.utils.StageProxy;
	
	import flash.display.DisplayObjectContainer;
	
	import game.controller.InitCommand;
	import game.event.LoginGameEvent;
	import game.view.ChooseScene;
	import game.view.LoadingScene;
	import game.view.PlayScene;
	import game.view.mediator.ChooseSceneMediator;
	import game.view.mediator.PlaySceneMediator;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class GameContext extends Context
	{
		public function GameContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		override public function startup():void
		{
			registerInstance();
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, InitCommand, ContextEvent, true);
//			injector.mapSingleton(MapModel);
			
			super.startup();
		}
		
		private function registerInstance():void
		{
			//注册舞台，避免传参
			StageProxy.registed(contextView.stage);
			
			LoadingScene.registerInstance();
		}
	}
}