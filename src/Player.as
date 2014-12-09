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
		[Embed(source="../assets/SPRITE SHEET.png")] private const PLAYER:Class;
		[Embed(source = "../assets/proj.png")] private const PROJECTILE:Class;
		
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 58, 58);
		
		//set initial velocities
		public var x_velocity:int = 0;
		private var y_velocity:int = 0;
		private var y_accel:int = 0;
		private var walk_speed:int  = 2.5;
		private var jump_strength:int =  -20;
		private var gravity:int = 10
		private var rof:int = 20;
		private var last_shot:int;
		private var direction:int = 1;

		
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
		}
		
		override public function update():void
		{
			
			//sprPlayer.play("stand");
			
			trace("Player updates.");
			
			//update x
			x += x_velocity;
			
			
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
				
				FP.world.add(new Projectile(10, PROJECTILE, 25, (x+125), (y+95), direction));
				last_shot = Stats.getTime();
			}
			if (direction == 1) {
				sprPlayer.flipped = false;
				
			}
			if (direction == -1) {
				sprPlayer.flipped = true;
			}
			if (Input.check(Key.UP))
			{
				y -= 2;
				y_velocity = jump_strength;
			}
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
			if (Input.check(Key.RIGHT))
			{
				x_velocity = walk_speed;
				direction = 1;
			}
			
			if (Input.check(Key.A))
			{
				x_velocity = (0 - walk_speed);
				direction = -1;
			}
			if (Input.check(Key.LEFT))
			{
				x_velocity = (0 - walk_speed);
				direction = -1;
			}
			
			//pause screen
			if (Input.check(Key.ESCAPE) || Input.check(Key.P)) {
				Stats.setPaused(true);
				FP.world.add(new PausescreenSetting());
				FP.world.add(new ResumeGame());
				FP.world.add(new GotoHome());
				FP.world.add(new RestartButton());
			}
			
			super.update();
			
		}
		
		public function getX_Velocity():int {
			return x_velocity;
		}

	}

}