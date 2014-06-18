package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Enemy2 extends Sprite 
	{
		private var art:MovieClip
		public function Enemy2() 
		{
			art = new Spook2();
			addChild(art);
		}
		
	}

}
