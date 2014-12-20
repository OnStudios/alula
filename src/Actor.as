package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author On Studios
	 */
	public class Actor extends Entity
	{
		//movement
		public var x_velocity:int;
		public var y_velocity:int;
		public var walk_speed:int;
		public var direction:int;
		
		//combat
		public var rof:int;
		public var last_shot:int;
		public var health:int;
		public var range:int;
		public var damage:int;
		
		public var sprite_map:Spritemap;
		
		public function Actor(x_param, y_param, x_velocity_param:int, y_velocity_param:int, walk_speed_param:int, direction_param:int, rof_param:int, last_shot_param:int, health_param:int, range_param:int, damage_param:int, sprite_map_param:Spritemap)
		{
			x = x_param;
			y = y_param;
			
			x_velocity = x_velocity_param;
			y_velocity = y_velocity_param;
			walk_speed = walk_speed_param;
			direction = direction_param;
			rof = rof_param;
			last_shot = last_shot_param;
			health = health_param;
			range = range_param;
			sprite_map = sprite_map_param;
		}
		
		public function checkDeath():void {
			if (health <= 0) {
				FP.world.remove(this);
			}
		}
		
		public function updateX():void {
			//update x
			if (x < (550 - x_velocity) && x > (50 - x_velocity)) {
				x += x_velocity;
			}
				
			//set location variable.  This is basically the player's location in the world, not his location on the screen
			Stats.setLocation(Stats.getLocation() + x_velocity);
			
			
			//sprite direction
			if (direction == 1) {
				sprite_map.flipped = false;
					
			}
			else {
				sprite_map.flipped = true;
			}

		}
		
		public function updateY():void {
			//update y
			if (y < (550 - y_velocity) && y > (400 - y_velocity)) {
				y += y_velocity;
			}
		}
	}
}