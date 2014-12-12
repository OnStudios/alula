package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
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
		private var response_index = 0;
		private var responses:Array = new Array("Hi there, how are you?", "Welcome to my planet.", "Good luck out there!");
		private var last_click:int = 0;
		
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
			
			
			if ((Math.abs(player.getX() - (x - 75))) <= 75) {
				
				if (Input.mouseDown && (Stats.getTime() - last_click > 200) && response_index < responses.length - 1) {
					last_click = 0;
					response_index++;
				}
				
				Draw.rect(world.camera.x + 650, world.camera.y + 50, 500, 150, 0x999999);
				Draw.text(responses[response_index],world.camera.x + 650, world.camera.y + 50);
			}
			
			super.render();

		}		
	}

}