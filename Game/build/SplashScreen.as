package
{
	import com.pblabs.animation.Tween;
	import com.pblabs.engine.core.LevelEvent;
	import com.pblabs.engine.core.LevelManager;
	import com.pblabs.engine.util.ImageUtil;
	import com.pblabs.screens.BaseScreen;
	import com.pblabs.screens.ScreenManager;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	public final class SplashScreen extends BaseScreen 
	{

		[Embed(source="/GBS_Splash.png")]
		public var splashClass : Class;

		private var _splashContainer : Bitmap;
		private var _custom : Boolean = false;
		private var _fadeOut : Tween;

		public function SplashScreen():void 
		{
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Public Methods
		-------------------------------------------------------------------------------------------------------------*/
		override public function onShow():void
		{
			LevelManager.instance.addEventListener(LevelEvent.LEVEL_LOADED_EVENT, levelLoadComplete);
			this.stage.addEventListener(Event.RESIZE, onStageResize);
			init();
		}

		override public function onHide():void
		{
			close();
			if(_fadeOut)
				_fadeOut.dispose();
		}

		public function close():void 
		{
			this.stage.removeEventListener(Event.RESIZE, onStageResize);
			this.removeChild( _splashContainer );
			ScreenManager.instance.pop();
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Protected Methods
		-------------------------------------------------------------------------------------------------------------*/
		protected function init():void 
		{
			resizeLogo();
			this.addChild( _splashContainer );
			center();
		}

		protected function resizeLogo():void 
		{
			if(_splashContainer && _splashContainer.bitmapData)
				_splashContainer.bitmapData.dispose();
			_splashContainer = new Bitmap(new this.splashClass().bitmapData as BitmapData);
			if(!_custom){
				if(_splashContainer.width > (this.stage.stageWidth * 0.6) || _splashContainer.height >= (this.stage.stageHeight * 0.6))
				{
					_splashContainer = ImageUtil.resizeBitmap( _splashContainer, (this.stage.stageWidth * 0.6), (this.stage.stageHeight * 0.6));
				}
				var bg : BitmapData = new BitmapData(this.stage.stageWidth, this.stage.stageHeight, false, 0xFFFFFF);
				bg.copyPixels(_splashContainer.bitmapData, _splashContainer.getBounds(_splashContainer), new Point(( (this.stage.stageWidth - _splashContainer.width) * .5), ((this.stage.stageHeight - _splashContainer.height) * .5) ))
				_splashContainer.bitmapData.dispose();
				_splashContainer.bitmapData = bg;
			}
		}

		protected function center():void 
		{
			_splashContainer.x = (this.stage.stageWidth - _splashContainer.width) * .5;
			_splashContainer.y = (this.stage.stageHeight - _splashContainer.height) * .5;
		}

		protected function onStageResize(event:Event):void
		{
			resizeLogo();
			this.addChild( _splashContainer );
			center();
		}

		protected function levelLoadComplete(event : LevelEvent):void
		{
			_fadeOut = new Tween(null, _splashContainer, 1, {"alpha": 1}, {"alpha": 0}, null, fadeOutCompleted );
		}

		protected function fadeOutCompleted(tween : Tween):void
		{
			close();
		}

		public function get splashContainer():Bitmap{ return _splashContainer; }
	}
}
