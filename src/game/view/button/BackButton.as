package game.view.button
{
	import com.utils.MyLoaderManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class BackButton extends Sprite
	{
		private	var playButton:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("stoneBack"));
		private	var playButton2:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("stoneBack2"));
		public function BackButton()
		{
			this.addChild(playButton);
			addEventListener(MouseEvent.MOUSE_OVER,onOver);
			addEventListener(MouseEvent.MOUSE_OUT,onOut);
		}
		
		protected function onOut(event:MouseEvent):void
		{
			this.addChild(playButton);
		}
		
		protected function onOver(event:MouseEvent):void
		{
			this.addChild(playButton2);
		}
	}
}