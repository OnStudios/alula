package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The Pause screen restart button
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	
	public class RestartButton extends Entity
	{	
		
		var text = new Text("Restart Level");
		
		public function RestartButton()
		{
			x = 475;
			y = 450;
			text.size = 40;
			graphic = text;
			type = "pause_button";
			name = "restartlevel";
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