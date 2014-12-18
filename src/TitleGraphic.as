package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The title for the main menu
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class TitleGraphic extends Entity
	{	
		public function TitleGraphic()
		{
			x = 440;
			y = 150;
			var text = new Text("Alula");
			text.size = 200;
			graphic = text;
		}
		
	}
}