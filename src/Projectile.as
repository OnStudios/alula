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
	import net.flashpunk.FP;
	
	
	public class Projectile extends Entity
	{
		private const PROJECTILE:Class;
		
		//set velocity
		private var x_velocity:int = 10;
		private var x_travelled:int = 0;
		private var range:int = 0;
		
		//set damage
		private var damage:int = 20;
		
		private var direction:int = 1;
		
		public function Projectile(x_velocity_param:int, image_param:Class, damage_param:int, x_param:int, y_param:int, direction_param:int, type_param:String, range_param:int)
		{
			//set initial position
			x = x_param;
			y = y_param;
			PROJECTILE = image_param;
			x_velocity = x_velocity_param;
			damage = damage_param;
			direction = direction_param;
			range = range_param;
			
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
			x_travelled += x_velocity;
			
			if (x_travelled >= range) {
				FP.world.remove(this);
			}
			
			
			super.update();	
		}
		
		public function getDamage():int {
			return damage;
		}

	}

}