package com.utils
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;

	public class LoadMusic extends Sprite
	{
		private var m:Sound = new Sound();
		private var tempS:Sound;
		private static var instance:LoadMusic;
		private var m1:Sound = new Sound();
		private var tempS1:Sound;
		private var bgMusicPlay:Boolean = true;
		public function LoadMusic($singltonEnforcer:SingletonEnforcer)
		{
			if(!$singltonEnforcer)
				throw new Error("此例为单例，请使用getInstance方法获取");
			m.load(new URLRequest("assets/bgMusic.mp3"));
			m.addEventListener(Event.COMPLETE,onC);
			
			m1.load(new URLRequest("assets/boomMusic.mp3"));
			m1.addEventListener(Event.COMPLETE,onC1);
		}
		
		public static function getInstance():LoadMusic
		{
			instance ||= new LoadMusic(new SingletonEnforcer());
			return instance;
		}
		
		private function onC(event:Event):void
		{
			m.removeEventListener(Event.COMPLETE,onC);
			tempS = event.target as Sound;
		}
		
		private function onC1(event:Event):void
		{
			m1.removeEventListener(Event.COMPLETE,onC1);
			tempS1 = event.target as Sound;
		}
		
		public function playBgMusic():void{
			if(bgMusicPlay){
				tempS.play(0,int.MAX_VALUE);
				bgMusicPlay = false;
			}
		}
		
		public function playBoomMusic():void{
			tempS1.play(0,1);
		}
	}
}
internal class SingletonEnforcer{}