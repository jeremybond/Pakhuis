package gamejam.game {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.filters.*;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.*;
	import flash.utils.ByteArray;
	import gamejam.entity.player.Player;
	import gamejam.Intersect;
	import gamejam.Main;
	import gamejam.util.AudioManager;
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class World {
		public static var deaths:uint = 0;
		private static var player:Player;			//the player
		public static var currentLevel:uint = 0;	//the level the player is at
		private static var level:Array;				//the current level array
		private static var tiles:Array;				//the current tiles array
		public static var playing:Boolean;			//whether the player is currently playing or not
		private static var leverAnimationPlaying:Boolean = false;
		private static var leverStill:MovieClip;
		private static var leverAnimation:MovieClip;
		public static var finished:Boolean = false;
		public static var deathsField:TextField;
		
		/**
		 * 
		 */
		public static function init():void {
			player = new Player();
			Intersect.getGame().addChild(player);
			/*player.x = Intersect.getStage().stageWidth / 2;
			player.y = Intersect.getStage().stageHeight / 2;*/
		}
		
		/**
		 * 
		 */
		public static function update():void {
			if (leverAnimationPlaying)
				if (leverAnimation.currentFrame == leverAnimation.totalFrames) {
					leverAnimation.visible = false;
					leverAnimation.stop();
					leverStill.visible = true;
				}
		}
		
		/**
		 * 
		 * @return
		 */
		public static function getPlayer():Player {
			return player;
		}
		
		/**
		 * 
		 */
		public static function start():void {
			if (player == null)
				World.init();
			tiles = new Array();
			constructLevel();
			playing = true;
			Main.backgroundGame.visible = true;
			drawDeaths();
		}
		
		/**
		 * 
		 */
		private static function constructLevel():void {
			var ba:ByteArray = new ByteArray();
			ba.writeObject(Levels.levels[currentLevel]);
			ba.position = 0;
			level = ba.readObject();
			player.bridgeParts = 0;
			player.bridgeBuilt = false;
			
			for (var y:uint = 0; y < level.length; y++) {
				tiles.push(new Array());
				for (var x:uint = 0; x < level[y].length; x++) {
					if(level[y][x] != 4) {
						var tile:MovieClip = new MovieClip();
						switch(level[y][x]) {
							case 1: //hendel
								var still:MovieClip = new HendelStill() as MovieClip;
								var pull:MovieClip = new HendelOverhaalAni() as MovieClip; //20 frames
								pull.visible = false;
								pull.stop();
								tile.addChild(still);
								tile.addChild(pull);
								still.y = pull.y = 11;
								leverStill = still;
								leverAnimation = pull;
								break;
							case 3: //deur
								var blok:MovieClip = new PlatformBlok();
								tile.addChild(blok);
								blok.width = blok.height = 43;
								blok.x = blok.y = 1;
								break;
							case 5: //muur
								var muur:MovieClip;
								if (y != 0 && level[y - 1][x] != 5 && level[y - 1][x] != 10 && Levels.levels[currentLevel][y - 1][x] != 11 && level[y - 1][x] != 13) {
									muur = new Platform1() as MovieClip;
								} else {
									muur = new Platform3() as MovieClip;
								}
								tile.addChild(muur);
								break;
							case 6: //brug
								break;
							case 7: //brugdeel
								var brugdeel:MovieClip = new BrugPickup();
								brugdeel.x = brugdeel.y = 20;
								tile.addChild(brugdeel);
								break;
							case 8: //brugbouw
								
								break;
							case 9: //finish
								var finish:MovieClip = new EindPunt();
								tile.addChild(finish);
								finish.y = 20;
								break;
							case 10: //waste
								var waste:MovieClip = new Waste();
								tile.addChild(waste);
								waste.width = 40;
								waste.height = 40 / 143.7 * 93.95;
								waste.y = 35;
								break;
							case 11: //cirkelzaag
								var zaag:MovieClip = new CirkelzaagVloerAnim();
								tile.addChild(zaag);
								zaag.x = 20;
								zaag.y = 7 * 40 + 20;
								break;
							case 12: //electrische kabels
								var kabels:MovieClip = new ElektrischekabelsAnim();
								tile.addChild(kabels);
								kabels.x = 20;
								kabels.y = 10;
								break;
							case 13: //spikes
								var spikes:MovieClip = new Spikes() as MovieClip;
								tile.addChild(spikes);
								break;
						}
						
						tiles[y].push(tile);
						(Intersect.getGame().getChildAt(1) as MovieClip).addChild(tile);
						tile.x = x * 40;
						tile.y = y * 40;
					} else {
						player.x = x * 40 + 20;
						player.y = y * 40 + 25;
						player.startLocation = new Point(player.x, player.y);
					}
				}
			}
		}
		
		/**
		 * 
		 */
		public static function reset():void {
			/*player = null;
			playing = false;
			currentLevel = 0;
			tiles = new Array();
			for each(var tile:MovieClip in tiles)
				(Intersect.getGame().getChildAt(1) as MovieClip).removeChild(tile);*/
			var url:String = Intersect.getStage().loaderInfo.url;
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, "_level0");
		}
		
		/**
		 * advance to the next level
		 */
		public static function next():void {
			if(currentLevel < 15) {
				currentLevel++;
				
				for (var i:uint = 0; i < tiles.length; i++)
					for each(var tile:MovieClip in tiles[i])
						(Intersect.getGame().getChildAt(1) as MovieClip).removeChild(tile);
				
				tiles = new Array();
				constructLevel();
			} else {
				Main.ui.credits();
				Intersect.getGame().visible = false;
				finished = true;
			}
		}
		
		/**
		 * get the tile type at a specific on-screen location
		 * 
		 * @param	x the location on the x-axis
		 * @param	y the location on the y-axis
		 * @return the tile type
		 */
		public static function tileAt(x:uint, y:uint):uint {
			x = Math.floor(x / 40);
			y = Math.floor(y / 40);
			return level[y][x];
		}
		
		/**
		 * 
		 * @return the tile with tile type @param type
		 */
		public static function findTile(type:uint):MovieClip {
			for (var i:uint = 0; i < level.length; i++) {
				for (var j:uint = 0; j < level[i].length; j++) {
					if (level[i][j] == type) {
						return tiles[i][j];
					}
				}
			}
			trace("did not find a tile with type: " + type + " in level " + currentLevel);
			return null;
		}
		/**
		 * 
		 * removes the door
		 */
		public static function removeDoor():void {
			for (var i:uint = 0; i < level.length; i++) {
				for (var j:uint = 0; j < level[i].length; j++) {
					if (level[i][j] == 3) {
						level[i][j] = 2;
						if(currentLevel == 5 || currentLevel == 6) { //cheap hack
							if((tiles[i][j - 1] as MovieClip).numChildren > 0)
								(tiles[i][j - 1] as MovieClip).removeChildAt(0);
						} else {
							if((tiles[i][j] as MovieClip).numChildren > 0)
								(tiles[i][j] as MovieClip).removeChildAt(0);
						}
						leverStill.visible = false;
						leverAnimation.visible = true;
						leverAnimation.play();
						leverAnimationPlaying = true;
						AudioManager._switch();
					}
					
				}
			}
		}
		
		/**
		 * 
		 */
		public static function removeBridgePart(x:uint, y:uint):void {
			x = Math.floor(x / 40);
			y = Math.floor(y / 40);
			if (level[y][x] == 7) {
				//trace("(" + x + ", " + y + ")[" + level[y][x] + "] has " + (tiles[y * 24 + x] as MovieClip).numChildren + " children");
				(tiles[y][x] as MovieClip).removeChildAt(0);
				level[y][x] = 2;
				player.bridgeParts++;
				AudioManager.block();
			} else
				trace("bridge part could not be located");
		}
		
		/**
		 * 
		 */
		public static function buildBridge():void {
			if(!player.bridgeBuilt)
				for (var y:uint = 0; y < level.length; y++) {
					for (var x:uint = 0; x < level[y].length; x++) {
						if (level[y][x] == 6) {
							var brugdeel:MovieClip = new PlatformBlok();
							(tiles[y][x] as MovieClip).addChild(brugdeel);
							brugdeel.width = brugdeel.height = 43;
							brugdeel.x = brugdeel.y = 1;
							player.bridgeBuilt = true;
							AudioManager.bridge();
						}
					}
				}
		}
		
		private static function drawDeaths():void {
			//construct a new textfield
			deathsField = new TextField();
			
			//set the text field type (DYNAMIC/INPUT)
			deathsField.type = TextFieldType.DYNAMIC;
			
			//set the field dimensions
			deathsField.width = 200;
			deathsField.height = 40;
			
			//construct a new textformat
			var format:TextFormat = new TextFormat("Tahoma", 20, 0xFFFFFF);
			
			//align the text to the left
			format.align = TextFormatAlign.LEFT;
			
			//set the text format
			deathsField.defaultTextFormat = format;
			
			//font is embedded
			deathsField.embedFonts = false;
			
			//text is not selectable
			deathsField.selectable = false;
			
			//set the anti aliasing type
			deathsField.antiAliasType = AntiAliasType.ADVANCED;
			
			//set the field contents
			deathsField.text = "Deaths: 0";
			
			Intersect.getStage().addChild(deathsField);
			deathsField.x = 10;
			deathsField.y = 5;
		}
	}

}