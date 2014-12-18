package  
{
	
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;

	
	/**
	 * ...
	 * @author On Studios
	 */
	public class NPCDialogueBox extends Entity
	{
		
		public function NPCDialogueBox(text_param:String, x_param:int, y_param:int) 
		{
			type = "npcDialogueBox";
			
			var glist:Graphiclist = new Graphiclist();
			
			var guiBackground:Image = new Image(new BitmapData(500, 150, false, 0x999999));
			guiBackground.x = x_param;
			guiBackground.y = y_param;
			guiBackground.alpha = 0.5;
			glist.add(guiBackground);

			var pointsText = new Text(text_param, x_param, y_param);
			pointsText.width = 200;
			pointsText.scrollX = 0;
			pointsText.scrollY = 0;
			pointsText.wordWrap = true;
			glist.add(pointsText);
			
			graphic = glist;

		}
		
	}

}