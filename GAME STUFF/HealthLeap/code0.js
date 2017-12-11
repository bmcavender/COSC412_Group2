gdjs.New_32Scene_320Code = {};


gdjs.New_32Scene_320Code.GDGameTitleObjects1= [];
gdjs.New_32Scene_320Code.GDLevel1Objects1= [];
gdjs.New_32Scene_320Code.GDLevel2Objects1= [];
gdjs.New_32Scene_320Code.GDLevel3Objects1= [];
gdjs.New_32Scene_320Code.GDSubTitleObjects1= [];
gdjs.New_32Scene_320Code.GDCopyOfSubTitleObjects1= [];
gdjs.New_32Scene_320Code.GDlogoObjects1= [];

gdjs.New_32Scene_320Code.conditionTrue_0 = {val:false};
gdjs.New_32Scene_320Code.condition0IsTrue_0 = {val:false};
gdjs.New_32Scene_320Code.condition1IsTrue_0 = {val:false};
gdjs.New_32Scene_320Code.condition2IsTrue_0 = {val:false};

gdjs.New_32Scene_320Code.func = function(runtimeScene, context) {
context.startNewFrame();
gdjs.New_32Scene_320Code.GDGameTitleObjects1.length = 0;
gdjs.New_32Scene_320Code.GDLevel1Objects1.length = 0;
gdjs.New_32Scene_320Code.GDLevel2Objects1.length = 0;
gdjs.New_32Scene_320Code.GDLevel3Objects1.length = 0;
gdjs.New_32Scene_320Code.GDSubTitleObjects1.length = 0;
gdjs.New_32Scene_320Code.GDCopyOfSubTitleObjects1.length = 0;
gdjs.New_32Scene_320Code.GDlogoObjects1.length = 0;


{

gdjs.New_32Scene_320Code.GDLevel1Objects1.createFrom(runtimeScene.getObjects("Level1"));

gdjs.New_32Scene_320Code.condition0IsTrue_0.val = false;
gdjs.New_32Scene_320Code.condition1IsTrue_0.val = false;
{
gdjs.New_32Scene_320Code.condition0IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}if ( gdjs.New_32Scene_320Code.condition0IsTrue_0.val ) {
{
gdjs.New_32Scene_320Code.condition1IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(context.clearEventsObjectsMap().addObjectsToEventsMap("Level1", gdjs.New_32Scene_320Code.GDLevel1Objects1).getEventsObjectsMap(), runtimeScene, true, false);
}}
if (gdjs.New_32Scene_320Code.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.pushScene(runtimeScene, "New Scene 1");
}}

}


{

gdjs.New_32Scene_320Code.GDLevel2Objects1.createFrom(runtimeScene.getObjects("Level2"));

gdjs.New_32Scene_320Code.condition0IsTrue_0.val = false;
gdjs.New_32Scene_320Code.condition1IsTrue_0.val = false;
{
gdjs.New_32Scene_320Code.condition0IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}if ( gdjs.New_32Scene_320Code.condition0IsTrue_0.val ) {
{
gdjs.New_32Scene_320Code.condition1IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(context.clearEventsObjectsMap().addObjectsToEventsMap("Level2", gdjs.New_32Scene_320Code.GDLevel2Objects1).getEventsObjectsMap(), runtimeScene, true, false);
}}
if (gdjs.New_32Scene_320Code.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.pushScene(runtimeScene, "New Scene 2");
}}

}


{

gdjs.New_32Scene_320Code.GDLevel3Objects1.createFrom(runtimeScene.getObjects("Level3"));

gdjs.New_32Scene_320Code.condition0IsTrue_0.val = false;
gdjs.New_32Scene_320Code.condition1IsTrue_0.val = false;
{
gdjs.New_32Scene_320Code.condition0IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}if ( gdjs.New_32Scene_320Code.condition0IsTrue_0.val ) {
{
gdjs.New_32Scene_320Code.condition1IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(context.clearEventsObjectsMap().addObjectsToEventsMap("Level3", gdjs.New_32Scene_320Code.GDLevel3Objects1).getEventsObjectsMap(), runtimeScene, true, false);
}}
if (gdjs.New_32Scene_320Code.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.pushScene(runtimeScene, "New Scene 3");
}}

}

return;
}
gdjs['New_32Scene_320Code']= gdjs.New_32Scene_320Code;
