package  
{
	
	import net.flashpunk.Entity;
	
	
	/**
	 * ...
	 * @author On Studios
	 */
	public class Stats extends Entity
	{
		
		private var time:int = 0;
		
		public function Stats() 
		{
			name = "stats";
		}
		
		override public function update():void {
			time += 1;
		}
		
		public function getTime() {
			return time;
		}
		
	}

}