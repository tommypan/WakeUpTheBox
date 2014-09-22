package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import game.GameContext;
	
	[SWF(width="640",height="480",frameRate="60",backgroundColor="#2f2f2f")]
	
	public class WakeUpTheBox extends Sprite
	{
		private var context:GameContext;
		public function WakeUpTheBox()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			context = new GameContext(this);
			
			
		}
	}
}