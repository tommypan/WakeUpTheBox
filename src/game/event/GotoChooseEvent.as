package game.event
{
	public class GotoChooseEvent
	{
		/**
		 *进入选择面板
		 */		
		public static const MISSION_CHOOOSE_BAN :String = "MissionChooseBan";
		
		/**
		 *进入选择面板
		 */		
		public static const PLAY_GOTO_MISSION :String = "PlayGotoMission";
		/**
		 *进入选择面板
		 */		
		public static const PLAY_GOTO_MISSION_FOR_COMMAND :String = "PlayGotoMissionForCommand";
		/**
		 *进入选择面板
		 */		
		public static const PLAY_GOTO_MISSION_FOR_MEDIATOR :String = "PlayGotoMissionForMediator";
		
		
		/**
		 *进入选择面板
		 */		
		public static const MISSION_CHOOOSE_BAN_NEXT_MISSION :String = "MissionChooseBanNextMission";
		/**
		 *进入选择面板
		 */		
		public static const MISSION_CHOOOSE_BAN_NEXT_MISSION_FOR_COMMAND :String = "missionchooseBanNextMissionForCommand";
//		/**
//		 *进入选择面板
//		 */		
//		public static const MISSION_CHOOOSE_BAN_NEXT_MISSION_FOR_MEDIATOR :String = "loginGameForMediator";
		
		
		public function GotoChooseEvent()
		{
		}
	}
}