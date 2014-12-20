package  
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author OnDevelopers
	 */
	public class Movement 
	{
		
		public function Movement() 
		{
			
		}
		
		public static function moveUp(speed:int, actor:Actor):void {
			actor.y_velocity = speed * -1;
		}
		public static function moveDown(speed:int, actor:Actor):void {
			actor.y_velocity = speed;
		}
		public static function moveRight(speed:int, actor:Actor):void {
			actor.direction = 1;
			actor.x_velocity = speed;
		}
		public static function moveLeft(speed:int, actor:Actor):void {
			actor.direction = -1;
			actor.x_velocity = speed * -1;
		}
		
	}

}