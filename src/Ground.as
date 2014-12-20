package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The ground for the world.  When the player, or an enemy, collides with it that entity's downward acceleration and velocity will be set to zero.

	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Ground extends Entity
	{
		[Embed(source = "../assets/ground_2.png")] private const GROUND:Class;
		
		
		public function Ground()
		{
			x = 0;
			y = 0;
			graphic = new Image(GROUND);
		}
		
		override public function update():void
		{
			trace("Ground updates.");
		}

	}
}