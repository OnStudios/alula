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
		
		private var ticker:int = 0;
		
		public function NPCDialogueBox(text_param:String, x_param:int, y_param:int) 
		{
			type = "npcDialogueBox";
			
			var glist:Graphiclist = new Graphiclist();
			
			var guiBackground:Image = new Image(new BitmapData(500, 150, false, 0x999999));
			guiBackground.x = x_param;
			guiBackground.y = y_param;
			guiBackground.alpha = 0.99;
			glist.add(guiBackground);

			var pointsText = new Text(text_param, x_param + 10, y_param + 10, { width:480, height:140, wordWrap:true } );
			glist.add(pointsText);
			
			
			graphic = glist;

		}
		
		override public function update():void {
			if (ticker >= 1) {
				FP.world.remove(this);
			}
			else {
				ticker++;
			}
		}
		
	}

}