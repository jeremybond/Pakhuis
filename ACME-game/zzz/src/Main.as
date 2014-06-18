package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Main extends Sprite
        {
            public var _player:Sprite = new player;
			public var _straal:Sprite = new blik;
			public var _spook:Sprite = new Spook1;
			public var _kamer:Sprite = new bg3;
		   
			public var bool1:Boolean = false;
			public var boolcheckifhit:Boolean = true;
			public var boolcheck1:Boolean = false;
			public var timerbool:Boolean = true;
			public var laatsteboolean:Boolean = false;
		   
			public var int1:int = 0; // verplaatsen van spookje
			public var int2:int = 0; // het wachten voor aanvallen
			public var int3:int = 0; // weghalen van straal
			public var running:int = 0; // rennen
			public var downSize:Number = 1;
			public function Main()
                {
					addChild(_kamer);
					_kamer.width = stage.stageWidth;
					_kamer.height = stage.stageHeight;
					
					_player.y = 400;
					addChild(_player);
					_straal.y = _player.y + _player.height - 150;
					addChild(_spook);
					addEventListener(Event.ENTER_FRAME, gameLoop);
					stage.addEventListener(KeyboardEvent.KEY_DOWN, keycodes);
                }
				
				
               
               
                private function keycodes(e:KeyboardEvent):void
                {
					//trace(e.keyCode);
					if (e.keyCode == 37)
					{
							_player.x -= 10;
					}
					if (e.keyCode == 39)
					{
							_player.x += 10;
					}
					if (e.keyCode == 32 && timerbool == true)
					{
							_straal.graphics.lineStyle(1, 0x00ffff, 0.4);
							_straal.graphics.beginFill(0x00ffff, 0.8);
							_straal.graphics.drawRect(0, -580, 50, 600);
							addChild(_straal);
							removeChild(_player);
							addChild(_player);
							timerbool = false;
						   
					}
                }
               
                private function gameLoop(e:Event):void
                {
					_straal.x = _player.x + 20;
					int1++;
					int2++;
					int3++;
					if (int3 >= 30)// weghalen van straal
					{
							_straal.graphics.clear();
							//removeChild(_straal);
							int3 = 0;
					}
					if (int2 >= 100)// het wachten voor aanvallen
					{
						   
							timerbool = true;
							int2 = 0;
					}
					if (int1 >= 60 && laatsteboolean == false)// verplaatsen van spookje
					{
							_spook.x = Math.random() * 600;
							_spook.y = Math.random() * 200;
							int1 = 0;
					}
					if (_straal.hitTestObject(_spook) && boolcheckifhit == true)
					{
							_spook.scaleX /= 1.2;
							_spook.scaleY /= 1.2;
							boolcheckifhit = false;
							running++;
					}
					else if (!_straal.hitTestObject(_spook))
					{
							boolcheckifhit = true;
						   
					}
					if (running >= 5)
					{
						if (downSize >= 0.01)
						{
							downSize = _spook.scaleX;
							downSize = downSize - 0.01;
						   
							_spook.scaleX = downSize;
							_spook.scaleY = downSize;
						}
						laatsteboolean = true;
						_spook.x++;
					}
					//_spook.graphics.clear();
					//_spook.graphics.beginFill(0x000000, 0.1);
					//_spook.graphics.drawRect(0, 40, 40, 40);
				   
                }
               
               
        }
 
}