package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The title for the main menu
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class AboutPage extends Entity
	{	
		public function AboutPage()
		{
			x = 440;
			y = 150;
			var text = new Text("We are Indie");
			text.size = 200;
			graphic = text;
		}
		
	}
}