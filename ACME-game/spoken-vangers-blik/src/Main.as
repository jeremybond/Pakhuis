package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	
	
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Main extends Sprite 
	{
		
		//	private var enemies:Array;
		
		private var bSpawn:Timer;
		
		public static var Blikken:Array;
		
		
		public var horKey:Number;
		public var spacePressed:Boolean;
		public var _player:Player;
		public var _blik:Blik;
		
		
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			_player = new Player;
			addChild(_player);
			_player.x = 300;
			_player.y = 450;
			
			
			Blikken = new Array;
			
			
			spacePressed = false;
			
			
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
			
			
		}
		
		//public function spawnBlikken(e:KeyboardEvent):void
			//{
				//trace("lol");
				//Blikken.push(new Blik());
				//addChild(Blikken[Blikken.length - 1]);
			//}
		private function loop(e:Event):void 
		{
			_player.x += 10 * horKey;
			
			if (spacePressed == true)
			{
				Blikken + 1;
			}
			
			for (var i:int = 0; i < Blikken.length; i++) 
			{
				addChild(_blik);
				
				if (i > Blikken.length) 
				{
					trace("remove child thingie")
					removeChild(Blikken[i]);
					Blikken.splice(i, 1);
				}
			}
			
			
			
			
			
			
			
			
			
			
		}
		private function onKeyPressed(e:KeyboardEvent):void
		{
			if (e.keyCode == 65)
			{
				horKey = -1;
			}
			if (e.keyCode == 68)
			{
				horKey = 1;
			}
			if (e.keyCode == 32)
			{
				spacePressed = true;
			}
		}
		private function onKeyReleased(e:KeyboardEvent):void 
		{
			if (e.keyCode == 65)
			{
				horKey = 0;
			}
			if (e.keyCode == 68)
			{
				horKey = 0;
			}
			if (e.keyCode == 32)
			{
				spacePressed == false;
			}
		}
	}
	
}