package game.controller
{
	import flash.events.Event;
	
	import game.event.GotoChooseEvent;
	
	import org.robotlegs.mvcs.Command;

	public class PlayToChooseBanCommand extends Command
	{
		private var i:int = 0;
		public function PlayToChooseBanCommand()
		{
		}
		override public function execute():void
		{
			dispatch(new Event(GotoChooseEvent.PLAY_GOTO_MISSION_FOR_MEDIATOR));
		}
	}
}