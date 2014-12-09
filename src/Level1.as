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
		
		[Embed(source = "../assets/hills.png")] private const HILLS:Class;
		[Embed(source = "../assets/clouds.png")] private const CLOUDS:Class;
				
		public function Level1()
		{
			add(new Bg_Layer3(CLOUDS, -260));
			add(new Bg_Layer2(HILLS, 310));
			
			add(new Ground());
			//add(new BasicEnemy(500, 640));
			add(new BasicEnemy(1000, 640));
			add(new BasicEnemy(1700, 640));
			add(new Player());
			
			add(new Stats());
			
			
			
		}
		

	}
}