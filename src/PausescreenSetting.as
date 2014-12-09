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
	
	public class PausescreenSetting extends Entity
	{	
		
		var text = new Text("Settings");
		
		public function PausescreenSetting()
		{
			x = 475;
			y = 400;
			text.size = 40;
			graphic = text;
			type = "pause_button";
			name = "PausescreenSetting";
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
                     
                    
                    FP.world = new MainMenu;
                    return
                }
            }
		}
	}
}