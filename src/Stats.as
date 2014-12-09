package  
{
	
	import net.flashpunk.Entity;
	
	
	/**
	 * ...
	 * @author On Studios
	 */
	public class Stats extends Entity
	{
		
		private static var time:int = 0;
		private static var paused:Boolean = false;
		//This is basically the player's location in the world, not his location on the screen
		private static var location:int = 0;

		public function Stats() 
		{
			name = "stats";
		}
		
		override public function update():void {
			if (!paused) {
				time += 1;
			}
		}
		
		public static function getTime():int {
			return time;
		}
		public static function getPaused():Boolean {
			return paused;
		}
		public static function setPaused(bool:Boolean):void {
			paused = bool;
		}
		public static function getLocation():int {
			return location;
		}
		public static function setLocation(new_loc:int):void {
			location = new_loc;
		}

		
	}

}