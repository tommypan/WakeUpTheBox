package game.view.button
{
	import com.utils.MyLoaderManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class YesButton extends Sprite
	{
		private	var playButton:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("yes"));
		private	var playButton2:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("yes2"));
		public function YesButton()
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