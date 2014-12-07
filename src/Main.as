package
{
	/**
	 * ...
	 * @author On Studios
	 */
	//Main file
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	public class Main extends Engine
	{
		public function Main()
		{
			super(1200, 800, 60, false);
			FP.world = new MainMenu;
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}

	}
}