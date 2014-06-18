package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Ants extends Sprite
	{
		private var art:MovieClip;
		public var welkeMier:Number;
		public function Ants() 
		{
			art = new ant();
			addChild(art);
			welkeMier = Math.random();
			
			if (welkeMier < 0.25) 
			{
				this.x = - 100;
				this.y = Math.random() * 600;
			}
			else if (welkeMier < 0.5) 
			{
				this.x = Main._stage.stageWidth + 100;
				this.y = Math.random() * 600;
				//_enemy.rotation = ;
			}
			else if (welkeMier < 0.75) 
			{
				this.x = Math.random() * 800;
				this.y = Main._stage.stageHeight + 100;
			}
			else if ( welkeMier < 1) 
			{
				this.x = Math.random() * 800;
				this.y = -100;
			}
			
		}
		
	}

}