package game.view.button
{
	import com.utils.MyLoaderManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class PlayButton extends Sprite
	{
		private	var playButton:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("stone"));
		private	var playButton2:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("stone2"));
		public function PlayButton()
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