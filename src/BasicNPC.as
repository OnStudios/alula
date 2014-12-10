package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	/**
	 * ...
	 * @author On Studios
	 */
	public class BasicNPC extends Entity 
	{
		
		private var health:int = 100;
		private var rof:int = 40;
		private var damage:int = 20;
		private var range:int = 500;
		private var last_shot:int = 0;
		private var xp:int = 10;
		
		[Embed(source = "../assets/player_standin.png")] private const NPC:Class;
		[Embed(source="../assets/proj.png")] private const PROJ:Class;
		
		public function BasicNPC(x_pos:int, y_pos:int) 
		{
			x = x_pos;
			y = y_pos;
			
			graphic = new Image(NPC);
			
			type = "npc";
		}
		
		override public function update():void {
			//position
			var player = world.getInstance("player") as Player;
			x -= player.getX_Velocity() / 2;
		}
		override public function render():void {
			var player = world.getInstance("player") as Player;
			
			if ((Math.abs(player.getX() - x)) <= 100) {
				Draw.rect(world.camera.x+700, world.camera.y+50, 300, 100, 0xCCCCCC);
			}
			
			super.render();

		}
	}

}