package
{
	import com.gbs.game.BaseGame; 
	import com.pblabs.engine.PBE; 
	import com.pblabs.engine.core.LevelEvent; 
	import flash.events.Event; 

	public class Game extends BaseGame 
	{
		public function Game():void 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Public Methods
		-------------------------------------------------------------------------------------------------------------*/
		public function init(event : Event):void 
		{
			startUp();
		}

		override public function startUp():void 
		{
			if(PBE.started) return;
			super.startUp();
			//Subclass if you need to
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Protected Methods
		-------------------------------------------------------------------------------------------------------------*/
		override protected function onLevelLoaded(event : LevelEvent):void 
		{
			//Implement if needed
		}
	}
}
