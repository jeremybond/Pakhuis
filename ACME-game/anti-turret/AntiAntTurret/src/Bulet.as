package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Bulet extends Sprite
	{
		public var art:MovieClip;
		public function Bulet() 
		{
			art = new Bullet;
			addChild(art);
		}
		public function move($speed:Number):void
		{
			var snelheid:Point = new Point();
			snelheid.x = Math.cos(this.rotation / 180 * Math.PI) * $speed;
			snelheid.y = Math.sin(this.rotation / 180 * Math.PI) * $speed;
			
			this.x += snelheid.x;
			this.y += snelheid.y;
		}
	}

}