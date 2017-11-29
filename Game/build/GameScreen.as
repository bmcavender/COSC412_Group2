package
{
	import com.gbs.game.screens.*; 

	import com.pblabs.engine.core.LevelEvent; 

	import flash.events.Event; 

	public class GameScreen extends BaseGameScreen 
	{
		public function GameScreen():void 
		{
			super(); 
			//Setup Custom UI Elements In This Class 
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Public Methods
		-------------------------------------------------------------------------------------------------------------*/
		override public function onShow():void 
		{
			super.onShow()
			//Implement if needed
		}

		override public function levelLoadComplete(event : LevelEvent):void 
		{
			super.levelLoadComplete(event)
			//Implement if needed
		}

	}
}
