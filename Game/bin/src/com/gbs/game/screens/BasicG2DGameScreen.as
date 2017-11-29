package com.gbs.game.screens
{
	import com.pblabs.engine.PBE; 
	import com.pblabs.engine.core.PBGroup; 
	import com.pblabs.screens.BaseScreen; 
	import com.pblabs.rendering2D.ui.*; 
	import com.pblabs.engine.core.LevelEvent; 
	import com.pblabs.engine.core.GlobalExpressionManager; 
	import com.pblabs.engine.entity.IEntity; 
	import com.pblabs.engine.serialization.Serializer;
	import com.pblabs.engine.resource.ResourceManager; 
	import com.pblabs.starling2D.SceneViewG2D;
	import com.pblabs.physics.IPhysics2DManager;


	import flash.display.DisplayObject; 
	import flash.display.DisplayObjectContainer; 
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.utils.Dictionary; 

	import starling.display.Sprite;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;

	public class BasicG2DGameScreen extends BaseScreen implements IGameScreen 
	{
		public var gameView : IUITarget;
		public var uiLayer : Sprite = new Sprite();
		private var _debugLayer : DisplayObject;
		
		public function BasicG2DGameScreen():void 
		{
		}


		/*-----------------------------------------------------------------------------------------------------------
		*                                          Public Methods
		-------------------------------------------------------------------------------------------------------------*/
		public function loadLevel(levelIndex : int):void
		{
			PBE.levelManager.loadLevel(levelIndex, true);
		}

		public function setViewSize(width : Number, height : Number) : void
		{
			if(gameView){
				gameView.setSize(width, height);
			}
		}

		public function clearScreen():void
		{
			if(!gameView) return;

			var _spawnedGroup : PBGroup = PBE.nameManager.lookup("SpawnedEntities") as PBGroup;
			if(_spawnedGroup) {
				_spawnedGroup.destroy();
			}



		}

		public function levelPreLoad(event : LevelEvent):void 
		{

			if(!gameView) {
			//This SceneView object is automatically injected into SceneDisplayObjects by PBE when the sceneView getter of a SceneDisplayObject 
			//is called. It uses PBE's PBE.findChild(viewName) method and traverses the display list to get the following SceneView instance 
			//You do not have to add gameView to the stage because it is automagically done for you in the constructor of SceneView but it ads it to the mainStage class passed to PBE.startup(). 
				gameView = new SceneViewG2D('auto', 'auto');
				(gameView as SceneViewG2D).starlingInstance.addEventListener("rootCreated", onSceneInitialized);
				addChild(gameView as DisplayObjectContainer);
			}
			//This will be overriden everytime a new level is loaded so that the
			//current levels' sceneView is brought over from the editor
			var sceneViewXML : XML = PBE.templateManager.getXML('defaultSceneView', 'sceneView');


			Serializer.instance.deserialize(gameView, sceneViewXML, sceneViewXML.@type);
			gameView.width = sceneViewXML.width;
			gameView.height = sceneViewXML.height;

			GlobalExpressionManager.instance.baseScreenSize = new Point(Number(sceneViewXML.width), Number(sceneViewXML.height));
			GlobalExpressionManager.instance.calculateScreenSize();
		}

		public function levelLoadComplete(event : LevelEvent):void 
		{
			sceneEntity = PBE.lookupEntity(levelToSceneMap[event.level]); 
		}

		public function levelUnLoaded(event : LevelEvent):void
		{
			clearScreen();
		}

		public function onSceneInitialized(event : *):void
		{
			if(!PBE.IS_SHIPPING_BUILD){
				(gameView as SceneViewG2D).starlingInstance.showStats = true;
			}else{
				(gameView as SceneViewG2D).starlingInstance.showStats = false;
			}
			(gameView as SceneViewG2D).starlingInstance.stage.addChild( uiLayer );
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Getters & Setters
		-------------------------------------------------------------------------------------------------------------*/
		private var _levelToSceneMap : Dictionary = new Dictionary();
		public function get levelToSceneMap():Dictionary { return _levelToSceneMap; }
		public function set levelToSceneMap(dict : Dictionary):void
		{
			_levelToSceneMap = dict;
		}

		private var _sceneEntity : IEntity;
		public function get sceneEntity():IEntity { return _sceneEntity; }
		public function set sceneEntity(entity : IEntity):void
		{
			_sceneEntity = entity;
		}

	}
}
