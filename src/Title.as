package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The title for the main menu
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class Title extends Entity
	{	
		public function Title()
		{
			x = 440;
			y = 150;
			var text = new Text("Alula");
			text.size = 200;
			graphic = text;
		}
		
	}
}