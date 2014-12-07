package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	//The player.  Moved by AD and the space bar, for now.
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	public class Projectile extends Entity
	{
		private const PROJECTILE:Class;
		
		//set velocity
		private var x_velocity:int = 10;
		
		//set damage
		private var damage:int = 20;
		
		public function Projectile(x_velocity:int, image:Class, damage:int, x_param:int, y_param:int)
		{
			//set initial position
			x = x_param;
			y = y_param;
			PROJECTILE = image;
			x_velocity = x_velocity;
			damage = damage;
			
			name = "projectile";
			type = "projectile";
			graphic = new Image(PROJECTILE);
			setHitboxTo(graphic);
		}
		
		override public function update():void
		{
			trace("Projectile updates.");
			
			//update x
			x += x_velocity;

			super.update();	
		}
		
		public function getX_Velocity():int {
			return x_velocity;
		}

	}

}