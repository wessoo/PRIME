package {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import id.core.Application;
	import id.core.TouchSprite;
	import gl.events.GestureEvent;
	
	public class Main extends Application {
		private var ball:MovieClip;
		private var container:TouchSprite;
		private var friction:Number = 0.985;
		private var dx:Number = 0;
		
		public function Main() {
			container = new TouchSprite();
			ball = new rubberBall();
			container.addChild(ball);
			
			container.x = stage.stageWidth/2;
			container.y = stage.stageHeight/2;
			container.blobContainerEnabled = true;
			
			container.addEventListener(GestureEvent.GESTURE_FLICK, gestureFlickHandler);
			
			addChild(container);
		}
		
		private function gestureFlickHandler(e:GestureEvent):void {
			dx = e.velocityX;
			addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
		}
		
		private function onEnterFrameHandler(e:Event):void {
			if(container.x < ball.width/2) {
				dx =- dx;
				container.x = ball.width/2
			}
			if(container.x > stage.stageWidth - ball.width/2) {
				dx =- dx;
				container.x = stage.stageWidth - ball.width/2
			}			
			if(Math.abs(dx) <= 1) {
				dx = 0;
				removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
			}
			
			container.x += dx;
			dx *= friction;
		}
	}
}