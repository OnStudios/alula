package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author On Studios
	 */
	public class BasicEnemy extends Entity 
	{
		
		private var health:int = 100;
		private var rof:int = 40;
		private var damage:int = 20;
		private var range:int = 500;
		private var last_shot:int = 0;
		private var xp:int = 10;
		private var targeting:Boolean = false;
		private var walk_speed:int = 5;
		private var y_velocity:int = 0;
		private var y_accel:int = 0;
		private var jump_strength:int = 100;
		//private var evadable:int = 10;

		
		[Embed(source = "../assets/enemy.png")] private const ENEMY:Class;
		[Embed(source="../assets/proj.png")] private const PROJ:Class;
		
		public function BasicEnemy(x_pos:int, y_pos:int) 
		{
			x = x_pos;
			y = y_pos;
			
			graphic = new Image(ENEMY);
			
			setHitboxTo(graphic);
			
			type = "enemy";
		}
		
		override public function update():void {
			//y motion
			//if the player won't touch the ground, update for gravity
			if (y < (640 - y_velocity)) {
				y_accel = Stats.getGravity();
					
			}
			if(y >= (650 - y_velocity)) {
				y_accel = 0;
				y_velocity = 0;
					
			}
			if(y <= (250 - y_velocity)) {
				jump_strength = Stats.getGravity();
				//y_accel = gravity;
			}
				
			if (y >= 640) {
				jump_strength = -20;
			}
			//update y
				
			y += y_velocity;
			y_velocity += y_accel;

			//position
			var player = world.getInstance("player") as Player;
			x -= player.getX_Velocity() / 2;
			//collisions with bullets
			var p:Projectile = collide("player_bullet", x, y) as Projectile;
			if (collide("player_bullet", x, y))
			{
				health -= p.getDamage();
				FP.world.remove(p);
				
				if ((Math.abs(player.getX() - x)) >= range) {
					targeting = true;
				}
				
			}
			//health and death
			if (health <= 0) {
				player.setXP(player.getXP() + xp);
				FP.world.remove(this);
			}			
			
			//evasion
			//var proj:Projectile = world.nearestToEntity("player_bullet", this, true) as Projectile;
			//if (proj != null) {
				//if ((Math.abs(proj.getX() - x)) <= 100 && (Math.abs(proj.getX() - x)) >= (100 - proj.getXVelocity())){// && evadable >= 0) {
					//y -= 2;
					//y_velocity = jump_strength;
					//evadable--;
					//to avoid one projectile being dodged multiple times, I switch the dodged projectile with another
					// exactly the same, except with a type of 'dodged'
					//FP.world.add(new Projectile(proj.getXVelocity(), proj.getImage(), proj.getDamage(), proj.getX(), proj.getY(), proj.getDirection(), "evaded", proj.getRange()));
					//FP.world.remove(proj);
				//}
			//}
			
			//fleeing
			if (health <= 50) {
				if ((Math.abs(player.getX() - x)) <= player.getRange()) {
					if ((player.getX() - x) > 0) {
						x -= walk_speed/2;
					}
					else {
						x += walk_speed/2;
					}

				}
			}
			
			
			//motion and targeting
			if (targeting) {
				if ((Math.abs(player.getX() - x)) <= range) {
					targeting = false;
				}
				else {
					if ((player.getX() - x) > 0) {
						x += walk_speed;
					}
					else {
						x -= walk_speed;
					}
				}
			}
			
			//attacking
			var direction = 1;
			if ((Math.abs(player.getX() - x)) <= range) {
				if ((player.getX() - x) < 0) {
					direction = -1;
				}
				if ((Stats.getTime() - last_shot) >= rof) {
					FP.world.add(new Projectile(10, PROJ, damage, x + (65 * direction), y, direction, "enemy_bullet", range));
					last_shot = Stats.getTime();
				}
			}

		}
		
		function randomRange(minNum:int, maxNum:int):int 
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
	}

}