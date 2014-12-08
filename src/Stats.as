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
		private static var location:int = 0;
		
		public function Stats() 
		{
			name = "stats";
		}
		
		override public function update():void {
			time += 1;
		}
		
		public static function getTime():int {
			return time;
		}
		public static function getLocation():int {
			return location;
		}
		public static function setLocation(new_loc:int):void {
			location = new_loc;
		}

	}

}