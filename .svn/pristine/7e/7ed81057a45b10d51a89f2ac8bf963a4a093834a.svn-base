package com.utils
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.GraphicsPathCommand;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import nape.constraint.Constraint;
	import nape.constraint.MotorJoint;
	import nape.constraint.PivotJoint;
	import nape.geom.GeomPoly;
	import nape.geom.GeomPolyList;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyList;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.ShapeDebug;
	
	
	public class CreateAllTheThing
	{
		public function CreateAllTheThing()
		{
		}
		
		//定义Nape属性
		private static var world:Space;
		public static var napeDebug:ShapeDebug;
		private static var hand:PivotJoint;
		private static var mouseVec2:Vec2;
		//定义辅助属性
		private static var stage:Stage;
		private static var napeFps:uint=60;
		
		private static var spriteCommand:Vector.<int> = null;
		private static var spriteData:Vector.<Number> = null;
		public static var bmpArray:Vector.<DisplayObject> ;
		public static var mapList:Vector.<Body> = new Vector.<Body>();
		public static var constrainsList:Vector.<Constraint> = new Vector.<Constraint>();
		/**
		 * 初始化LDEasyNape的一些辅助属性
		 **/
		public static function initialize(stage:Stage,napeFps:uint=60):void{
			CreateAllTheThing.stage=stage;
			CreateAllTheThing.napeFps=napeFps;
		}
		/**
		 * 创建Nape物理世界
		 * @param gravityX
		 * @param gravityY
		 * @return
		 *
		 */
		public static function createWorld(gravityX:Number=0, gravityY:Number=500): Space{
			world=new Space(new Vec2(gravityX,gravityY));
			CreateAllTheThing.world=world;
			return world;
		}
		
		/**
		 * 创建Nape模拟视图对象
		 * @return 
		 * 
		 */		
		public static function createDebug():ShapeDebug{
			napeDebug= new ShapeDebug(stage.stageWidth, stage.stageHeight);
//			napeDebug.bgColour = 0xff0000;
			return napeDebug;
		}
		public static function createBox(posX:Number, posY:Number, width:Number, height:Number,userData:*=null):Body{
			var body:Body;
			body=new Body(BodyType.DYNAMIC,new Vec2( posX, posY));
			var box:Polygon=new Polygon(Polygon.box(width, height),Material.wood());
			
			body.userData.graphic=userData;
			body.userData.graphicOffset = new Vec2( -width / 2, -height / 2);
			stage.addChild(userData);
			
			body.shapes.push(box);
			
			body.space = world;
			
			mapList.push(body);
			bmpArray.push(userData);
			return body;
		}
		
		public static function createBoom(posX:Number, posY:Number, width:Number, height:Number,userData:*=null):Body{
			var body:Body;
			body=new Body(BodyType.DYNAMIC,new Vec2( posX, posY));
			var box:Polygon=new Polygon(Polygon.box(width, height),Material.wood());
			
			body.userData.graphic=userData;
			body.userData.graphicOffset = new Vec2( -(width+8) / 2, -(height+30) / 2);
			stage.addChild(userData);
			
			body.shapes.push(box);
//			body.
			body.space = world;
//			setVelocityFromTarget xiang liang
//			tangentImpulse qie xian
//			body.applyImpulse(new Vec2(0,7000),body.position);
//				body.applyAngularImpulse(
			
//			//唤醒刚体
//			body.WakeUp();
//			//设置刚体的线性速度
//			body.SetLinearVelocity(vector);
			
//			mapList.push(body);
//			bmpArray.push(userData);
			return body;
		}
		
		public static function createWood(posX:Number, posY:Number, width:Number, height:Number,userData:*=null):Body{
			
			spriteCommand = new Vector.<int>();
			spriteData = new Vector.<Number>();
			spriteCommand.push(GraphicsPathCommand.MOVE_TO);
			spriteData.push(0);
			spriteData.push(0);
			
			spriteCommand.push(GraphicsPathCommand.LINE_TO);
			spriteData.push(0+width);
			spriteData.push(0);
			
			spriteCommand.push(GraphicsPathCommand.LINE_TO);
			spriteData.push(0+width);
			spriteData.push(0+height);
			
			spriteCommand.push(GraphicsPathCommand.LINE_TO);
			spriteData.push(0);
			spriteData.push(0+height);
			
			spriteCommand.push(GraphicsPathCommand.LINE_TO);
			spriteData.push(0);
			spriteData.push(0);
			
			var body:Body;
			body=new Body(BodyType.DYNAMIC,new Vec2( posX, posY));
			var box:Polygon=new Polygon(Polygon.box(width, height),Material.wood());
			body.shapes.push(box);
			//			
			var canvas:Sprite = new Sprite();
			canvas.graphics.beginBitmapFill(userData);
			canvas.graphics.drawPath(spriteCommand, spriteData);
			canvas.graphics.endFill();
			
			body.userData.graphic=canvas;
			body.userData.graphicOffset = body.localCOM.mul(-1);
			body.userData.graphicOffset = new Vec2( -width/2,-height/2);
			
			bmpArray.push(canvas);
			stage.addChild(canvas);
			canvas.x = canvas.x-width/2;
			canvas.y = canvas.y-height/2;
			
			spriteCommand = null;
			spriteData = null;
			
			body.space = world;
			mapList.push(body);
			
			return body;
		}
		
		
		
		public static function createWrapWall(posX:Number, posY:Number,vec2List:Vector.<Vec2> ,userData:*=null):void{
			spriteCommand = new Vector.<int>();
			spriteData = new Vector.<Number>();
			spriteCommand.push(GraphicsPathCommand.MOVE_TO);
			spriteData.push(vec2List[0].x);
			spriteData.push(vec2List[0].y);
			
			for(var i:int = 1;i<vec2List.length;i++){
				spriteCommand.push(GraphicsPathCommand.LINE_TO);
				spriteData.push(vec2List[i].x);
				spriteData.push(vec2List[i].y);
			}
			
			var body:Body;
			body=new Body(BodyType.STATIC,new Vec2( posX, posY));
			
			var geomPoly:GeomPoly=new GeomPoly(vec2List);
			var polyShapeList:GeomPolyList=geomPoly.convexDecomposition();
			polyShapeList.foreach(function(shape:*):void{
				body.shapes.push(new Polygon(shape));
			});
			body.align();
			
			var canvas:Sprite = new Sprite();
			canvas.graphics.beginBitmapFill(userData);
			canvas.graphics.drawPath(spriteCommand, spriteData);
			canvas.graphics.endFill();
			body.userData.graphic=canvas;
			body.userData.graphicOffset = new Vec2( 0, 0);
			
			stage.addChild(canvas);
			bmpArray.push(canvas);
			
			var position:Vec2=body.position;
			canvas.x =posX;
			canvas.y =posY;
			spriteCommand = null;
			spriteData = null;
			
			body.space = world;		
			mapList.push(body);
		}
		
		
		public static function createDraw(posX:Number, posY:Number, width:Number, height:Number):Sprite{
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(0xff0000,0.3);
			sp.graphics.drawRect(posX,posY,width,height);
			sp.graphics.endFill();
			return sp;
		}
		
		/**
		 * 
		 * 
		 */		
		public static function updateWorld():void{
			for(var i:int=0; i<world.liveBodies.length;i++){
				var body:Body=world.liveBodies.at(i);
				var graphic:DisplayObject=body.userData.graphic;
				if(graphic!=null){
					var graphicOffset:Vec2 = body.userData.graphicOffset;
					var position:Vec2 = body.localPointToWorld(graphicOffset);
					graphic.x=position.x;;
					graphic.y=position.y;
					graphic.rotation=(body.rotation*180/Math.PI)%360;
				}
			}
			
			world.step(1/CreateAllTheThing.napeFps);
			napeDebug.clear();
			napeDebug.draw(world);
			napeDebug.flush();
		}
		
		/**
		 *创建可以任意画木头然后围绕着中心轴旋转 
		 * @param zposX
		 * @param zposY
		 * @param posX
		 * @param posY
		 * @param width
		 * @param height
		 * @param userData
		 * 
		 */		
		public static function createJointDrawWood(zposX:Number,zposY:Number,drawBody2:Body) : void {
			var body1:Body = world.world;
			var body2:Body = drawBody2;
			//x,y表示中心轴点的位置
			var anchor:Vec2 = new Vec2(zposX,zposY);
			var joint : PivotJoint = new PivotJoint(
				body1,
				body2,
				body1.worldPointToLocal(anchor),
				body2.worldPointToLocal(anchor));
			
			joint.space = world;
			constrainsList.push(joint);
			mapList.push(body1);
		}
		/**
		 *创建可以围绕中心轴旋转的木头 
		 * @param zposX
		 * @param zposY
		 * @param posX
		 * @param posY
		 * @param width
		 * @param height
		 * @param userData
		 * 
		 */		
		public static function createJointWood(zposX:Number,zposY:Number,posX:Number, posY:Number, width:Number, height:Number,userData:*=null) : void {
			var body2:Body = createWood(posX,posY,width,height,userData);
			var body1:Body = world.world;
			//x,y表示中心轴点的位置
			var anchor:Vec2 = new Vec2(zposX,zposY);
			var joint : PivotJoint = new PivotJoint(
				body1,
				body2,
				body1.worldPointToLocal(anchor),
				body2.worldPointToLocal(anchor));
			
			joint.space = world;
			mapList.push(body1);
			constrainsList.push(joint);
		}
		
		public static function createCircle(posX:Number,posY:Number,radius:Number,userData:*):void{
			var circle:Body;
			circle=new Body(BodyType.DYNAMIC,new Vec2(posX, posY));
			var shape:Circle=new Circle(radius,null,Material.wood());
			circle.userData.graphic = userData;
			stage.addChild(userData);
			circle.userData.graphicOffset = new Vec2( -radius, -radius);
			circle.shapes.push(shape);
			circle.space = world;
			
			bmpArray.push(userData);
			mapList.push(circle);
		}
		
		public static function createCircleWithMotor(posX:Number,posY:Number,radius:Number,userData:*,isMotor:Boolean = false):void{
			var body1:Body = world.world;
			var circle:Body;
			circle=new Body(BodyType.DYNAMIC,new Vec2(posX, posY));
			var shape:Circle=new Circle(radius,null,Material.sand());
			circle.userData.graphic = userData;
			stage.addChild(userData);
			circle.userData.graphicOffset = new Vec2( -radius, -radius);
			circle.shapes.push(shape);
			circle.space = world;
			
			var anchor:Vec2 = new Vec2(posX,posY);
			var joint : PivotJoint = new PivotJoint(
				body1,
				circle,
				body1.worldPointToLocal(anchor),
				circle.worldPointToLocal(anchor));
			if(isMotor){
				var motor    :MotorJoint=new MotorJoint(body1,circle,3,1);
				motor.space = world;
				constrainsList.push(motor);
			}
			
			joint.space = world;
			
			mapList.push(circle);
			mapList.push(body1);
			bmpArray.push(userData);
			constrainsList.push(joint);
		}
		
		public static function createJointWoodWithMotor(zposX:Number,zposY:Number,posX:Number, posY:Number, width:Number, height:Number,userData:*=null) : void {
			var body2:Body = createWood(posX,posY,width,height,userData);
			var body1:Body = world.world;
			//x,y表示中心轴点的位置
			var anchor:Vec2 = new Vec2(zposX,zposY);
			var joint : PivotJoint = new PivotJoint(
				body1,
				body2,
				body1.worldPointToLocal(anchor),
				body2.worldPointToLocal(anchor));
			var motor:MotorJoint=new MotorJoint(body1,body2,3,1);
			motor.space = world;
			joint.space = world;
			
			mapList.push(body1);
			constrainsList.push(joint);
			constrainsList.push(motor);
//			totalContactsImpulse
//			tangentImpulse
		}
	}
}