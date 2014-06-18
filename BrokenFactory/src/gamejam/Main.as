package gamejam {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.ui.Keyboard;
	import gamejam.entity.player.Player;
	import gamejam.game.World;
	import gamejam.ui.UILayer;
	import gamejam.util.AudioManager;
	
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Main extends Sprite {
		public static var ui:UILayer;
		public static var game:MovieClip;
		public static var backgroundGame:MovieClip;
		private static var theme:SoundChannel;
		
		/**
		 * 
		 */
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			Intersect.setStage(stage);
			ui = new UILayer();
			this.addChild(ui);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyEvent);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyEvent);
			this.addEventListener(Event.ENTER_FRAME, update);
			
			game = new MovieClip();
			Intersect.setGame(game);
			backgroundGame = new background_c();
			game.addChild(backgroundGame);
			backgroundGame.visible = false;
			var overlay:Sprite = new Sprite();
			overlay.graphics.beginFill(0xFFFFFF, .3);
			overlay.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			backgroundGame.addChild(overlay);
			stage.addChild(game);
			game.addChild(new MovieClip());	//cheap fix to move player to the front
			
			theme = (new AudioManager.Theme() as Sound).play(0, int.MAX_VALUE);
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function keyEvent(e:KeyboardEvent):void {
			//skip level (to be removed before release)
			if (!World.finished) {
				if(World.playing) {
					if (e.keyCode == Keyboard.ENTER && e.type == KeyboardEvent.KEY_UP) {
						trace("cheater");
						World.next();
					}
					
					//main menu
					if (e.keyCode == Keyboard.ESCAPE && e.type == KeyboardEvent.KEY_UP) {
						
					}
					
					World.getPlayer().keyEvent(e);
				}
			} else {
				World.reset();
			}
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function update(e:Event):void {
			World.update();
			if(World.playing)
				World.getPlayer().update(e);
		}
		
	}
	
}