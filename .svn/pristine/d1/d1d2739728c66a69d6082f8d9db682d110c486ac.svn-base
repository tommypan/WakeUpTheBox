package game.view.mediator
{
	import flash.events.Event;
	
	import game.event.InitGameEvent;
	import game.view.InitScene;
	
	import org.robotlegs.mvcs.Mediator;
	
	/** 
	 * 初始化场景中介
	 * 
	 */
	public class InitSceneMediator extends Mediator
	{
		[Inject]
		public var initScene :InitScene;
		
		public function InitSceneMediator()
		{
		}
		
		override public function onRegister():void
		{
			addViewListener(InitGameEvent.INIT_GAME, onSendEnterGame, Event);
		}
		
		override public function onRemove():void
		{
			removeViewListener(InitGameEvent.INIT_GAME, onSendEnterGame, Event);
		}
		
		private function onSendEnterGame(e:Event):void
		{
			dispatch(e);
		}
	}
}