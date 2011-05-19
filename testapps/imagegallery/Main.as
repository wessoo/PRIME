package {
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	import id.core.Application;
	import id.core.TouchSprite;
	import gl.events.TouchEvent;
	import gl.events.GestureEvent;
	
	public class Main extends Application {
		public function Main() {
			settingsPath="application.xml";
		}
		
		override protected function initialize():void {
			var orchidTouchSprite = new TouchSprite();
			var orchidLoader = new Loader();
			
			orchidLoader.load(new URLRequest("orchid.jpg"));
			orchidLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderComplete);
			
			orchidTouchSprite.x = Math.random()*stage.stageWidth;
			orchidTouchSprite.y = Math.random()*stage.stageHeight;
			orchidTouchSprite.rotation = Math.random()*360;			
			orchidTouchSprite.blobContainerEnabled = true;
			
			orchidTouchSprite.addEventListener(TouchEvent.TOUCH_DOWN, startDrag_Press);
			orchidTouchSprite.addEventListener(TouchEvent.TOUCH_UP, stopDrag_Release);
			orchidTouchSprite.addEventListener(GestureEvent.GESTURE_ROTATE, gestureRotateHandler);
			orchidTouchSprite.addEventListener(GestureEvent.GESTURE_SCALE, gestureScaleHandler);
			
			orchidTouchSprite.addChild(orchidLoader);
			addChild(orchidTouchSprite);
			
			var beeSprite = new TouchSprite();
			var beeLoader=new Loader();
			beeLoader.load(new URLRequest("bee.jpg"));
			beeLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,loaderComplete);
			beeSprite.x = Math.random()*stage.stageWidth;
			beeSprite.y = Math.random()*stage.stageHeight;
			beeSprite.rotation = Math.random()*360
			beeSprite.blobContainerEnabled = true;

			beeSprite.addEventListener(TouchEvent.TOUCH_DOWN, startDrag_Press);
			beeSprite.addEventListener(TouchEvent.TOUCH_UP, stopDrag_Release);
			beeSprite.addEventListener(GestureEvent.GESTURE_ROTATE, gestureRotateHandler);
			beeSprite.addEventListener(GestureEvent.GESTURE_SCALE, gestureScaleHandler);
			beeSprite.addChild(beeLoader);
            addChild(beeSprite);
		}
		
		private function loaderComplete(e:Event):void {
			e.target.loader.x = -e.target.width/2;
			e.target.loader.y = -e.target.height/2;
		}
		
		private function startDrag_Press(e:TouchEvent):void {
			e.target.startTouchDrag(-1);
		}
		
		private function stopDrag_Release(e:TouchEvent):void {
			e.target.stopTouchDrag(-1);
		}
		
		private function gestureRotateHandler(e:GestureEvent):void {
			e.target.rotation += e.value;
		}
		
		private function gestureScaleHandler(e:GestureEvent):void {
			e.target.scaleX += e.value;
			e.target.scaleY += e.value;
		}
	}
}