package game.controller
{
	import game.event.MissionEvent;
	import game.model.MissionModel;
	import game.view.DrawScene;
	
	import org.robotlegs.mvcs.Command;

	public class NextMissionCommand extends Command
	{
		[Inject]
		public var missionModel :MissionModel;
		public function NextMissionCommand()
		{
		}
		override public function execute():void
		{
			missionModel.setCurrentMissionNum(missionModel.getCurrentMissionNum()+1);
			
			trace("missionModel.getCurrentMissionNum() at command",missionModel.getCurrentMissionNum());
			trace("missionModel.getMissionNum() at command",missionModel.getMissionNum());
			if(missionModel.getCurrentMissionNum()>missionModel.getMissionNum()){
				missionModel.setMissionNum(missionModel.getCurrentMissionNum());
			}
			trace("missionModel.getCurrentMissionNum()",missionModel.getCurrentMissionNum());
			var evt:MissionEvent = new MissionEvent(MissionEvent.GOTO_NEXT_MISSION_FOR_MEDIATOR);
			if(missionModel.getCurrentMissionNum()>=30){
				missionModel.setCurrentMissionNum(29);
			}
			evt.mapData = missionModel.missions[missionModel.getCurrentMissionNum()];
			dispatch(evt);
		}
	}
}