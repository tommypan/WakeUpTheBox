package com.utils
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import game.event.LoginGameEvent;

	public class MyLoaderManager extends Sprite
	{
		private static var instance :MyLoaderManager;
		private var loader:Loader ;
		private var urlLoader:URLLoader;
		public var hashMap:LocalCacher;
		private	var arr:Array = new Array();
		private var k:int = 0;
		private var length:int;
//		private const MORE:int = 1;// VOICE 2 AND XML 1

		private var s:Sound;
		
		public function MyLoaderManager($singltonEnforcer:SingltonEnforcer)
		{
			LoadMusic.getInstance();
			LoadSWF.getInstance();
			if(!$singltonEnforcer)
				throw new Error("此例为单例，请使用getInstance方法获取");
		}
		
		public static function getInstance():MyLoaderManager
		{
			instance ||= new MyLoaderManager(new SingltonEnforcer());
			return instance;
		}
		
		public function loadAllPic():void{
			hashMap = new LocalCacher();
			loader = new Loader();
			arr = ["a1","a2","a3","a4","b1","b2","b3","b4","bigCircle","wheel","boom","middle","small","heaven","stone","stone2","wood","stoneBack","stoneBack2","menu","menu2","reset","reset2","wall2","no","no2","yes","yes2","point","alert"];
			length = arr.length;
			
			urlLoader = new URLLoader(new URLRequest("assets/Map.xml"));
			urlLoader.addEventListener(Event.COMPLETE,onComplete1);
			
		}
		
		private function onComplete1(event:Event):void
		{
			urlLoader.removeEventListener(Event.COMPLETE,onComplete1);
			hashMap.add("Map.xml",XML(event.target.data));
			loadAllPic1();
			
		}
		
		
		
		private function loadAllPic1(url:String = "a1"):void
		{
			loader.load(new URLRequest("assets/"+url+".jpg"));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			
		}
		
		private function onComplete(event:Event):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onComplete);
			var bit :Bitmap = event.target.content as Bitmap;
			hashMap.add(arr[k],bit.bitmapData);
			k++;
			var evt:LoginGameEvent = new LoginGameEvent(LoginGameEvent.LOGIN_GAME);
			trace(k);
			evt.k = k;
			evt.total = length;
			this.dispatchEvent(evt);
			if(k<length){
				loadAllPic1(arr[k]);
			}
		}
		
		public function getXML(key:String):XML
		{
			return hashMap.getValue(key) as XML;
		}
		
		public function getBmp(key:String):BitmapData{
			return hashMap.getValue(key) as BitmapData;
		}
	}
}

internal class SingltonEnforcer{}