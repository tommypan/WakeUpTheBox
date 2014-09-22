package game.view
{
	import com.utils.CreateAllTheThing;
	import com.utils.LoadMusic;
	import com.utils.LoadSWF;
	import com.utils.MyLoaderManager;
	import com.utils.StageProxy;
	import com.utils.Stats;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.GraphicsPathCommand;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import game.event.GotoChooseEvent;
	import game.event.MissionEvent;
	import game.view.button.MenuButton;
	import game.view.button.ResetButton;
	
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.constraint.Constraint;
	import nape.geom.GeomPoly;
	import nape.geom.GeomPolyList;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyList;
	import nape.phys.Material;
	import nape.shape.Polygon;
	import nape.space.Space;
	
	public class DrawScene extends Sprite
	{
		private const segmentLength:Number = 10;
		private const MASS:Number = 0.3;
		private const PICNUMBER:uint = 4;
		
		private var drawType:CbType;
		private var boxType:CbType;
		private var boomType:CbType;
		private var drawVSboxListener: InteractionListener;
		private var drawVSboomListener: InteractionListener;
		private var boxFace:BoxFace;
		private var isCollision:Boolean = true;
		private var isCollision2:Boolean = true;
		
		private var napeWorld:Space;
		private var vertice:Vector.<Vec2>;
		private var layer:Sprite;
		private var isDrawing:Boolean = false;
		private var curPoint:Point;
		private var prePoint:Point;
		private var i:int=0;
		
		private var boxOfMain:Body;
		private var menuSprite:MenuButton;
		private var resetSprite:ResetButton;
		private	var bg:Bitmap;
		
		private var drawSp:Sprite = new Sprite();
		private var alertPanel:AlertPanel;
		private var _obj:Object;
		private var spriteCommand:Vector.<int>;
		private var spriteData:Vector.<Number>;
		
		private var jointPosX1:Number = -100;
		private var jointPosY1:Number = -100;
		
		private var jointPosX2:Number = -100;
		private var jointPosY2:Number = -100;
		private	var pointBmp2:Bitmap ;
		private	var pointBmp1:Bitmap ;
		private var isWrongDrawing:Boolean = false;
		
		private var mouseXX:Number;
		private var mouseYY:Number;
		private var num1:uint;
		
		private var boomBody:Body;
		private var boomBmp:Bitmap;
		private var boomBody2:Body;
		private var boomBmp2:Bitmap;
		public function DrawScene()
		{
		}
		
		private function init():void{
			num1 = uint(Math.random()*10%PICNUMBER)+1;
			boxFace = new BoxFace(num1);
			jointPosX1 = -100;
			jointPosY1 = -100;
			
			jointPosX2 = -100;
			jointPosY2 = -100;
			bg = new Bitmap(MyLoaderManager.getInstance().getBmp("heaven"));
			addChild(bg);
			
			menuSprite = new MenuButton();
			StageProxy.stage.addChild(menuSprite);
			menuSprite.x = 430;
			menuSprite.y = 10;
			
			resetSprite = new ResetButton();
			StageProxy.stage.addChild(resetSprite);
			resetSprite.x = 540;
			resetSprite.y = 10;
			
			menuSprite.addEventListener(MouseEvent.CLICK,onMenuClick);
			resetSprite.addEventListener(MouseEvent.CLICK,onResetClick);
			
			alertPanel = new AlertPanel(num1);
			alertPanel.x = 100;
			alertPanel.y = 50;
			StageProxy.stage.addChild(alertPanel);
			alertPanel.visible = false;
			alertPanel.nextBtn.addEventListener(MouseEvent.CLICK,onNextBtnClick);
			alertPanel.goToMenuBtn.addEventListener(MouseEvent.CLICK,onGotoMenuBtnClick);
		}
		
		private function onMenuClick(event:Event):void
		{
			clear();
			menuSprite.removeEventListener(MouseEvent.CLICK,onMenuClick);
			resetSprite.removeEventListener(MouseEvent.CLICK,onResetClick);
			this.parent.removeChild(this);
			this.dispatchEvent(new Event(GotoChooseEvent.MISSION_CHOOOSE_BAN));
		}
		private function clear():void{
			napeWorld.clear();
			CreateAllTheThing.napeDebug.clear();
			CreateAllTheThing.napeDebug.flush();
			
			if(boomBmp!=null&&StageProxy.stage.contains(boomBmp)){
				napeWorld.bodies.remove(boomBody);
				StageProxy.stage.removeChild(boomBmp);
			}
			if(boomBmp2!=null&&StageProxy.stage.contains(boomBmp2)){
				napeWorld.bodies.remove(boomBody2);
				StageProxy.stage.removeChild(boomBmp2);
			}
			StageProxy.stage.removeChild(menuSprite);
			StageProxy.stage.removeChild(resetSprite);
			this.removeChild(bg);
			StageProxy.stage.removeChild(alertPanel);
			if(napeWorld == null){
				return;
			}
			for(var k:int=0;k<CreateAllTheThing.mapList.length;k++){
				napeWorld.bodies.remove(CreateAllTheThing.mapList[k]);
			}
			for(var i:int=0;i<CreateAllTheThing.bmpArray.length;i++){
				StageProxy.stage.removeChild(CreateAllTheThing.bmpArray[i]);
			}
			CreateAllTheThing.bmpArray = null;
			napeWorld = null;
			vertice = null;
			layer = null;
			prePoint = null;
			curPoint = null;
			alertPanel.goToMenuBtn.removeEventListener(MouseEvent.CLICK,onGotoMenuBtnClick);
			alertPanel.nextBtn.removeEventListener(MouseEvent.CLICK,onNextBtnClick);
			StageProxy.stage.removeEventListener(Event.ENTER_FRAME, loop);
			StageProxy.stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseEventHanlder);
			StageProxy.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseEventHanlder);
			StageProxy.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseEventHanlder);
		}
		
		
		private function onResetClick(event:Event):void
		{
			napeWorld.clear();
			CreateAllTheThing.napeDebug.clear();
			CreateAllTheThing.napeDebug.flush();
			
			this.removeChild(drawSp);
			for(var n:int=0;n<CreateAllTheThing.constrainsList.length;n++){
				napeWorld.constraints.remove(CreateAllTheThing.constrainsList[n]);
			}
			for(var i:int=0;i<CreateAllTheThing.bmpArray.length;i++){
				StageProxy.stage.removeChild(CreateAllTheThing.bmpArray[i]);
			}
			for(var k:int=0;k<CreateAllTheThing.mapList.length;k++){
				trace(k);
				napeWorld.bodies.remove(CreateAllTheThing.mapList[k]);
			}
			
			if(boomBmp!=null&&StageProxy.stage.contains(boomBmp)){
				napeWorld.bodies.remove(boomBody);
				StageProxy.stage.removeChild(boomBmp);
			}
			if(boomBmp2!=null&&StageProxy.stage.contains(boomBmp2)){
				napeWorld.bodies.remove(boomBody2);
				StageProxy.stage.removeChild(boomBmp2);
			}
			
			CreateAllTheThing.bmpArray = null;
			CreateAllTheThing.mapList = null;
			CreateAllTheThing.constrainsList = null;
			createNewMap(_obj);
		}
		
		public function createMap(obj:Object):void{
			_obj = obj;
			init();
			if(napeWorld !=null){
				return;
			}
			drawType = new CbType();
			boxType = new CbType();
			CreateAllTheThing.initialize(StageProxy.stage);
			CreateAllTheThing.bmpArray = new Vector.<DisplayObject>();
			napeWorld=CreateAllTheThing.createWorld(0,600);
			addChild(CreateAllTheThing.createDebug().display);
			
			createNewMap(obj);
			
			drawVSboxListener=new InteractionListener(CbEvent.BEGIN,InteractionType.COLLISION,drawType,boxType,onDrawVsBox);
			napeWorld.listeners.add(drawVSboxListener);
			StageProxy.stage.addEventListener(Event.ENTER_FRAME, loop);
			StageProxy.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseEventHanlder);
			StageProxy.stage.addEventListener(MouseEvent.MOUSE_UP, mouseEventHanlder);
			StageProxy.stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseEventHanlder);
			vertice=new Vector.<Vec2>();
			layer=new Sprite();
			addChild(layer);
			
		}
		
		private function createNewMap(obj:Object):void{
			isCollision2 = true;
			isCollision = true;
			CreateAllTheThing.bmpArray = new Vector.<DisplayObject>();
			CreateAllTheThing.mapList = new Vector.<Body>();
			CreateAllTheThing.constrainsList = new Vector.<Constraint>();
			if(obj.draws != undefined){
				for(i=0;i<obj.draws.length;i++){
					drawSp = CreateAllTheThing.createDraw(obj.draws[i].x,obj.draws[i].y,obj.draws[i].width,obj.draws[i].height);
					addChild(drawSp);
				}
			}
			if(obj.woods != undefined){
				for(i=0;i<obj.woods.length;i++){
					CreateAllTheThing.createWood(obj.woods[i].x,obj.woods[i].y,obj.woods[i].width,obj.woods[i].height,MyLoaderManager.getInstance().getBmp("wood"));
				}
			}
			if(obj.boxs != undefined){
				for(i=0;i<obj.boxs.length;i++){
					boxOfMain = CreateAllTheThing.createBox(obj.boxs[i].x,obj.boxs[i].y,obj.boxs[i].width,obj.boxs[i].height,boxFace);
					boxOfMain.cbTypes.add(boxType);
				}
			}
			if(obj.booms != undefined){
				boomType = new CbType();
				drawVSboomListener=new InteractionListener(CbEvent.BEGIN,InteractionType.COLLISION,drawType,boomType,onBoom);
				if(obj.booms.length == 1){
					boomBmp = new Bitmap(MyLoaderManager.getInstance().getBmp("boom"));
					boomBody = CreateAllTheThing.createBoom(obj.booms[0].x,obj.booms[0].y,obj.booms[0].width,obj.booms[0].height,boomBmp);
					boomBody.cbTypes.add(boomType);
					
				}
				trace("obj.booms.length   ",obj.booms.length);
				if(obj.booms.length == 2){
					boomBmp = new Bitmap(MyLoaderManager.getInstance().getBmp("boom"));
					boomBody = CreateAllTheThing.createBoom(obj.booms[0].x,obj.booms[0].y,obj.booms[0].width,obj.booms[0].height,boomBmp);
					boomBody.cbTypes.add(boomType);
					boomBmp2 = new Bitmap(MyLoaderManager.getInstance().getBmp("boom"));
					boomBody2 = CreateAllTheThing.createBoom(obj.booms[1].x,obj.booms[1].y,obj.booms[1].width,obj.booms[1].height,boomBmp2);
					boomBody2.cbTypes.add(boomType);
					
				}
				napeWorld.listeners.add(drawVSboomListener);
			}
			if(obj.stones != undefined){
				for(i=0;i<obj.stones.length;i++){
					CreateAllTheThing.createWrapWall(obj.stones[i].x,obj.stones[i].y,obj.stones[i].vexList,MyLoaderManager.getInstance().getBmp("wall2"));
				}
			}
			if(obj.jointWoods != undefined){
				for(i=0;i<obj.jointWoods.length;i++){
					CreateAllTheThing.createJointWood(obj.jointWoods[i].posX,obj.jointWoods[i].posY,obj.jointWoods[i].x,obj.jointWoods[i].y,obj.jointWoods[i].width,obj.jointWoods[i].height,MyLoaderManager.getInstance().getBmp("wood"));
					jointPosX1 = obj.jointWoods[i].posX;
					jointPosY1 = obj.jointWoods[i].posY;
					pointBmp1 = new Bitmap(MyLoaderManager.getInstance().getBmp("point"));
					pointBmp1.x = jointPosX1-16;
					pointBmp1.y = jointPosY1-22;
					StageProxy.stage.addChild(pointBmp1);
					CreateAllTheThing.bmpArray.push(pointBmp1);
				}
			}
			if(obj.jointWoodWithMotors != undefined){
				for(i=0;i<obj.jointWoodWithMotors.length;i++){
					CreateAllTheThing.createJointWoodWithMotor(obj.jointWoodWithMotors[i].posX,obj.jointWoodWithMotors[i].posY,obj.jointWoodWithMotors[i].x,obj.jointWoodWithMotors[i].y,obj.jointWoodWithMotors[i].width,obj.jointWoodWithMotors[i].height,MyLoaderManager.getInstance().getBmp("wood"));
					jointPosX1 = obj.jointWoodWithMotors[i].posX;
					jointPosY1 = obj.jointWoodWithMotors[i].posY;
					pointBmp1 = new Bitmap(MyLoaderManager.getInstance().getBmp("point"));
					pointBmp1.x = jointPosX1-16;
					pointBmp1.y = jointPosY1-22;
					StageProxy.stage.addChild(pointBmp1);
					CreateAllTheThing.bmpArray.push(pointBmp1);
				}
			}
			if(obj.joints != undefined){
				if(obj.joints.length == 1){
					trace(obj.joints[0].x,obj.joints[0].y);
					jointPosX1 = obj.joints[0].x;
					jointPosY1 = obj.joints[0].y;
					pointBmp1 = new Bitmap(MyLoaderManager.getInstance().getBmp("point"));
					pointBmp1.x = jointPosX1-16;
					pointBmp1.y = jointPosY1-22;
					StageProxy.stage.addChild(pointBmp1);
					CreateAllTheThing.bmpArray.push(pointBmp1);
				}
				if(obj.joints.length == 2){
					jointPosX1 = obj.joints[0].x;
					jointPosY1 = obj.joints[0].y;
					pointBmp1 = new Bitmap(MyLoaderManager.getInstance().getBmp("point"));
					pointBmp1.x = jointPosX1-16;
					pointBmp1.y = jointPosY1-22;
					StageProxy.stage.addChild(pointBmp1);
					CreateAllTheThing.bmpArray.push(pointBmp1);
					
					jointPosX2 = obj.joints[1].x;
					jointPosY2 = obj.joints[1].y;
					pointBmp2 = new Bitmap(MyLoaderManager.getInstance().getBmp("point"));
					pointBmp2.x = jointPosX2-16;
					pointBmp2.y = jointPosY2-22;
					StageProxy.stage.addChild(pointBmp2);
					CreateAllTheThing.bmpArray.push(pointBmp2);
				}
			}
			if(obj.circles != undefined){
				for(i=0;i<obj.circles.length;i++){
					if(obj.circles[i].r == 50){
						CreateAllTheThing.createCircle(obj.circles[i].x,obj.circles[i].y,obj.circles[i].r,new Bitmap(MyLoaderManager.getInstance().getBmp("bigCircle")));
					}
					if(obj.circles[i].r == 40){
						CreateAllTheThing.createCircle(obj.circles[i].x,obj.circles[i].y,obj.circles[i].r,new Bitmap(MyLoaderManager.getInstance().getBmp("middle")));
					}
					if(obj.circles[i].r == 30){
						CreateAllTheThing.createCircle(obj.circles[i].x,obj.circles[i].y,obj.circles[i].r,new Bitmap(MyLoaderManager.getInstance().getBmp("small")));
					}
				}
			}
			if(obj.circleWithMotors != undefined){
				for(i=0;i<obj.circleWithMotors.length;i++){
					if(obj.circleWithMotors[i].x == 90){
						CreateAllTheThing.createCircleWithMotor(obj.circleWithMotors[i].x,obj.circleWithMotors[i].y,obj.circleWithMotors[i].r,new Bitmap(MyLoaderManager.getInstance().getBmp("wheel")),true);
					}
					if(obj.circleWithMotors[i].x == 275){
						CreateAllTheThing.createCircleWithMotor(obj.circleWithMotors[i].x,obj.circleWithMotors[i].y,obj.circleWithMotors[i].r,new Bitmap(MyLoaderManager.getInstance().getBmp("wheel")));
					}
					if(obj.circleWithMotors[i].x == 460){
						CreateAllTheThing.createCircleWithMotor(obj.circleWithMotors[i].x,obj.circleWithMotors[i].y,obj.circleWithMotors[i].r,new Bitmap(MyLoaderManager.getInstance().getBmp("wheel")));
					}
				}
			}
		}
		
		
		private function onDrawVsBox(cb:InteractionCallback):void
		{
			trace("--------pengzhuan");
			if(isCollision){
				boxFace.exchangePic();
				StageProxy.stage.addChild(boxFace);	
				isCollision=false;
			}
		}
		private function onBoom(cb:InteractionCallback):void{
			if(isCollision2){
				trace(cb.int1.castBody.mass);
				if(cb.int1.castBody.mass<MASS){
					isCollision2 = true;
					return;
				}
				var a2:Vec2 = cb.int2.castBody.position;
				
				var a1x:Number = cb.int1.castBody.position.x;
				var a1y:Number = cb.int1.castBody.position.y;
				var a2x:Number = cb.int2.castBody.position.x;
				var a2y:Number = cb.int2.castBody.position.y;
				cb.int1.castBody.applyImpulse(new Vec2( (a1x-a2x)*20 , (a1y-a2y)*20 ),cb.int1.castBody.position);
				StageProxy.stage.removeChild(cb.int2.castBody.userData.graphic);
				napeWorld.bodies.remove(cb.int2.castBody);
				LoadSWF.getInstance().playBoomSWF(a2x-60,a2y-55);
				LoadMusic.getInstance().playBoomMusic();
				
				for(var i:int=0;i<CreateAllTheThing.mapList.length;i++){
					trace(distanceOfPoint(CreateAllTheThing.mapList[i].position,a2),"11111111111111111111111111");
					if(distanceOfPoint(CreateAllTheThing.mapList[i].position,a2)<150){
						if(CreateAllTheThing.mapList[i].mass>MASS){
							CreateAllTheThing.mapList[i].applyImpulse(new Vec2( (CreateAllTheThing.mapList[i].position.x-a2x)*20 , (CreateAllTheThing.mapList[i].position.y-a2y)*20 ),CreateAllTheThing.mapList[i].position);
						}
					}
				}
				if(boomBmp2 == null){
					isCollision2 = false;
				}else{
					isCollision2 = true;
				}
			}
		}
		
		private function distanceOfPoint(a1:Vec2,a2:Vec2):Number{
			return Math.sqrt((a1.x - a2.x)*(a1.x - a2.x)+(a1.y - a2.y)*(a1.y - a2.y));
		}
		protected function mouseEventHanlder(event:MouseEvent):void
		{
			switch(event.type){
				case MouseEvent.MOUSE_DOWN:
				{
					mouseXX = mouseX;
					mouseYY = mouseY;
					trace("--------------------moouseDown");
					spriteCommand = new Vector.<int>();
					spriteData = new Vector.<Number>();
					
					
					isDrawing=true;
					
					spriteCommand.push(GraphicsPathCommand.MOVE_TO);
					spriteData.push(mouseX);
					spriteData.push(mouseY);
					layer.graphics.lineStyle(2);///////////////////////////////////////////
					layer.graphics.moveTo(mouseX, mouseY);
					curPoint = new Point(mouseX, mouseY);
					prePoint = curPoint.clone();
					vertice.push(new Vec2(mouseX, mouseY));
					break;
				}
				case MouseEvent.MOUSE_UP:
				{
					//					if(mouseXX == mouseX&&mouseYY == mouseY){
					//					}
					trace("-------------------- mouseUp");
					if(isWrongDrawing){
						layer.graphics.clear();
						spriteCommand = null;
						spriteData = null;
						isWrongDrawing = false;
						isDrawing=false;
						vertice = new Vector.<Vec2>();
						return;
					}
					
					spriteCommand.push(GraphicsPathCommand.LINE_TO);
					spriteData.push(spriteData[0]);
					spriteData.push(spriteData[1]);
					
					vertice.push(new Vec2(spriteData[0],spriteData[1]));
//					vertice[n],vertice[n+1]
					var v1:Vec2;
					var v2:Vec2;
					v1 = vertice[0];
					v2 = vertice[1];
					for(var b:int = 2;b<vertice.length-2;++b){
						if(isPoint(v1,v2,vertice[b],vertice[b+1])){
							trace("有 交点  搞毛啊~！");
							layer.graphics.clear();
							spriteCommand = null;
							spriteData = null;
							isWrongDrawing = false;
							isDrawing=false;
							vertice = new Vector.<Vec2>();
							return;
						}
					}
					for(var n:int =1;n<vertice.length-3;++n){
						v1 = vertice[n];
						v2 = vertice[n+1];
						for(var k:int = n+2;k<vertice.length-1;++k){
							if(isPoint(v1,v2,vertice[k],vertice[k+1])){
								trace("有 交点  搞毛啊~！");
								layer.graphics.clear();
								spriteCommand = null;
								spriteData = null;
								isWrongDrawing = false;
								isDrawing=false;
								vertice = new Vector.<Vec2>();
								return;
							}
						}
					}
					
					var canvas:Sprite = new Sprite();
					canvas.graphics.clear();
					canvas.graphics.lineStyle(3, 0x4D370B);
					canvas.graphics.beginBitmapFill(MyLoaderManager.getInstance().getBmp("wood"));
					canvas.graphics.drawPath(spriteCommand, spriteData);
					canvas.graphics.endFill();
					StageProxy.stage.addChild(canvas);
					
					isDrawing=false;
					layer.graphics.clear();
					var body:Body=new Body();
					var geomPoly:GeomPoly=new GeomPoly(vertice);
					var polyShapeList:GeomPolyList=geomPoly.convexDecomposition();
					polyShapeList.foreach(function(shape:*):void{
						body.shapes.push(new Polygon(shape));
					});
					body.align();
					body.setShapeMaterials(Material.wood());
					trace(body.mass,"mass ssssssssssssssss");
					if(body.mass == 0){
						StageProxy.stage.removeChild(canvas);
						spriteCommand = null;
						spriteData = null;
						isWrongDrawing = false;
						isDrawing=false;
						vertice = new Vector.<Vec2>();
						return;
					}
					
					
					body.space=napeWorld;
					body.cbTypes.add(drawType);
					
					var position:Vec2=body.position;
					body.userData.graphicOffset = new Vec2( -position.x,-position.y);
					body.userData.graphic = canvas;
					CreateAllTheThing.mapList.push(body);
					if(body.contains(new Vec2(jointPosX1,jointPosY1))){
						CreateAllTheThing.createJointDrawWood(jointPosX1,jointPosY1,body);
						StageProxy.stage.addChild(pointBmp1);
					}
					if(body.contains(new Vec2(jointPosX2,jointPosY2))){
						CreateAllTheThing.createJointDrawWood(jointPosX2,jointPosY2,body);
						StageProxy.stage.addChild(pointBmp2);
					}
					CreateAllTheThing.bmpArray.push(canvas);
					vertice = new Vector.<Vec2>();
					spriteCommand = null;
					spriteData = null;
					
					break;
				}
				case MouseEvent.MOUSE_MOVE:
				{
					if(!isDrawing) return;
					if(!(event.target == drawSp||event.target == layer)){
						layer.graphics.lineStyle(2,0xff0000);
						isWrongDrawing = true;
					}
					spriteCommand.push(GraphicsPathCommand.LINE_TO);
					spriteData.push(mouseX);
					spriteData.push(mouseY);
					
					layer.graphics.lineTo(mouseX, mouseY);
					curPoint = new Point(mouseX, mouseY);
					var distance:Number = Point.distance(prePoint, curPoint);
					if (distance >= segmentLength) {
						vertice.push(new Vec2(mouseX, mouseY ));
						prePoint = curPoint.clone();
					}
					break;
				}
			}
		}
		protected function loop(event:Event):void
		{
			CreateAllTheThing.updateWorld();
			if(boxOfMain.userData.graphic.y>480){
				NextMission();
			}
		}
		
		private function NextMission():void
		{
			menuSprite.removeEventListener(MouseEvent.CLICK,onMenuClick);
			resetSprite.removeEventListener(MouseEvent.CLICK,onResetClick);
			StageProxy.stage.addChild(alertPanel);
			alertPanel.visible = true;
		}
		
		private function onGotoMenuBtnClick(event:MouseEvent):void
		{
			clear();
			this.parent.removeChild(this);
			
			this.dispatchEvent(new Event(GotoChooseEvent.MISSION_CHOOOSE_BAN_NEXT_MISSION));
		}
		private function onNextBtnClick(event:MouseEvent):void
		{
			clear();
			trace("onNextBtnClick");
			dispatchEvent(new MissionEvent(MissionEvent.GOTO_NEXT_MISSION));
		}
		
		private function isPoint(a:Vec2,b:Vec2,c:Vec2,d:Vec2):Boolean{
			var ax:Number;
			var ay:Number;
			var bx:Number;
			var by:Number;
			var delta:Number;
			var r:Number;
			var u:Number;
			
			delta=(b.x-a.x)*(c.y-d.y)-(c.x-d.x)*(b.y-a.y);  
			if(delta==0){
				return false;
			}else{
				r=((c.x-a.x)*(c.y-d.y)-(c.x-d.x)*(c.y-a.y))/delta;    
				u=((b.x-a.x)*(c.y-a.y)-(c.x-a.x)*(b.y-a.y))/ delta;
				if((r>=0&&r<=1)&&(u>=0&&u<=1)){   
					//					p.x=a.x+r*(b.x-a.x);
					//					p.y=a.y+r*(b.y-a.y);  
					return true;
				}else 
				{    
					return false;   
				}
			}
		}
		
		
		
		
		
	}
}