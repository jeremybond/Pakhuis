package gamejam {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import gamejam.game.World;
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Intersect {
		private static var _stage:Stage;
		private static var game:MovieClip;
		
		/**
		 * 
		 * @return
		 */
		public static function getStage():Stage {
			return _stage;
		}
		
		/**
		 * 
		 * @param	s
		 */
		public static function setStage(s:Stage):void {
			_stage = s;
		}
		/**
		 * 
		 * @return
		 */
		public static function getGame():MovieClip {
			return game;
		}
		
		/**
		 * 
		 * @param	g
		 */
		public static function setGame(g:MovieClip):void {
			game = g;
		}
	}
}