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
		
		private var direction:int = 1;
		
		public function Projectile(x_velocity_param:int, image_param:Class, damage_param:int, x_param:int, y_param:int, direction_param:int, type_param:String)
		{
			//set initial position
			x = x_param;
			y = y_param;
			PROJECTILE = image_param;
			x_velocity = x_velocity_param;
			damage = damage_param;
			direction = direction_param;
			
			name = "bullet";
			type = type_param;
			graphic = new Image(PROJECTILE);
			setHitboxTo(graphic);
		}
		
		override public function update():void
		{
			trace("Projectile updates.");
			
			//update x
			x += (x_velocity * direction);

			super.update();	
		}
		
		public function getDamage():int {
			return damage;
		}

	}

}