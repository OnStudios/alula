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
		public function Level1()
		{
			add(new Ground());
			add(new Player());
		}
	}
}