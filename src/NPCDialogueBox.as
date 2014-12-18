package  
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author OnDevelopers
	 */
	public class NPCDialogueBox extends Entity
	{
		
		public function NPCDialogueBox() 
		{
			x = x_param;
			y = y_param;
			textBox = new TextBox(x_param, y_param, scaleX, scaleY);
			charsPerRow = (scaleX * 46);
			rowsPerPage = (scaleX * 3);
			initDisplayTexts(scaleX);
		}
		
		public function initDisplayTexts(scaleX:int):void {
			for (var i:int = 0; i < rowsPerPage; i++) {
				displayTexts[i] = new DisplayText(
			}
		}
		
	}

}