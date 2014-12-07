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
		
	}

}