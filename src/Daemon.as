package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author On Studios
	 */
	public class Daemon extends Entity
	{
		
		public function Daemon() 
		{
			
		}
		override public function update():void {
			//pause screen
			if (Input.check(Key.ESCAPE) || Input.check(Key.P)) {
				Stats.setPaused(true);
				FP.world.add(new PausescreenSetting());
				FP.world.add(new ResumeGame());
				FP.world.add(new GotoHome());
				FP.world.add(new RestartButton());
			}
		}
	}
}