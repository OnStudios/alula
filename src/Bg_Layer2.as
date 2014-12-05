package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	// The second layer of background of three.  Moves with the player to create a parallax effect.

	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Bg_Layer2 extends Entity
	{
		[Embed(source="../assets/hills.png")] private const BG:Class;
		
		
		public function Bg_Layer2()
		{
			x = 0;
			y = 300;
			graphic = new Image(BG);
		}
		
		override public function update():void
		{
			trace("BG updates.");
			var player = world.getInstance("player") as Player;
			x -= player.getX_Velocity() / 2;
		}

	}
}