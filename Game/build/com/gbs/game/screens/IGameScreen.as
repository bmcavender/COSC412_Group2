package com.gbs.game.screens
{
	import com.pblabs.engine.core.LevelEvent;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.screens.IScreen;

	import flash.utils.Dictionary; 

	public interface IGameScreen extends IScreen 
	{
		function loadLevel(levelIndex : int):void;
		function setViewSize(width : Number, height : Number) : void;
		function levelPreLoad(event : LevelEvent):void;
		function levelLoadComplete(event : LevelEvent):void;
		function levelUnLoaded(event : LevelEvent):void;
		function clearScreen():void;

		function get levelToSceneMap():Dictionary;
		function set levelToSceneMap(dict : Dictionary):void;
		function get sceneEntity():IEntity;
		function set sceneEntity(entity : IEntity):void;
	}
}
