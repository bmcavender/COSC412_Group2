package com.gbs.game
{
	import com.pblabs.engine.PBE; 
	import com.pblabs.screens.ScreenManager; 
	import com.pblabs.engine.core.LevelEvent; 
	import com.pblabs.engine.core.LevelManager; 
	import com.pblabs.engine.entity.IEntity; 
	import com.pblabs.engine.resource.XMLResource; 
	import com.pblabs.engine.resource.ResourceManager; 
	import com.pblabs.engine.serialization.Serializer; 

	import com.gbs.engine.controllers.ControllerInputManager; 

	import flash.display.StageAlign; 
	import flash.display.StageScaleMode; 

	//Plugin ClassList Imports 

	import flash.display.Sprite; 
	import flash.events.Event; 

	public class BaseGame extends Sprite 
	{
		public var globalGameObject : IEntity;

		public function BaseGame():void {
			PBE.IS_SHIPPING_BUILD = true;
			//Adobe AIR bug requires the GameInput class to be initialized in the first frame of the app 
			ControllerInputManager.initialize(); 

			this.addEventListener(Event.RESIZE, stageResizeHandler, true, 100); 

		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Public Methods
		-------------------------------------------------------------------------------------------------------------*/
		public function startUp():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE; 
			stage.align = StageAlign.TOP_LEFT; 

			registerTypes(); 

			if(!PBE.started) 
				PBE.startup(this); 

			ControllerInputManager.instance.setup(PBE.mainStage); 

			new EntityCallBacks(); 

			//The following line could be removed and the ResourceLoaderComponent would still load the resources assigned in the editor.
			//This just embeds the resources in the swf at compile time. A better option here would be to use an ExternalResource,
			//which could be loaded per level and reduce final swf size. These options will be added to the editor in a future release.
			new EmbeddedResources(); 

			ScreenManager.instance.registerScreen("splash", new SplashScreen()); 
			ScreenManager.instance.registerScreen("game", new GameScreen()); 
		
			//Load Globals 
			var globalsResource : XMLResource = PBE.resourceManager.load("levels/GlobalsDescriptor.xml", XMLResource, onGlobalObjectLoaded) as XMLResource; 
			if(globalsResource && globalsResource.isLoaded) 
				onGlobalObjectLoaded(globalsResource); 
		
			ScreenManager.instance.moveto("game"); 
			ScreenManager.instance.push("splash"); 

			LevelManager.instance.addEventListener(LevelEvent.LEVEL_LOADED_EVENT, onLevelLoaded); 
			LevelManager.instance.load("levels/LevelsDescriptor.xml", 0); 
		
		}

		public function loadLevel(index : int = 0):void 
		{
			LevelManager.instance.loadLevel(index, true); 
		}

		/*-----------------------------------------------------------------------------------------------------------
		*                                          Protected Methods
		-------------------------------------------------------------------------------------------------------------*/
		protected function stageResizeHandler(event : Event):void
		{
			calculateContentScaleFactor();
		}

		protected function calculateContentScaleFactor():void
		{
		}

		protected function findClosestSupportedScaleFactor(supportedResolutions:Vector.<Number>, contentScaleFactor : Number = 1):Number
		{
			var scaleFactor:Number = contentScaleFactor;
			var closestScale:Number = 1;
			for(var i : int = 0; i < supportedResolutions.length; i++){
				var foundRes : Number = supportedResolutions[i];
				if (!closestScale || Math.abs(foundRes - scaleFactor) < Math.abs(closestScale - scaleFactor)) closestScale = foundRes;
			}
			return closestScale;
		}

		protected function onGlobalObjectLoaded( globalResourceData : XMLResource ):void 
		{
			if(!globalResourceData || globalResourceData.XMLData.globalObject == undefined || globalResourceData.XMLData.globalObject == null)
				return;
			globalGameObject = PBE.allocateEntity();
			Serializer.instance.deserialize(globalGameObject, globalResourceData.XMLData.globalObject[0].entity[0]);
			globalGameObject.initialize(null, String(globalResourceData.XMLData.globalObject[0].@name));
			PBE.GLOBAL_DYNAMIC_OBJECT.Globals = globalGameObject.Self;
		}

		protected function onLevelLoaded(event : LevelEvent):void 
		{
			//Implement if needed
		}

		protected function registerTypes():void 
		{
			PBE.registerType(PBEClassList); 
			PBE.registerType(GamesCoreClassList); 
			PBE.registerType(PlatformerClassList); 
		}
	}
}
