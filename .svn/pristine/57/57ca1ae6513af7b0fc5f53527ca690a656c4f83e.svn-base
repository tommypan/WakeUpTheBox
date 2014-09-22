package game.view
{
	import com.utils.MyLoaderManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	import game.event.InitGameEvent;
	import game.event.LoginGameEvent;
	import game.view.LoadingScene;
	
	/** 
	 * 初始化场景，进入游戏前，初始化游戏数据和资源场景
	 * 
	 */
	public class InitScene extends Sprite
	{
		public function InitScene()
		{
			LoadingScene.instance.drawProgressBar(500,40);
			LoadingScene.instance.x = 70;
			LoadingScene.instance.y = 200;
			addChild(LoadingScene.instance);
			MyLoaderManager.getInstance().loadAllPic();
			MyLoaderManager.getInstance().addEventListener(LoginGameEvent.LOGIN_GAME,onHandleProgress);
		}
		
		private function onHandleProgress(event:LoginGameEvent):void
		{
			// todo 加载进度条应该在增加一个显示相应名字的接口
			LoadingScene.instance.update(event.k/event.total);
			
			if(event.k == event.total){
				complete();
			}
		}
		
		private function complete():void
		{
			removeChild(LoadingScene.instance);
			LoadingScene.instance.clear();
			removeEventListener(LoginGameEvent.LOGIN_GAME,onHandleProgress);
			dispatchEvent(new Event(InitGameEvent.INIT_GAME));
			
		}
		
	}
}