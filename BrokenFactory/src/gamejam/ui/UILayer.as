package gamejam.ui {
	import flash.display.MovieClip;
	import gamejam.game.World;
	import gamejam.Intersect;
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class UILayer extends MovieClip {
		private var homeScreen:Home;
		public var creditScreen:MovieClip;
		
		public function UILayer() {
			homeScreen = new Home();
			creditScreen = new Credits();
			
			addChild(homeScreen);
			addChild(creditScreen);
			
			creditScreen.visible = false;
		}
		
		public function home():void {
			World.reset();
			World.playing = false;
			homeScreen.visible = true;
			creditScreen.visible = false;
			this.visible = true;
			//Intersect.getGame().visible = false;
		}
		
		public function credits():void {
			creditScreen.visible = true;
			this.visible = true;
		}
	}

}