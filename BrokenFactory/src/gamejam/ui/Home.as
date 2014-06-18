package gamejam.ui {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import gamejam.game.World;
	import gamejam.Intersect;
	import gamejam.Main;
	
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Home extends MovieClip {
		private var background:MovieClip;
		private var playButton:MovieClip;
		
		/**
		 * construct home screen
		 */
		public function Home() {
			background = new BackgroundStartscherm();
			this.addChild(background);
			background.x = -34;
			background.y = -30;
			
			playButton = new PlayButton();
			this.addChild(playButton);
			playButton.x = Intersect.getStage().stageWidth / 2 - 120;
			playButton.y = Intersect.getStage().stageHeight / 2 - 60;
			playButton.addEventListener(MouseEvent.MOUSE_UP, playPressed);
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function playPressed(e:MouseEvent):void {
			Main.ui.visible = false;
			World.start();
		}
	}

}