package {
	import flash.display.MovieClip;
	
	import id.core.Application;
	import id.core.TouchSprite;
	import gl.events.TouchEvent;
	
	public class Main extends Application {
		public function Main() {
			settingsPath="application.xml";
		}
		
		override protected function initialize():void {
			for (var i=0; i<4; i++) {
				var container = new TouchSprite();
				
				var gw_coin = new coin();
				container.addChild(gw_coin);				
				container.x = Math.random()*stage.stageWidth/2;
				container.y = Math.random()*stage.stageWidth/2;
				
				container.blobContainerEnabled = true;				
				container.addEventListener(TouchEvent.TOUCH_DOWN, startDrag_Press);
				container.addEventListener(TouchEvent.TOUCH_UP, stopDrag_Release);
				addChild(container);
			}
		}
		
		private function startDrag_Press(e:TouchEvent):void {
			e.target.startTouchDrag(0);
		}
		
		private function stopDrag_Release(e:TouchEvent):void {
			e.target.stopTouchDrag(0);
		}
	}
}