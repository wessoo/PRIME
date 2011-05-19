package {
	import flash.display.MovieClip;
	
	import gl.events.GestureEvent;
	import id.core.Application;
	import id.core.TouchSprite;
	
	public class Main extends Application {
		public function Main() {
			settingsPath = "application.xml";
		}
		
		override protected function initialize():void {
			var stick = new Stick();
			stick.x = stage.stageWidth/2;
			stick.y = stage.stageHeight/2;
			addChild(stick);
			
			var container = new TouchSprite();
			var pinwheel = new pinWheel();
			container.addChild(pinwheel);
			container.blobContainerEnabled = true;
			
			container.x = stage.stageWidth/2;
			container.y = stage.stageHeight/2;
			
			container.addEventListener(GestureEvent.GESTURE_ROTATE, gestureRotateHandler);
			addChild(container);
		}
		
		private function gestureRotateHandler(e:GestureEvent):void {
			e.target.rotation += e.value;
		}
	}
}