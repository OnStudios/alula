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

	
	public class Player extends Entity
	{
		[Embed(source = "../assets/player_standin.png")] private const PLAYER:Class;
		[Embed(source = "../assets/proj.jpg")] private const PROJECTILE:Class;
		
		//set initial velocities
		public var x_velocity:int = 0;
		private var y_velocity:int = 0;
		private var y_accel:int = 0;
		private var walk_speed:int  = 2.5;
		private var jump_strength:int =  -10;
		private var gravity:int = 5;
		private var rof:int = 20;
		private var last_shot:int;
		private var direction:int = 1;
		//private var stats:Stats;

		
		public function Player()
		{
			//set initial position
			x = 100;
			y = 640;
			
			//stats = world.getInstance("stats") as Stats;
			name = "player";
			graphic = new Image(PLAYER);
		}
		
		override public function update():void
		{
			trace("Player updates.");
			
			//update x
			x += x_velocity;
			//if the player won't touch the ground, update for gravity
			if (y < (650 - y_velocity)) {
				y_accel = gravity;
			}
			if(y >= (650 - y_velocity)) {
				y_accel = 0;
				y_velocity = 0;
			}
			//update y
			y += y_velocity;
			y_velocity += y_accel;

			x_velocity = 0;
			
			if (Input.check(Key.W))
			{
				y -= 2;
				y_velocity = jump_strength;
			}

			
			if (Input.check(Key.D))
			{
				x_velocity = walk_speed;
				direction = 1;
			}
			
			if (Input.check(Key.A))
			{
				x_velocity = ( -1 * walk_speed);
				direction = -1;
			}
			
			if (Input.check(Key.SPACE) && (Stats.getTime() - last_shot) > rof)
			{
				FP.world.add(new Projectile(10, PROJECTILE, 25, x, y, direction));
				last_shot = Stats.getTime();
			}

			
			super.update();
			
		}
		
		public function getX_Velocity():int {
			return x_velocity;
		}

	}

}