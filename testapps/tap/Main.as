package {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	import id.core.Application;
	import id.core.TouchSprite;
	import gl.events.TouchEvent;
	
	public class Main extends Application {
		private var mysound:Sound;
		
		public function Main() {
			settingsPath = "application.xml";
		}
		
		override protected function initialize():void {
			var container = new TouchSprite();
			
			container.addChild(snarepad);
			container.addEventListener(TouchEvent.TOUCH_TAP, snare_Tap);
			addChild(container);
			
			mysound = new Sound(new URLRequest("snare.mp3"));
		}
		
		private function snare_Tap(event:TouchEvent):void {
			var channel:SoundChannel;
			
			channel = mysound.play();
		}
	}
}