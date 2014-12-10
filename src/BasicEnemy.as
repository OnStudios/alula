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
			}
			//health and death
			if (health <= 0) {
				player.setXP(player.getXP() + xp);
				FP.world.remove(this);
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
		
	}

}