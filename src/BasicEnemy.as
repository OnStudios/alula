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