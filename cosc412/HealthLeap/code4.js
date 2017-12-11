gdjs.New_32Scene_324Code = {};


gdjs.New_32Scene_324Code.GDNewObjectObjects1= [];
gdjs.New_32Scene_324Code.GDNewObject2Objects1= [];
gdjs.New_32Scene_324Code.GDNewObject3Objects1= [];
gdjs.New_32Scene_324Code.GDNewObject4Objects1= [];
gdjs.New_32Scene_324Code.GDNewObject5Objects1= [];
gdjs.New_32Scene_324Code.GDNewObject6Objects1= [];
gdjs.New_32Scene_324Code.GDNewObject7Objects1= [];
gdjs.New_32Scene_324Code.GDCopyOfNewObjectObjects1= [];
gdjs.New_32Scene_324Code.GDCopyOfCopyOfNewObjectObjects1= [];

gdjs.New_32Scene_324Code.conditionTrue_0 = {val:false};
gdjs.New_32Scene_324Code.condition0IsTrue_0 = {val:false};
gdjs.New_32Scene_324Code.condition1IsTrue_0 = {val:false};
gdjs.New_32Scene_324Code.condition2IsTrue_0 = {val:false};

gdjs.New_32Scene_324Code.func = function(runtimeScene, context) {
context.startNewFrame();
gdjs.New_32Scene_324Code.GDNewObjectObjects1.length = 0;
gdjs.New_32Scene_324Code.GDNewObject2Objects1.length = 0;
gdjs.New_32Scene_324Code.GDNewObject3Objects1.length = 0;
gdjs.New_32Scene_324Code.GDNewObject4Objects1.length = 0;
gdjs.New_32Scene_324Code.GDNewObject5Objects1.length = 0;
gdjs.New_32Scene_324Code.GDNewObject6Objects1.length = 0;
gdjs.New_32Scene_324Code.GDNewObject7Objects1.length = 0;
gdjs.New_32Scene_324Code.GDCopyOfNewObjectObjects1.length = 0;
gdjs.New_32Scene_324Code.GDCopyOfCopyOfNewObjectObjects1.length = 0;


{

gdjs.New_32Scene_324Code.GDCopyOfCopyOfNewObjectObjects1.createFrom(runtimeScene.getObjects("CopyOfCopyOfNewObject"));

gdjs.New_32Scene_324Code.condition0IsTrue_0.val = false;
gdjs.New_32Scene_324Code.condition1IsTrue_0.val = false;
{
gdjs.New_32Scene_324Code.condition0IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}if ( gdjs.New_32Scene_324Code.condition0IsTrue_0.val ) {
{
gdjs.New_32Scene_324Code.condition1IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(context.clearEventsObjectsMap().addObjectsToEventsMap("CopyOfCopyOfNewObject", gdjs.New_32Scene_324Code.GDCopyOfCopyOfNewObjectObjects1).getEventsObjectsMap(), runtimeScene, true, false);
}}
if (gdjs.New_32Scene_324Code.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.pushScene(runtimeScene, "New Scene 0");
}}

}

return;
}
gdjs['New_32Scene_324Code']= gdjs.New_32Scene_324Code;
