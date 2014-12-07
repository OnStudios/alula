package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The new game button
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	
	public class NewGameButton extends Entity
	{	
		
		var text = new Text("New Game");
		
		public function NewGameButton()
		{
			x = 475;
			y = 350;
			text.size = 40;
			graphic = text;
			type = "newgame";
			name = "newgame";
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
                     
                    
                    FP.world = new Level1;
                    return
                }
            }
		}
	}
}