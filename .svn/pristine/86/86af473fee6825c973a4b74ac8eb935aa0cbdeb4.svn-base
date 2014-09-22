package game.model
{
	import com.utils.Cookie;
	import com.utils.MyLoaderManager;
	import com.utils.LocalCacher;
	
	import nape.geom.Vec2;
	
	import org.robotlegs.mvcs.Actor;
	
	public class MissionModel extends Actor
	{
		private var mapXml:XML;
		/**
		 * 通的关数
		 */		
		private var missionNum:int = 0;
		
		private var currentMissionNum:int = 0;
		public var missions:Array = new Array;
//		/**
//		 *通关的Data 
//		 */		
//		public var missionArrayData:Array = new Array();
		
		private var hashMap:LocalCacher = new LocalCacher();
		private var cookie:Cookie = new Cookie("currentMission0");
		public function MissionModel()
		{
			mapXml = MyLoaderManager.getInstance().getXML("Map.xml");
			loadMission();
		}
		
		public function setMissionNum(value:int):void{
			cookie.setCookie("currentMission0",value);
			missionNum = value;
		}
		public function getMissionNum():int{
			if(cookie.getCookie("currentMission0")){
				return cookie.getCookie("currentMission0") as int;
			}else{
				return missionNum;
			}
//			return 29;
		}
		public function getCurrentMissionNum():int{
			return currentMissionNum;
		}
		public function setCurrentMissionNum(value:int):void{
			currentMissionNum = value;
		}
		private function loadMission():void{
			for each (var i:XML in mapXml.mission){
				var obj:Object = {};
				var stones:Array = new Array();
				var draws:Array = new Array();
				var woods:Array = new Array();
				var boxs:Array = new Array();
				var joints:Array = new Array();
				var jointWoods:Array = new Array();
				var jointWoodWithMotors:Array = new Array();
				var circles:Array = new Array();
				var circleWithMotors:Array = new Array();
				var booms:Array = new Array();
				for each (var j:XML in i.item) 
				{
					if(j.@type == "stone"){
						var vexList:Vector.<Vec2> = new Vector.<Vec2>();
						for each (var point:XML in j.point) 
						{
							var s:Vec2 = new Vec2(point.@x,point.@y);
							vexList.push(s);
						}
						stones.push({x:j.@x,y:j.@y,vexList:vexList});
						
					}
					if(j.@type == "draw")
						draws.push({x:j.@x,y:j.@y,width:j.@width,height:j.@height});
					if(j.@type == "wood")
						woods.push({x:j.@x,y:j.@y,width:j.@width,height:j.@height});
					if(j.@type == "box")
						boxs.push({x:j.@x,y:j.@y,width:j.@width,height:j.@height});
					if(j.@type == "joint")
						joints.push({x:j.@x,y:j.@y});
					if(j.@type == "jointWood")
						jointWoods.push({posX:j.@posX,posY:j.@posY,x:j.@x,y:j.@y,width:j.@width,height:j.@height});
					if(j.@type == "jointWoodWithMotor")
						jointWoodWithMotors.push({posX:j.@posX,posY:j.@posY,x:j.@x,y:j.@y,width:j.@width,height:j.@height});
					if(j.@type == "circle")
						circles.push({x:j.@x,y:j.@y,r:j.@r});
					if(j.@type == "circleWithMotor")
						circleWithMotors.push({x:j.@x,y:j.@y,r:j.@r});
					if(j.@type == "boom")
						booms.push({x:j.@x,y:j.@y,width:j.@width,height:j.@height});
				}
				obj.stones = stones;
				obj.draws = draws;
				obj.woods = woods;
				obj.boxs = boxs;
				obj.joints = joints;
				obj.jointWoods = jointWoods;
				obj.jointWoodWithMotors = jointWoodWithMotors;
				obj.circles = circles;
				obj.circleWithMotors = circleWithMotors;
				obj.booms = booms;
				missions.push(obj);
			}
			trace(missions[0].woods.length);
			
		}
	}
}
//<mission id="16">
//	<item type="draw" x="335" y="0" width="305" height="320" />
//	<item type="box" x="80" y="230" width="95" height="75" />
//	<item type="wood" x="86" y="275" width="120" height="20" />
//	<item type="wood" x="79" y="295" width="120" height="20" />
//	<item type="wood" x="88" y="315" width="200" height="20" />
//	<item type="wood" x="85" y="335" width="120" height="20" />
//	<item type="wood" x="78" y="355" width="120" height="20" />
//	<item type="wood" x="83" y="375" width="120" height="20" />
//	<item type="wood" x="87" y="395" width="120" height="20" />
//	<item type="wood" x="82" y="415" width="120" height="20" />
//	<item type="circle" x="562" y="380" r="50" />
//	<item type="circle" x="407" y="390" r="40" />
//	<item type="circle" x="275" y="400" r="30" />
//
//	<item type="stone" x="285" y="0">
//		<point x="0" y="0" />
//		<point x="50" y="0" />
//		<point x="50" y="320" />
//		<point x="0" y="320" />
//		<point x="0" y="0" />
//	</item>
//	<item type="stone" x="500" y="425">
//		<point x="0" y="0" />
//		<point x="100" y="0" />
//		<point x="100" y="55" />
//		<point x="0" y="55" />
//		<point x="0" y="0" />
//	</item>
//	<item type="stone" x="0" y="425">
//		<point x="0" y="0" />
//		<point x="440" y="0" />
//		<point x="440" y="55" />
//		<point x="0" y="55" />
//		<point x="0" y="0" />
//	</item>
//</mission>