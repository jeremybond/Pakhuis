package  
{
	import adobe.utils.CustomActions;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Player.player;
	import Player;
	/**
	 * ...
	 * @author kerim birlik && jeremy bond
	 */
	public class Cannon extends MovieClip
	{
		private var 	ballTimer			:Timer;
		private var 	_allCannonBalls		:Array 			= 	[];
		public	var 	lifes				:int      		= new int();
		public 	var 	cannon				:CannonMC 		= new CannonMC();
		public function Cannon() 
		{
			//addEventListener(Event.ENTER_FRAME, update);
			ballTimer = new Timer(5000, 0);
			ballTimer.addEventListener	(TimerEvent.TIMER, 		shootingBallz);
			ballTimer.start();
			cannon.x 	= 	760;
			cannon.y 	= 	500;
			lifes       =   5;
			addChild(cannon);
		}
		
		private function update(e:Event):void 
		{
			var le:int = _allCannonBalls.length - 1;
			
			for (var i:int = 0; i < le; i++) 
			{
			    //if (_allCannonBalls[i].hitTestObject(player)) {
				//	trace("Playerhit");
				//}
				//if (_allCannonBalls[i].hitTestObject(tower1)) {
				//	trace("Towerhit");
				//}
			}
			
		}
		
		private function shootingBallz(e:Event):void 
		{
			var ncb 	:	CannonBall 	= 	new CannonBall();//ncb = new cannon ball
			_allCannonBalls.push(ncb);
			addChild(ncb);
			ncb.x = cannon.x;
			ncb.y = cannon.y;
			
		}
		
		
	}

}