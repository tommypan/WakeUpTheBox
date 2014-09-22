package game.event
{
	import flash.events.Event;
	

	public class MissionEvent extends Event
	{
		/**
		 *选中的当前的关卡数，0---29 
		 */		
		public var missionNum:int;
		/**
		 *mapdata 存取数据 
		 */		
		public var mapData:Object;
		/**
		 *发送到达的关卡数 
		 */		
		public static const GOTO_NUM_MISSION:String = "gotoNumMission";
		
		public static const GOTO_NUM_MISSION_FOR_COMMAND:String = "gotoNumMissionForCommand";
		
		public static const GOTO_NUM_MISSION_FOR_MEDIATOR:String = "gotoNumMissionForMediator";
		
		public var currentMission:int;
		/**
		 *下一关 
		 */		
		public static const GOTO_NEXT_MISSION:String = "gotoNextMission";
		
		public static const GOTO_NEXT_MISSION_FOR_MEDIATOR:String = "gotoNextMissionForMediator";
		
		public static const GOTO_NEXT_MISSION_FOR_COMMAND:String = "gotoNextMissionForCommand";
		public function MissionEvent(type:String)
		{
			super(type);
		}
	}
}