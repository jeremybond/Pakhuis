package 
{
	import flash.accessibility.AccessibilityImplementation;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Main extends Sprite 
	{
		
		private var _timer1:Timer;
		private var _bGround:bg = new bg;
		private var _player:Player = new Player;
		private var _enemy:Ants;
		private var _bullet:Bullet = new Bullet;
		private var _shot:Boolean = false;
		
		public static var Bullets:Array;
		public static var Enemys:Array = new Array;
		public static var _stage:Stage;
		
		public var welkeMier:int = new int;
		
		public function Main():void 
		{
			if	 (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			_stage = stage;
			Bullets = new Array(1);
			_enemy = new Ants();
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(_bGround);
			_bGround.width = stage.stageWidth;
			_bGround.height = stage.stageHeight;
			
			addChild(_player);
			_player.x = (stage.stageWidth / 2);
			_player.y = (stage.stageHeight / 2);
			
			//trace(stage.stageWidth);
			//trace(stage.stageHeight);
			
			addEventListener(Event.ENTER_FRAME, gameloop);
			addEventListener(MouseEvent.CLICK, shoot)
			
			
			//Bullets[Bullets.length -1].x = _player.x;
			//Bullets[Bullets.length -1].y = _player.y;
			
			_timer1 = new Timer(1000);
			_timer1.addEventListener(TimerEvent.TIMER, spawnMier);
			_timer1.start();
			
		}
		private function shoot(e:MouseEvent):void 
		{
			
			Bullets.push(new Bulet);
			addChild(Bullets[Bullets.length - 1]);
			Bullets[Bullets.length -1].rotation = _player.rotation;
			Bullets[Bullets.length -1].x = _player.x;
			Bullets[Bullets.length -1].y = _player.y;
			Bullets[Bullets.length - 1].move(35);// 35 staat voor het stukkie dat de kogel van hetmiddel punt afzit
			
		}
		
		private function spawnMier(e:Event):void 
		{
			Enemys.push(new Ants())
			addChild(Enemys[Enemys.length -1]);
			welkeMier = Math.random();
			
		}
		private function gameloop(e:Event):void 
		{
			var cx:Number = mouseX - _player.x;
			var cy:Number = mouseY - _player.y;
			
			//var RadiansM:Number = Math.atan2(my, mx);
			var Radians:Number = Math.atan2(cy, cx); 
			
			//var DegreesM:Number = RadiansM * 180 / Math.PI;
			var Degrees:Number = Radians * 180 / Math.PI;
			
			for each (var item:Bulet in Bullets)
			{
				
				var gx:Number =  _player.x - item.x ;
				var gy:Number =  _player.y - item.y;
				
				
				var RadiansB:Number = Math.atan2(gy, gx);
				
				var DegreesB:Number = RadiansB * 180 / Math.PI;
				
				var movex:Number = Math.cos(RadiansB) * 5;
				var movey:Number = Math.sin(RadiansB) * 5;
				
				item.x -= movex * 3;
				item.y -= movey * 3;
					//if(item.x < -20 || item.x > 820 || item.y < -20 || item.y > 620) 
					//{
						//for (var i:int = Bullets.numChildren; i > 1; i--) 	
						//{
							//Bullets.splice(Bullets.indexOf(item), 1);
							//removeChildAt(i-1);
						//}
					//}
			}
			for each (var enemie:Ants in Enemys)
			{
				// hier krijgen de variabelen mx en my een waarde
				var mx:Number =  _player.x - enemie.x;
				var my:Number =  _player.y - enemie.y;
				
				// hier wordt de radians berekent.
				var RadiansM:Number = Math.atan2(my, mx); 
				// hier wordt de rotatie berekent
				var DegreesM:Number = RadiansM * 180 / Math.PI;
				// hier krijgt de enemie de rotatie
				enemie.rotation = DegreesM;
				//hier worden de de y en x positie berekent
				var aX:int =  enemie.x + (_player.x - enemie.x);
				var aY:int =  enemie.y + (_player.y - enemie.y);
				
				//hier worden de x en y as berekent door de .. door sinus en cosinus te vermenigvuldigen
				var xmove:Number = Math.cos(RadiansM) * 5;
				var ymove:Number = Math.sin(RadiansM) * 5;
				//hier bewegen de mieren
				enemie.x += xmove;
				enemie.y += ymove;
			}
			
			_player.rotation = Degrees;
		
		}
		
		
	}
	
}