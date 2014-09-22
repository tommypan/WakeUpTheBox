package game.controller
{
	import game.event.MissionEvent;
	import game.model.MissionModel;
	import game.view.DrawScene;
	import game.view.mediator.DrawSceneMediator;
	
	import org.robotlegs.mvcs.Command;

	public class MissionCommand extends Command
	{
		[Inject]
		public var missionModel :MissionModel;
		[Inject]
		public var evt2:MissionEvent;
		
		private var flag:int = 0;
		public function MissionCommand()
		{
		}
		override public function execute():void
		{
			
			contextView.addChild(new DrawScene());
			missionModel.setCurrentMissionNum(evt2.missionNum);
//			var landi:LandingCommand = new LandingCommand();
//			landi.cc
			
			trace("选择的关卡数 MissionCommand",evt2.missionNum);
//			missionModel.setMissionNum(evt2.missionNum);
			
			var evt:MissionEvent = new MissionEvent(MissionEvent.GOTO_NUM_MISSION_FOR_MEDIATOR);
			evt.mapData = missionModel.missions[evt2.missionNum];
			dispatch(evt);
			
			
		}
	}
}