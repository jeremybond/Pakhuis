package gamejam.entity.player {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import gamejam.game.World;
	import gamejam.Intersect;
	import gamejam.util.AudioManager;
	import gamejam.util.Key;
	
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class Player extends MovieClip {
		private var leftAmount:uint = 0;	//the amount of left oriented buttons currently pressed
		private var rightAmount:uint = 0;	//the amount of right oriented buttons currently pressed
		private var left:Array = [new Key(Keyboard.LEFT), new Key(Keyboard.Q), new Key(Keyboard.A), new Key(Keyboard.Z), new Key(Keyboard.W), new Key(Keyboard.S), new Key(Keyboard.X), new Key(Keyboard.E), new Key(Keyboard.D), new Key(Keyboard.C), new Key(Keyboard.R), new Key(Keyboard.F), new Key(Keyboard.V), new Key(Keyboard.T)];
		private var right:Array = [new Key(Keyboard.RIGHT), new Key(Keyboard.G), new Key(Keyboard.B), new Key(Keyboard.Y), new Key(Keyboard.H), new Key(Keyboard.N), new Key(Keyboard.U), new Key(Keyboard.J), new Key(Keyboard.M), new Key(Keyboard.I), new Key(Keyboard.K), new Key(Keyboard.O), new Key(Keyboard.L), new Key(Keyboard.P)];
		private var jumpFrame:uint = 0;		//the current jumping frame (out of a maximum of 48 frames, or 1.5 seconds, per jump)
		private var jumping:Boolean = false;//whether we're currently in the process of a jump
		private var yVelocity:Number = 9;	//the x axis velocity
		private var xVelocity:Number = 7;	//the y axis velocity
		private var lastPressed:uint = 0;	//which side of the keyboard was last pressed. 0 for left, 1 for right
		public var bridgeParts:uint = 0;	//0/3
		public var bridgeBuilt:Boolean = false; //whether the bridge was built yet
		private var idle:MovieClip;
		private var jump:MovieClip;
		private var walk:MovieClip;
		public var startLocation:Point;
		
		/**
		 * 
		 */
		public function Player() {
			/*this.graphics.beginFill(0x2222AA);
			this.graphics.drawCircle(0, 0, 15);
			this.graphics.endFill();*/
			idle = new PlayerIdle();
			walk = new PlayerWalk();
			jump = new PlayerWalk();
			this.addChild(idle);
			this.addChild(walk);
			this.addChild(jump);
			idle.width = walk.width = jump.width = 40;
			idle.height = walk.height = jump.height = 24;
			idle.y = walk.y = jump.y = 10;
			walk.visible = false;
			jump.visible = false;
			Intersect.getStage().addEventListener(Event.DEACTIVATE, deactivate);
		}
		
		/**
		 * 
		 * @param	e
		 */
		public function keyEvent(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.UP) { //jump
				jumping = true;
			} else {
				for (var lkey:uint = 0; lkey < left.length; lkey++) {
					if (e.keyCode == (left[lkey] as Key).getKeyCode()) {
						if (e.type == KeyboardEvent.KEY_DOWN) {
							if (!(left[lkey] as Key).isPressed()) {
								(left[lkey] as Key).setPressed(true);
								lastPressed = 0;
								leftAmount++;
							}
						} else if (e.type == KeyboardEvent.KEY_UP) {
							if ((left[lkey] as Key).isPressed()) {
								(left[lkey] as Key).setPressed(false);
								if(leftAmount > 0)
									leftAmount--;
							}
						}
					}
				}
				
				for (var rkey:uint = 0; rkey < right.length; rkey++) {
					if (e.keyCode == (right[rkey] as Key).getKeyCode()) {
						if(e.type == KeyboardEvent.KEY_DOWN) {
							if (!(right[rkey] as Key).isPressed()) {
								(right[rkey] as Key).setPressed(true);
								lastPressed = 1;
								rightAmount++;
							}
						} else if (e.type == KeyboardEvent.KEY_UP) {
							if ((right[rkey] as Key).isPressed()) {
								(right[rkey] as Key).setPressed(false);
								if(rightAmount > 0)
									rightAmount--;
							}
						}
					}
				}
				
				/*for (var y:uint = 0; y < 18; y++) {
					var a:String = "";
					for (var x:uint = 0; x < 24; x++) {
						a += World.tileAt(39 + x * 39, 39 + y * 39);
						a += ", ";
					}
					trace(a);
				}*/
			}
		}
		
		/**
		 * 
		 * @param	e
		 */
		public function update(e:Event):void {
			if (leftAmount > rightAmount || (leftAmount == rightAmount && leftAmount != 0 && lastPressed == 0)) {
				switch(World.tileAt(x - 15, y)) {
					case 1: //hendel
						World.removeDoor();
					case 2: //muur
					case 4: //speler
						x -= xVelocity;
						idle.rotation = -20;
						break;
					case 6: //brug
						if (!bridgeBuilt) {
							x -= xVelocity;
							idle.rotation = -20;
						}
						break;
					case 7: //brugdeel
						World.removeBridgePart(x - 15, y);
						x -= xVelocity;
						idle.rotation = -20;
						break;
					case 8: //brugbouw
						if (bridgeParts == 3)
							World.buildBridge();
						x -= xVelocity;
						idle.rotation = -20;
						break;
					case 9:
						World.next();
						break;
					case 10: //waste
					case 11: //cirkelzaag
					case 12: //kabels
					case 13: //spikes
						respawn(World.tileAt(x - 15, y));
						break;
				}
			} else if (rightAmount > leftAmount || (leftAmount == rightAmount && leftAmount != 0 && lastPressed == 1)) {
				switch(World.tileAt(x + 15, y)) {
					case 1:
						World.removeDoor();
					case 2:
					case 4:
						x += xVelocity;
						idle.rotation = 20;
						break;
					case 6: //brug
						if (!bridgeBuilt) {
							x += xVelocity;
							idle.rotation = 20;
						}
						break;
					case 7: //brugdeel
						World.removeBridgePart(x + 15, y);
						x += xVelocity;
						idle.rotation = 20;
						break;
					case 8: //brugbouw
						if (bridgeParts == 3)
							World.buildBridge();
						x += xVelocity;
						idle.rotation = 20;
						break;
					case 9:
						World.next();
						break;
					case 10: //waste
					case 11: //cirkelzaag
					case 12: //kabels
					case 13: //spikes
						respawn(World.tileAt(x + 15, y));
						break;
				}
			} else {
				idle.rotation = 0;
			}
			
			//going up
			if (jumping) {
				if (jumpFrame < 20) {
					switch(World.tileAt(x, y - yVelocity)) {
						case 1:
							World.removeDoor();
						case 2:
						case 4:
							y -= yVelocity;
							yVelocity -= .45;
							jumpFrame++;
							break;
						case 6: //brug
							if (!bridgeBuilt)
								y -= xVelocity;
							else {
								jumpFrame = 20;
								yVelocity = 0;
							}
							break;
						case 7: //brugdeel
							World.removeBridgePart(x, y - yVelocity);
							y -= yVelocity;
							break;
						case 8: //brugbouw
							if (bridgeParts == 3)
								World.buildBridge();
							y -= yVelocity;
							break;
						case 9: //finish
							World.next();
							break;
						case 10: //waste
						case 11: //cirkelzaag
						case 12: //kabels
						case 13: //spikes
							respawn(World.tileAt(x, y - yVelocity));
							break;
						default:
							jumpFrame = 20;
							yVelocity = 0;
					}
					/*if (World.tileAt(x, y - yVelocity) != 1 && World.tileAt(x, y - yVelocity) != 2 && World.tileAt(x, y - yVelocity) != 4) {
						jumpFrame = 20;
						yVelocity = 0;
					} else {
						y -= yVelocity;
						yVelocity -= .45;
						jumpFrame++;
					}*/
				} else if (jumpFrame >= 20) {
					yVelocity += .45;
				}
			}
			
			//going down
			if (!jumping || (jumping && jumpFrame >= 20)) {
				var tile:uint = World.tileAt(x, y + 15);
				switch(tile) {
					case 1: //hendel
						World.removeDoor();
					case 2:
					case 4:
						if (!jumping) {
							jumping = true;
							jumpFrame = 20;
							yVelocity = 0;
						}
						y += yVelocity;
						break;
					case 6: //brug
						if (!bridgeBuilt) {
							if (!jumping) {
								jumping = true;
								jumpFrame = 20;
								yVelocity = 0;
							}
							y += yVelocity;
						}
						break;
					case 7: //brugdeel
						World.removeBridgePart(x, y + 15);
						y += yVelocity;
						break;
					case 8: //brugbouw
						if (bridgeParts == 3)
							World.buildBridge();
						y += yVelocity;
						break;
					case 9: //finish
						World.next();
						break;
					case 10: //waste
					case 11: //cirkelzaag
					case 12: //kabels
					case 13: //spikes
						respawn(World.tileAt(x, y + 15));
						break;
					/*default:
						if (jumping) {
							jumping = false;
							jumpFrame = 0;
							yVelocity = 9;
							if(y % 40 != 25)
								y -= y % 40 - 25;
						}*/
				}
				if(tile == 5 || (tile == 6 && bridgeBuilt)) {
					if (jumping) {
						jumping = false;
						jumpFrame = 0;
						yVelocity = 9;
						if(y % 40 != 25)
							y -= y % 40 - 25;
					}
				}
			}
		}
		
		/**
		 * 
		 */
		private function respawn(tile:uint):void {
			switch(tile) {
				case 10: //waste
					AudioManager.hiss();
					break;
				case 11: //cirkelzaag
					AudioManager.saw();
					break;
				case 12: //kabels
					AudioManager.electricity();
					break;
				case 13: //spikes
					AudioManager.spikes();
					break;
			}
			World.currentLevel--;
			World.next();
			World.deaths++;
			World.deathsField.text = "Deaths: " + World.deaths;
		}
		
		/**
		 * functions to release the pressed buttons
		 * when the window loses focus
		 * 
		 * @param	e
		 */
		private function deactivate(e:Event):void {
			for each(var k:Key in left) {
				k.setPressed(false);
			}
			
			for each(k in right) {
				k.setPressed(false);
			}
			
			leftAmount = 0;
			rightAmount = 0;
		}
		
	}

}