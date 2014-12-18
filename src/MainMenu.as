package  
{
	/**
	 * ...
	 * @author On Studios
	 */
	//The World for the Main Menu
	
	import net.flashpunk.World;
	public class MainMenu extends World
	{
		
		public function MainMenu()
		{
			add(new TitleGraphic());
			add(new NewGameButton());
			add(new SettingsButton());	
			add(new AboutButton());	
			add(new ExitButton());	
		}
		

	}
}