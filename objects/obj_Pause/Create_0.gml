/// @description Insert description here
// You can write your code in this editor
global.pause = false;
global.inventoryIsOpened = false;
global.abilitySelect = false;
global.PlayerAbilityCredits = 0;
global.displayTitleMenu = true;
global.DeflectLeveled = false;
global.TankLeveled = false;
global.BounceLeveled = false;
global.fade = 0.01;
buttonPressed = -1;
fadeStartTime = 0;
CursorIndex = 2;
Counter = 0;
global.localPlayer =  instance_find(obj_Player,0);
global.testRoom = false;