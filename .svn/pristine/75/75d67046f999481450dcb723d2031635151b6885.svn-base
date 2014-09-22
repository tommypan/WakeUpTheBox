package game.controller
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import game.event.InitGameEvent;
	import game.event.LoginGameEvent;
	import game.view.InitScene;
	import game.view.mediator.InitSceneMediator;
	
	import org.robotlegs.mvcs.Command;

	/** 
	 * 进入游戏初始化，加载资源控制器
	 * 
	 * @author pengbinke
	 * <p> 2013-3-21 下午2:42:17
	 */
	public class InitCommand extends Command
	{
		public function InitCommand()
		{
		}
		
		override public function execute():void
		{
			//监听到加载完成做两件事
			commandMap.mapEvent(InitGameEvent.INIT_GAME,LandingCommand, Event, true);
			mediatorMap.mapView(InitScene, InitSceneMediator);
			contextView.addChild(new InitScene());
		}
		
	}
}