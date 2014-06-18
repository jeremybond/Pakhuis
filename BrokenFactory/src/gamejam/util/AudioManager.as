package gamejam.util {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Simon Kok
	 */
	public class AudioManager {
		private var channel:SoundChannel;
		[Embed(source="../../../lib/audio/Block.mp3")]
		private static var Block:Class;
		[Embed(source="../../../lib/audio/Bridge.mp3")]
		private static var Bridge:Class;
		[Embed(source="../../../lib/audio/Electricity.mp3")]
		private static var Electricity:Class;
		[Embed(source="../../../lib/audio/Hiss.mp3")]
		private static var Hiss:Class;
		[Embed(source="../../../lib/audio/Saw.mp3")]
		private static var Saw:Class;
		[Embed(source="../../../lib/audio/Spikes.mp3")]
		private static var Spikes:Class;
		[Embed(source="../../../lib/audio/Switch.mp3")]
		private static var Switch:Class;
		[Embed(source="../../../lib/audio/Theme.mp3")]
		public static var Theme:Class;
		
		public static function block():void {
			(new Block() as Sound).play();
		}
		
		public static function bridge():void {
			(new Bridge() as Sound).play();
		}
		
		public static function electricity():void {
			(new Electricity() as Sound).play();
		}
		
		public static function hiss():void {
			(new Hiss() as Sound).play();
		}
		
		public static function saw():void {
			(new Saw() as Sound).play();
		}
		
		public static function spikes():void {
			(new Spikes() as Sound).play();
		}
		
		public static function _switch():void {
			(new Switch() as Sound).play();
		}
	}

}