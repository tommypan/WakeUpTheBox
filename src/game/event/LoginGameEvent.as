package game.event
{
	import flash.events.Event;

	public class LoginGameEvent extends Event
	{
		
		/**
		 *加载的时候 
		 */		
		public static const LOGIN_GAME :String = "loginGame";
		
		
		/**
		 *加载的进度 
		 */		
		public var k:int;
		/**
		 *总进度 
		 */		
		public var total:int;
		public function LoginGameEvent(type:String)
		{
			super(type);
		}
	}
}