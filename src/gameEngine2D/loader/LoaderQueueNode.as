package gameEngine2D.loader
{
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	
	import gameEngine2D.ge2d;
	
	use namespace ge2d;
	
	/**
	 * 链队列的节点信息
	 *@author as3Lover_ph
	 *@date 2013-1-22
	 */
	public class LoaderQueueNode
	{
		//-----------------------逻辑存储--------------------------------------------------
		/**链表下一个节点域*/
		ge2d var next :LoaderQueueNode;
		
		//----------------------节点信息-------------------------------------------------
		/**链表节点自身存储信息*/
		ge2d var data :Object = {};
		
		public function LoaderQueueNode()
		{
		}
		
		
	}
}