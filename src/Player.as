package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	//The player.  Moved by A, D, E, RIGHT, LEFT, and UP.
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	
	public class Player extends Entity
	{
		[Embed(source="../assets/spritesheet.png")] private const PLAYER:Class;
		[Embed(source = "../assets/proj.png")] private const PROJECTILE:Class;
		
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 58, 58);
		
		//set initial velocities
		public var x_velocity:int = 0;
		private var y_velocity:int = 0;
		private var y_accel:int = 0;
		private var walk_speed:int  = 3.5;
		private var jump_strength:int =  -20;
		private var gravity:int = 10
		private var rof:int = 20;
		private var last_shot:int;
		private var direction:int = 1;
		private var health:int = 100;
		private var xp:int = 0;
		private var next_level_XP:int = 100;
		private var range = 700;

		
		public function Player()
		{
			//set initial position
			x = 100;
			y = 540;
			
			//
			
			//setup animations
			sprPlayer.add("ranged_attack", [0, 1, 2, 3, 4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,,40,41,42,43,44,45,46,47], 40, false);
			sprPlayer.add("stand", [48], 20, true);

			sprPlayer.scale = 4;
			
			name = "player";
			graphic = sprPlayer;
			setHitbox(75, 130, (x - 175), (y - 580));
			//FP.console.enable()
		}
		
		override public function update():void
		{
			
			if (!Stats.getPaused()) {
				
			
				//sprPlayer.play("stand");
				
				trace("Player updates.");
				
				//update x
				if (x < (550 - x_velocity) && x > (50 - x_velocity)) {
					x += x_velocity;
				}
				
				//set location variable.  This is basically the player's location in the world, not his location on the screen
				Stats.setLocation(Stats.getLocation() + x_velocity);
				
				//if the player won't touch the ground, update for gravity
				if (y < (550 - y_velocity)) {
					y_accel = gravity;
					
				}
				if(y >= (550 - y_velocity)) {
					y_accel = 0;
					y_velocity = 0;
					
				}
				if(y <= (250 - y_velocity)) {
					jump_strength = gravity;
					//y_accel = gravity;
				}
				
				if (y >= 540) {
					jump_strength = -20;
				}
				//update y
				
				y += y_velocity;
				y_velocity += y_accel;

				x_velocity = 0;
				
				//attack
				if (Input.check(Key.SPACE) && (Stats.getTime() - last_shot) >= rof)
				{
					if (direction == 1) {
						sprPlayer.flipped = false;
						sprPlayer.play("ranged_attack", true);
					}
					if (direction == -1) {
						sprPlayer.flipped = true;
						sprPlayer.play("ranged_attack", true);
					}
					
					FP.world.add(new Projectile(10, PROJECTILE, 25, (x+125), (y+95), direction, "player_bullet", range));
					last_shot = Stats.getTime();
				}
				if (direction == 1) {
					sprPlayer.flipped = false;
					
				}
				if (direction == -1) {
					sprPlayer.flipped = true;
				}
				if (Input.check(Key.UP) || Input.check(Key.W))
				{
					y -= 2;
					y_velocity = jump_strength;
				}
				if (Input.check(Key.D) || Input.check(Key.RIGHT) && Stats.getLocation() < 30)
				{
					x_velocity = walk_speed;
					direction = 1;
				}
				
				if ((Input.check(Key.A) || Input.check(Key.LEFT)) && Stats.getLocation() >= 10)
				{
					x_velocity = (0 - walk_speed);
					direction = -1;
				}
				
				var p:Projectile = collide("enemy_bullet", x, y) as Projectile;
				if (collide("enemy_bullet", x, y))
				{
					health -= p.getDamage();
					FP.world.remove(p);
				}
				//health and death
				if (health <= 0) {
					FP.world.remove(this);
				}

				
				//pause screen
				if (Input.check(Key.ESCAPE) || Input.check(Key.P)) {
					Stats.setPaused(true);
					FP.world.add(new PausescreenSetting());
					FP.world.add(new ResumeGame());
					FP.world.add(new GotoHome());
					FP.world.add(new RestartButton());
				}
			}
			else {
				sprPlayer.play("stand", true);
			}
			super.update();
			
		}
		
		public function getX_Velocity():int {
			return x_velocity;
		}
		public function getX():int {
			return x;
		}
		public function getHealth():int {
			return health;
		}
		public function getXP():int {
			return xp;
		}
		public function setXP(num:int):void {
			xp = num;
		}

		public function getMaxXP():int {
			return next_level_XP;
		}
		
	}
	

}