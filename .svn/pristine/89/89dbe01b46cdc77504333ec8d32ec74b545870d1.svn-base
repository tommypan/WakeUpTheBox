package game.view
{
	import com.utils.LoadMusic;
	import com.utils.MyLoaderManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import game.event.GotoChooseEvent;
	import game.view.button.PlayButton;

	public class PlayScene extends Sprite
	{
		private var sp:PlayButton = new PlayButton();
		public function PlayScene()
		{
			var bg:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("heaven"));
			addChild(bg);
			
			this.addChild(sp);
			sp.x = 520;
			sp.y = 400;
			sp.addEventListener(MouseEvent.CLICK,onPlay);
		}
		
		private function onPlay(event:Event):void
		{
			LoadMusic.getInstance().playBgMusic();
			this.dispatchEvent(new Event(GotoChooseEvent.MISSION_CHOOOSE_BAN));
		}
		
		public function remove():void{
				this.visible = false;
				sp.removeEventListener(MouseEvent.CLICK,onPlay);
		}
		public function addtoStage():void{
				this.visible = true;
				sp.addEventListener(MouseEvent.CLICK,onPlay);
		}
	}
}