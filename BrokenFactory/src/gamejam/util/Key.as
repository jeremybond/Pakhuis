package gamejam.util {
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Key {
		private var keycode:uint;	//this keys universal keycode
		private var pressed:Boolean;//whether this key is pressed or not
		
		/**
		 * 
		 * @param	keycode
		 */
		public function Key(keycode:uint) {
			this.keycode = keycode;
		}
		
		/**
		 * 
		 * @return
		 */
		public function getKeyCode():uint {
			return keycode;
		}
		
		/**
		 * 
		 * @return
		 */
		public function isPressed():Boolean {
			return pressed;
		}
		
		/**
		 * 
		 * @param	pressed
		 */
		public function setPressed(pressed:Boolean):void {
			this.pressed = pressed;
		}
	}

}