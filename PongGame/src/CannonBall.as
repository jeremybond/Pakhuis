package  
{
	import adobe.utils.CustomActions;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.DRMCustomProperties;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.utils.Timer
	import flash.events.TimerEvent;
	import Cannon;
	/**
	 * ...
	 * @author kerim birlik && jeremy bond
	 */
	public class CannonBall extends MovieClip
	{
		private var cannon				:	Cannon			=	new Cannon();
		public  var cannonBall			:	CannonBallMC 	= 	new CannonBallMC;
		public function CannonBall() 
		{
				addEventListener    (Event.ENTER_FRAME, loop);
				addChild(cannonBall);
		}
		private function loop(e:Event):void 
		{
			var numberX:Number = Math.random();
			var numberY:Number = Math.random();
			cannonBall.x 	-= 		(numberX 	* 	5)	+	9;
			cannonBall.y 	-= 		(numberY 	* 	3)	+	2;
		}
	}
}