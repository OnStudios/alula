package  
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import flash.utils.Dictionary;
	
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
		private var last_click:int = 0;

		
		[Embed(source = "../assets/player_standin.png")] private const NPC:Class;
		[Embed(source = "../assets/proj.png")] private const PROJ:Class;
		[Embed(source = "../assets/basic_npc_dialogue.xml", mimeType = "application/octet-stream")] private var npcData:Class;
		
		public function BasicNPC(x_pos:int, y_pos:int) 
		{
			x = x_pos;
			y = y_pos;
			
			Input.define("change_dialogue", Key.E, Input.mouseDown);
			
			trace(getDialogue(0,"player"));
			
			graphic = new Image(NPC);
			
			type = "npc";
		}
		
		override public function update():void {
			//position
			var player = world.getInstance("player") as Player;
			x -= player.getX_Velocity() / 2;
			
			if ((Math.abs(player.getX() - (x - 75))) <= 75) {
				
				if (Input.pressed("change_dialogue"))
				{
					response_index += 1;
				}
			}
			
			
		}
		override public function render():void {
			var player = world.getInstance("player") as Player;
			
			
			if ((Math.abs(player.getX() - (x - 75))) <= 75 && getDialogue(response_index, "player") != "") {
				
				if (Input.pressed("change_dialogue"))
				{
					response_index += 1;
				}
				
				FP.world.add(new NPCDialogueBox(getDialogue(response_index, "player"), world.camera.x + 650, world.camera.y + 50));
			}
			
			super.render();

		}
		public function getDialogue(index_param:int, partner_param:String):String {
			var npcDataByteArray:ByteArray = new npcData;
			var npcDataXML:XML = new XML(npcDataByteArray.readUTFBytes(npcDataByteArray.length));
			var o:XML;
			var p:XML;
			
			for each (o in npcDataXML.dialogue)
			{
				if (o.partner = partner_param) {
					
					for each (p in o.line)
					{
						if (p.@index == index_param.toString()) {
							return p.version;
						}
					}
				}
			}
			return "";
		}
	}
}