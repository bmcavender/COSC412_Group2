package com.gbs.game.screens
{

	import com.pblabs.engine.PBE; 
	import com.pblabs.engine.core.LevelEvent; 
	import com.pblabs.engine.core.LevelManager; 
	import com.pblabs.engine.entity.IEntity; 
	import com.pblabs.screens.BaseScreen; 
	import com.pblabs.screens.IScreen; 

	import flash.display.DisplayObject; 
	import flash.events.Event; 
	import flash.utils.Dictionary; 

	public class BaseGameScreen extends BaseScreen implements IGameScreen 
	{
		protected var levelScreenMap : Vector.<IGameScreen> = new Vector.<IGameScreen>(1); 
		protected var currentLevelScreen : IScreen; 

		public function BaseGameScreen():void 
		{
			super(); 

			PBE.mainStage.addEventListener(Event.RESIZE, resizeHandler); 

			initialize(); 

			LevelManager.instance.addEventListener(LevelEvent.LEVEL_PRE_LOAD_EVENT, levelPreLoad); 
			LevelManager.instance.addEventListener(LevelEvent.LEVEL_LOADED_EVENT, levelLoadComplete); 
			LevelManager.instance.addEventListener(LevelEvent.LEVEL_UNLOADED_EVENT, levelUnLoaded); 
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Public Methods 
		-------------------------------------------------------------------------------------------------------------*/
		override public function onShow():void 
		{
			levelScreenMap[currentLevel].onShow(); 
		}

		override public function onHide():void 
		{
			levelScreenMap[currentLevel].onHide(); 
		}

		override public function onFrame(delta:Number):void 
		{
			levelScreenMap[currentLevel].onFrame(delta); 
		}

		override public function onTick(delta:Number):void 
		{
			levelScreenMap[currentLevel].onTick(delta); 
		}

		public function loadLevel(levelIndex : int):void 
		{
			levelScreenMap[currentLevel].loadLevel(levelIndex); 
		}

		public function setViewSize(width : Number, height : Number):void 
		{
			levelScreenMap[currentLevel].setViewSize(width, height); 
		}

		public function levelPreLoad(event : LevelEvent):void 
		{
			//Swap Level Parenting
			if(currentLevelScreen && this.contains( currentLevelScreen as DisplayObject ))
				removeChild(currentLevelScreen as DisplayObject);

			_currentLevel = event.level;
			currentLevelScreen = levelScreenMap[currentLevel];
			levelScreenMap[currentLevel].levelToSceneMap = _levelToSceneMap;
			levelScreenMap[currentLevel].levelPreLoad(event);
			addChildAt(currentLevelScreen as DisplayObject, 0);
		}

		public function levelLoadComplete(event : LevelEvent):void 
		{
			levelScreenMap[currentLevel].levelLoadComplete(event);
		}

		public function levelUnLoaded(event : LevelEvent):void 
		{
			levelScreenMap[event.level].levelUnLoaded(event);
			if(currentLevelScreen && this.contains( currentLevelScreen as DisplayObject ))
				removeChild(currentLevelScreen as DisplayObject);
			currentLevelScreen = null;
		}

		public function clearScreen():void 
		{
			levelScreenMap[currentLevel].clearScreen(); 
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Protected Methods
		-------------------------------------------------------------------------------------------------------------*/
		protected function resizeHandler(event : Event):void
		{
			levelScreenMap[currentLevel].setViewSize(PBE.mainStage.stageWidth, PBE.mainStage.stageHeight);
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Private Methods
		-------------------------------------------------------------------------------------------------------------*/
		private function initialize():void
		{
			var basic2D :  BasicG2DGameScreen = new BasicG2DGameScreen(); 

			levelScreenMap[0] = basic2D; 
			//Level Scene Entity Name Map -----------------------------------------------------------------------------
			_levelToSceneMap[0] = 'Scene_AA0F399D-D850-009F-87C2-A38E3ABEC601'; 
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Getters & Setters
		-------------------------------------------------------------------------------------------------------------*/
		private var _levelToSceneMap : Dictionary = new Dictionary();
		public function get levelToSceneMap():Dictionary { return _levelToSceneMap; }
		public function set levelToSceneMap(dict : Dictionary):void
		{
			_levelToSceneMap = dict;
			levelScreenMap[currentLevel].levelToSceneMap = _levelToSceneMap;
		}

		public function get sceneEntity():IEntity { return levelScreenMap[currentLevel].sceneEntity; }
		public function set sceneEntity(entity : IEntity):void
		{
			levelScreenMap[currentLevel].sceneEntity = entity;
		}

		private var _currentLevel:int = 0;
		public function get currentLevel():int
		{
			return _currentLevel;
		}

	}
}
