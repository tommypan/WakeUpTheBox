package game.view
{
	import com.utils.MyLoaderManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import game.event.ChooseBackEvent;
	import game.event.MissionEvent;
	import game.view.button.BackButton;
	
	public class ChooseScene extends Sprite
	{
		private var sp1:Sprite;
		private var spArray:Array = new Array();
		private var sp:BackButton = new BackButton();
		private var _missionNum:int;
		private var txt:TextField;
		public function ChooseScene(mission:int)
		{
			_missionNum = mission;
			for(var i:int = 0;i<5;i++){
				for(var j:int = 0; j<6;j++){
					sp1 = new Sprite();
					spArray.push(sp1);
					if((6*i+j)<=mission){
						draw(sp1,100*j+38,90*i+10,0xff0000);
					}else{
						draw(sp1,100*j+38,90*i+10,0xffff00);
					}
					sp1.addEventListener(MouseEvent.CLICK,onClick);
					addChild(sp1);
					spArray[6*i+j].name = (6*i+j).toString();
//					txt = new TextField();
//					txt.text = (6*i+j+1).toString();
//					txt.x = 100*j+38;
//					txt.y = 90*i+10;
//					txt.selectable = false;
//					addChild(txt);
				}
			}
			this.addChild(sp);
			sp.x = 540;
			sp.y = 430;
			sp.addEventListener(MouseEvent.CLICK,onBackClick);
		}
		
		private function onBackClick(event:MouseEvent):void
		{
			trace("backTo1");
			dispatchEvent(new Event(ChooseBackEvent.CHOOOSE_BAN_BACK_TO_PALY));
		}
		
		private function onClick(event:MouseEvent):void
		{
			trace(event.target);
			trace(event.target.name);
			if(_missionNum >= int(event.target.name)){
				var evt:MissionEvent = new MissionEvent(MissionEvent.GOTO_NUM_MISSION);
				evt.missionNum = event.target.name;
				dispatchEvent(evt);
			}
		}
		private function draw(sp:Sprite,xx:int,yy:int,color:int):void{
			sp.graphics.beginFill(color);
			sp.graphics.drawRoundRect(xx,yy,65,60,5,5);
			sp.graphics.endFill();
		}
		public function remove():void{
			this.visible = false;
			sp.removeEventListener(MouseEvent.CLICK,onBackClick);
			for(var i:int=0;i<30;i++){
				(spArray[i] as Sprite).removeEventListener(MouseEvent.CLICK,onClick);
			}
		}
		public function addtoStage(missionNum:int):void{
			this.visible = true;
//			sp.addEventListener(MouseEvent.CLICK,onBackClick);
			for(var i:int=0;i<missionNum;i++){
				(spArray[i] as Sprite).addEventListener(MouseEvent.CLICK,onClick);
			}
		}
	}
}