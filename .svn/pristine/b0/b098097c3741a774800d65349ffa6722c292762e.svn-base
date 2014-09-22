package game.controller
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import game.event.GotoChooseEvent;
	import game.model.MissionModel;
	import game.view.ChooseScene;
	import game.view.mediator.ChooseSceneMediator;
	
	import org.robotlegs.mvcs.Command;

	public class MissionChooseBanCommand extends Command
	{
		[Inject]
		public var missionModel:MissionModel;
		public function MissionChooseBanCommand()
		{
		}
		override public function execute():void
		{
			contextView.getChildByName("play").visible = false;
			
			contextView.addChild(new ChooseScene(missionModel.getMissionNum()));
		}
	}
}