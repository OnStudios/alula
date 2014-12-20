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
	
	
	public class Player extends Actor 
	{
		[Embed(source="../assets/spritesheet.png")] private const PLAYER:Class;
		[Embed(source = "../assets/proj.png")] private const PROJECTILE:Class;
		
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 58, 58);

		private var xp:int = 0;
		private var next_level_XP:int = 100;
		
		public function Player()
		{
			
			super(200, 500, 0, 0, 3.5, 1, 20, 0, 100, 700, 25, sprPlayer);
						
			//Define Inputs
			Input.define("Jump", Key.SPACE);
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Right", Key.D, Key.RIGHT);
			Input.define("Up", Key.W, Key.UP);
			Input.define("Down", Key.S, Key.DOWN);
			
			//setup animations
			sprite_map.add("ranged_attack", [0, 1, 2, 3, 4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,,40,41,42,43,44,45,46,47], 40, false);
			sprite_map.add("stand", [48], 20, true);

			sprite_map.scale = 4;
			
			
			
			name = "player";
			graphic = sprPlayer;
			setHitbox(75, 130, (x - 175), (y - 580));
			//FP.console.enable()
		}
		
		override public function update():void
		{
			
			if (!Stats.getPaused()) {
				
				//set velocity back to zero
				x_velocity = 0;
				y_velocity = 0;
				
				//attack
				if (Input.mousePressed && (Stats.getTime() - last_shot) >= rof)
				{
					attack();
				}
				//movement
				if (Input.check("Left")) {
					Movement.moveLeft(walk_speed, this);
				}
				if (Input.check("Right")) {
					Movement.moveRight(walk_speed, this);
				}
				if (Input.check("Up")) {
					Movement.moveUp(walk_speed, this);
				}
				if (Input.check("Down")) {
					Movement.moveDown(walk_speed, this);
				}
				
				this.updateY();
				this.updateX();
				

				//projectile collision
				var p:Projectile = collide("enemy_bullet", x, y) as Projectile;
				if (collide("enemy_bullet", x, y))
				{
					health -= p.getDamage();
					FP.world.remove(p);
				}
				
				//health and death
				this.checkDeath();
				
				
			}
			else {
				sprPlayer.play("stand", true);
			}
						
		}
		
		public function attack():void {
			if (direction == 1) {
				sprPlayer.flipped = false;
				sprPlayer.play("ranged_attack", true);
			}
			if (direction == -1) {
				sprPlayer.flipped = true;
				sprPlayer.play("ranged_attack", true);
			}
					
			FP.world.add(new Projectile(10, PROJECTILE, damage, (x+125), (y+95), direction, "player_bullet", range));
			last_shot = Stats.getTime();

		}
		
		
		//getters and setters
		//should be removed
		public function getX_Velocity():int {
			return x_velocity;
		}
		public function getX():int {
			return x;
		}
		public function getHealth():int {
			return health;
		}
		public function getRange():int {
			return range;
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