package game.view
{
	import com.utils.MyLoaderManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;

	public class BoxFace extends Sprite
	{
		private var boxSmileBmp:Bitmap;
		private var boxCryBmp:Bitmap;
		public function BoxFace(num1:uint)
		{
			boxSmileBmp = new Bitmap(MyLoaderManager.getInstance().getBmp("b"+num1.toString()));
			boxCryBmp = new Bitmap(MyLoaderManager.getInstance().getBmp("a"+num1.toString()));
			addChild(boxSmileBmp);
			addChild(boxCryBmp);
			boxSmileBmp.visible = true;
			boxCryBmp.visible = false;
		}
		public function exchangePic():void{
			boxSmileBmp.visible = false;
			boxCryBmp.visible = true;
		}
	}
}