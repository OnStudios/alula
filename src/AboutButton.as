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
	
	public class AboutButton extends Entity
	{	
		
		var text = new Text("About");
		
		public function AboutButton()
		{
			x = 475;
			y = 450;
			text.size = 40;
			graphic = text;
			type = "about";
			name = "about";
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