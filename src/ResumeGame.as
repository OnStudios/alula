package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The pause screen options button
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	
	public class ResumeGame extends Entity
	{	
		
		var text = new Text("Resume");
		
		public function ResumeGame()
		{
			x = 475;
			y = 500;
			text.size = 40;
			graphic = text;
			type = "pause_button";
			name = "resume_game";
			// set hitbox
			setHitboxTo(graphic);
			
		}
		override public function update():void {
            text.color = 0xFFFFFF;
             
            if (collidePoint(x, y, world.mouseX, world.mouseY))
            {
                text.color = 0x666666;
                 
                 
                if (Input.mousePressed)
                {
 
                    text.color = 0xFF000000;
                     
                    
					// First, we will create an empty array.
					var enemyList:Array = [];

					// Then, we populate the array with all existing Enemy objects!
					world.getType("pause_button", enemyList);

					// Finally, we can loop through the array and call each Enemy's die() function.
					for each (var e:Entity in enemyList)
					{
						FP.world.remove(e);
					}
	
                    return
                }
            }
		}
	}
	
}