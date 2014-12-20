package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	//The World for the first level
	
	import net.flashpunk.World;
	public class Level1 extends World
	{
		
		[Embed(source = "../assets/mountains.png")] private const HILLS:Class;
		[Embed(source = "../assets/clouds2.png")] private const CLOUDS:Class;
		[Embed(source = "../assets/foreground.png")] private const FOREGROUND:Class;
				
		public function Level1()
		{
			add(new Bg_Layer3(CLOUDS, 0));
			add(new Bg_Layer2(HILLS, 0));
			add(new Ground());
			
			add(new BasicEnemy(1000, 640));
			add(new BasicEnemy(1800, 640));
			add(new BasicEnemy(1755, 640));
			
			add(new Player());
			
			add(new Bg_Layer1(FOREGROUND, 0));
			
			add(new HealthBar(5, 5, 250, 15));
			add(new XPBar(5, 30, 250, 15));
			
			add(new Stats());
			add(new Daemon());
			
		}
		

	}
}