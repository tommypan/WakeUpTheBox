package gameEngine2D.pool
{
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	
	
	/**
	 * 对对象池进行管理
	 *@author as3Lover_ph
	 *@date 2013-3-30
	 */
	public class ObjectPoolManager
	{
		private static var _instance :ObjectPoolManager;
		
		/**
		 * 对象池字典,键为类，值为相应对象池
		 * */
		private var _objectPoolDict:Dictionary;
		
		public function ObjectPoolManager($singlton :singltonEnforcer)
		{
			if(!$singlton)
				throw new IllegalOperationError("这是单例");
			else
			{
				
			}
		}
		
		public static function getInstance():ObjectPoolManager
		{
			_instance ||= new ObjectPoolManager(new singltonEnforcer());
			
			return _instance;
		}
		
		/**
		 *得到相应对象池 
		 * @param $class 索引键
		 * @return 返回一个对象池
		 * 
		 */		
		public function getObjectPool($class:Class):ObjectPool{
			
			
			if (!_objectPoolDict[$class])	_objectPoolDict[$class] = new ObjectPool($class);
			
			var objPool:ObjectPool;
			objPool = _objectPoolDict[$class];
			
			return (objPool);
		}
		
		/**
		 *移除相应对象池 
		 * @param $class 索引键
		 * 
		 */		
		public function removeObjectPool($class:Class):void{
			if (_objectPoolDict[$class])
			{
				var objPool:ObjectPool;
				objPool = this._objectPoolDict[$class];
				//objPool.clear();
				delete this._objectPoolDict[$class];
			}
		}
		
	}
}
internal class singltonEnforcer{}