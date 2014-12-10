package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	
	 import net.flashpunk.Entity;
	 import net.flashpunk.utils.Draw;

	 
	public class XPBar extends Entity 
	{
		private var ent:Entity;
		private var variable:String;

		public function XPBar(x:Number, y:Number, w:Number, h:Number) 
		{
			this.x = x;
			this.y = y;
			setHitbox(w, h);
			this.ent = ent;
			layer = -10000;
		}

		override public function render():void 
		{
			var player = world.getInstance("player") as Player;
			Draw.rect(world.camera.x+x, world.camera.y+y, width, height, 0xCCCCCC);
			Draw.rect(world.camera.x+x, world.camera.y+y, (width / player.getMaxXP()) * player.getXP(), height, 0xFFFF00);
		}
	}

}