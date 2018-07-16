/// @description Insert description here
// You can write your code in this editor
global.pause = false;
global.inventoryIsOpened = false;
global.abilitySelect = false;
global.PlayerAbilityCredits0 = 0;
global.PlayerAbilityCredits1 = 0;
global.displayTitleMenu = true;

global.DeflectLeveled0 = false;
global.TankLeveled0 = false;
global.BounceLeveled0 = false;

global.DeflectLeveled1 = false;
global.TankLeveled1 = false;
global.BounceLeveled1 = false;
global.fade = 0.01;
global.firstCharSelected = false;
global.secondCharSelected = false;
global.char_index0 = 0;
global.char_index1 = 0;
buttonPressed = -1;
fadeStartTime = 0;
CursorIndex = 2;
Counter = 0;
global.localPlayer =  instance_find(obj_Player,0);
global.localPlayer1 =  instance_find(obj_Player,1);
global.testRoom = false;
//Player = 2;