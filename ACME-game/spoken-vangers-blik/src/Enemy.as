package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Enemy extends Sprite 
	{
		private var art:MovieClip
		public function Enemy() 
		{
			art = new spook1();
			addChild(art);
			
		}
		
	}

}