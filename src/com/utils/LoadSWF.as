package com.utils
{
	import flash.display.Stage;
	import flash.events.Event;
	
	import gameEngine2D.display.BitmapMovie;
	import gameEngine2D.loader.LoaderManager;

	public class LoadSWF
	{
		private var bitmap:BitmapMovie;
		private var boomBitmap:BitmapMovie;
		private static var instance:LoadSWF;
		public function LoadSWF($singleTonEnforcer:SingletonEnforcer)
		{
			if(!$singleTonEnforcer){
				throw new Error("dang lie a ");
			}
			
			bitmap = new BitmapMovie();
			LoaderManager.getInstance().getMovieClip("assets/boom.swf",bitmap,true,false,false,onC);
		}
		public static function getInstance():LoadSWF
		{
			instance ||= new LoadSWF(new SingletonEnforcer());
			return instance;
		}
		private function onC(event:Event=null):void
		{
			boomBitmap = bitmap;
			boomBitmap.scaleX = 0.5;
			boomBitmap.scaleY = 0.5;
		}
		public  function playBoomSWF(xx:Number,yy:Number):void{
			boomBitmap.gotoAndPlay(1,false,null,null,onC2);
			StageProxy.stage.addChild(boomBitmap);
			boomBitmap.x = xx;
			boomBitmap.y = yy;
		}
		private function onC2():void{
			StageProxy.stage.removeChild(boomBitmap);
		}
	}
}
internal class SingletonEnforcer{}