package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Blik extends Main
	{
		private var art:MovieClip;
		public function Blik() 
		{
			art = new blik();
			addChild(art);
			
			x = _player.x;
			y = 400;
			
		}
		
	}

}