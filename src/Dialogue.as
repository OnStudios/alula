package  
{
	/**
	 * ...
	 * @author OnDevelopers
	 */
	public class Dialogue 
	{
		
		private var partner:String;
		private var index:int;
		private var lines:Array = new Array();
		
		
		public function Dialogue(partner_param:String,index_param:int, lines_param:Array) 
		{
			partner = partner_param;
			index = index_param;
			lines = lines_param;
		}
		
	}

}