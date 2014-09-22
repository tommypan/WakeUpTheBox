package game.controller
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import game.event.GotoChooseEvent;
	import game.model.MissionModel;
	import game.view.ChooseScene;
	import game.view.mediator.ChooseSceneMediator;
	
	import org.robotlegs.mvcs.Command;
	
	public class MissionChooseBan2Command extends Command
	{
		[Inject]
		public var missionModel:MissionModel;
		public function MissionChooseBan2Command()
		{
		}
		override public function execute():void
		{
			contextView.getChildByName("play").visible = false;
			
			if(missionModel.getMissionNum() == missionModel.getCurrentMissionNum() && missionModel.getMissionNum()!=30){
				missionModel.setMissionNum(missionModel.getMissionNum()+1);
			}
			contextView.addChild(new ChooseScene(missionModel.getMissionNum()));
		}
	}
}