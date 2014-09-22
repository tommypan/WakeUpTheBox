package game.view
{
	import com.utils.MyLoaderManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import game.view.button.NoButton;
	import game.view.button.YesButton;

	public class AlertPanel extends Sprite
	{
		private var bmp:Bitmap;
		public var nextBtn:YesButton = new YesButton();;
		public var goToMenuBtn:NoButton = new NoButton();;
		public function AlertPanel(num:uint)
		{
			addChild( new Bitmap(MyLoaderManager.getInstance().getBmp("alert")));
			
			nextBtn.x = 100;
			nextBtn.y = 150;
			addChild(nextBtn);
			
			goToMenuBtn.x = 300;
			goToMenuBtn.y = 150;
			addChild(goToMenuBtn);
			
			trace("a"+num.toString());
			var bmp:Bitmap = new Bitmap(MyLoaderManager.getInstance().getBmp("a"+num.toString()));
			bmp.x = 53;
			bmp.y = 60;
			addChild(bmp);
		}
	}
}