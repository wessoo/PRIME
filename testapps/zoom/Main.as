package {
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	import id.core.Application;
	import id.core.TouchSprite;
	import gl.events.GestureEvent;
	import gl.events.TouchEvent;
	
	public class Main extends Application {
		public function Main() {
			settingsPath = "application.xml";
		}
		
		override protected function initialize():void {
			var imageLoader:Loader = new Loader();
			imageLoader.load(new URLRequest("hibiscus.jpg"));
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, completedImageLoad);
			
			var container = new TouchSprite();
			container.addChild(imageLoader);
			container.blobContainerEnabled = true;
			
			container.x = stage.stageWidth/2;
			container.y = stage.stageHeight/2;
			
			container.addEventListener(GestureEvent.GESTURE_SCALE, gestureScaleHandler);
			container.addEventListener(GestureEvent.GESTURE_ROTATE, gestureRotateHandler);
			container.addEventListener(TouchEvent.TOUCH_DOWN, startDrag_Press);
			container.addEventListener(TouchEvent.TOUCH_UP, stopDrag_Release);
			addChild(container);
		}
		
		private function completedImageLoad(e:Event):void {
			e.target.loader.x = -e.target.width/2;
			e.target.loader.y = -e.target.height/2;
		}
		
		private function gestureScaleHandler(e:GestureEvent):void {
			e.target.scaleX += e.value;
			e.target.scaleY += e.value;
		}
		
		private function gestureRotateHandler(e:GestureEvent):void {
			e.target.rotation += e.value;
		}
		
		private function startDrag_Press(e:TouchEvent):void {
			e.target.startTouchDrag(0);
		}
		
		private function stopDrag_Release(e:TouchEvent):void {
			e.target.stopTouchDrag(0);
		}
	}
}