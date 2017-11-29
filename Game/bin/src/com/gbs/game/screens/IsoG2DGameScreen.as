package com.gbs.game.screens
{
	import com.pblabs.engine.PBE; 
	import com.pblabs.engine.core.PBGroup; 
	import com.pblabs.engine.core.GlobalExpressionManager; 
	import com.pblabs.engine.core.LevelEvent; 
	import com.pblabs.screens.BaseScreen; 
	import com.pblabs.rendering2D.ui.IUITarget; 
	import com.pblabs.engine.entity.IEntity; 
	import com.pblabs.engine.serialization.Serializer;
	import com.pblabs.engine.resource.ResourceManager; 
	import com.mslabs.pbe.isoG2D.scene.IsoSceneViewG2D;
	import com.mslabs.pbe.isoG2D.scene.IsoSceneLayerG2D;
	import com.pblabs.physics.IPhysics2DManager;

	import flash.utils.Dictionary; 
	import flash.geom.Rectangle; 
	import flash.geom.Point; 

	import starling.display.Sprite;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;

	public class IsoG2DGameScreen extends BaseScreen implements IGameScreen 
	{
		public var gameView : IUITarget;
		public var uiLayer : Sprite = new Sprite();
		
		public function IsoG2DGameScreen():void 
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
				gameView = new IsoSceneViewG2D('auto', 'auto');
				(gameView as IsoSceneViewG2D).starlingInstance.addEventListener("rootCreated", onSceneInitialized);
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
			var scenes : Array = sceneEntity.lookupComponentsByType( IsoSceneLayerG2D ); 
			for(var i : int = 0; i < scenes.length; i++){
				var scene : IsoSceneLayerG2D = scenes[i] as IsoSceneLayerG2D; 
				scene.autoSort = true; 
			} 
		}

		public function levelUnLoaded(event : LevelEvent):void
		{
			clearScreen();
		}

		public function onSceneInitialized(event : *):void
		{
			if(!PBE.IS_SHIPPING_BUILD){
				(gameView as IsoSceneViewG2D).starlingInstance.showStats = true;
			}else{
				(gameView as IsoSceneViewG2D).starlingInstance.showStats = false;
			}
			(gameView as IsoSceneViewG2D).starlingInstance.stage.addChild( uiLayer );
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
