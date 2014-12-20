package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The first layer of background of three.  Moves with the player to create a parallax effect.

	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Bg_Layer1 extends Entity
	{	
		private const BG:Class;
		
		public function Bg_Layer1(image_param,y_pos)
		{
			x = 0;
			y = y_pos;
			BG = image_param;
			graphic = new Image(BG);
		}
		
		override public function update():void
		{
			trace("BG updates.");
			var player = world.getInstance("player") as Player;
			x -= player.getX_Velocity() * 0.75;

		}
	}
}