# Untitled Pandemic Game (Tentative title: Together)

An online co-op multiplayer game in which players must work together to maintain their daily lives in the midst of a pandemic.

## Architecture

*This is preliminary, potentially subject to change*

* Game will consist of two Gamemaker Studio 2 Projects, one for the backend server, and one for the frontend client
  * The server will have to run to accept connections from players. One should exist for each given game. We may need an uber-server at some point to create them
  * The client connects to a server and plays the game

## Setup

All that's needed to begin working is Gamemaker Studio 2 installed on your computer

## Deployment

With a liscense, we can have Gamemaker Studio 2 export the project as an executable

## Authors

Willem Klein Wassink, Eitan Vilker, Joe Zhang

## Assets
* [Mythril Age Volume 1](https://mythril-age.itch.io/mythril-age-sprites-volume-1)
* [CanariPack 8BIT TopDown](https://canarigames.itch.io/canaripack-8bit-topdown)

## Acknowledgments

* Tutorials:
  * [GMS2 Series](https://www.youtube.com/watch?v=raGK_j1NVdE&list=PLhIbBGhnxj5JcbfoxS_CWTnImRL_wB_Wg)
  * [Networking Series](https://youtu.be/NbsXRuNijlo)
  * [Movement Series](https://www.youtube.com/watch?v=0-a0Fak7cjk)
  * [Spritesheet Conversion Tutorial](https://youtu.be/0boZofzJfME)
  * [Menus & Data Organization](https://youtu.be/1ITZOrI2qkA)
  

<<<<<<< HEAD
{
  "resources": [
    {"id":{"name":"spr_u_strip4","path":"sprites/spr_u_strip4/spr_u_strip4.yy",},"order":5,},
    {"id":{"name":"scr_pause","path":"scripts/scr_pause/scr_pause.yy",},"order":1,},
    {"id":{"name":"spr_ur_strip4","path":"sprites/spr_ur_strip4/spr_ur_strip4.yy",},"order":7,},
    {"id":{"name":"snd_Jump03","path":"sounds/snd_Jump03/snd_Jump03.yy",},"order":11,},
    {"id":{"name":"snd_Jump02","path":"sounds/snd_Jump02/snd_Jump02.yy",},"order":10,},
    {"id":{"name":"spr_blue_cape_left","path":"sprites/spr_blue_cape_left/spr_blue_cape_left.yy",},"order":3,},
    {"id":{"name":"spr_l_strip4","path":"sprites/spr_l_strip4/spr_l_strip4.yy",},"order":3,},
    {"id":{"name":"snd_Death01","path":"sounds/snd_Death01/snd_Death01.yy",},"order":4,},
    {"id":{"name":"spr_taskbar","path":"sprites/spr_taskbar/spr_taskbar.yy",},"order":16,},
    {"id":{"name":"snd_MusicADVENTURE","path":"sounds/snd_MusicADVENTURE/snd_MusicADVENTURE.yy",},"order":0,},
    {"id":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"order":1,},
    {"id":{"name":"spr_ul_strip4","path":"sprites/spr_ul_strip4/spr_ul_strip4.yy",},"order":6,},
    {"id":{"name":"spr_dr_strip4","path":"sprites/spr_dr_strip4/spr_dr_strip4.yy",},"order":2,},
    {"id":{"name":"spr_object1","path":"sprites/spr_object1/spr_object1.yy",},"order":0,},
    {"id":{"name":"Font1","path":"fonts/Font1/Font1.yy",},"order":0,},
    {"id":{"name":"spr_blue_cape_down","path":"sprites/spr_blue_cape_down/spr_blue_cape_down.yy",},"order":1,},
    {"id":{"name":"snd_MusicDUNGEON","path":"sounds/snd_MusicDUNGEON/snd_MusicDUNGEON.yy",},"order":1,},
    {"id":{"name":"obj_other","path":"objects/obj_other/obj_other.yy",},"order":2,},
    {"id":{"name":"spr_apple2","path":"sprites/spr_apple2/spr_apple2.yy",},"order":3,},
    {"id":{"name":"Sprite17","path":"sprites/Sprite17/Sprite17.yy",},"order":15,},
    {"id":{"name":"spr_penguin_red","path":"sprites/spr_penguin_red/spr_penguin_red.yy",},"order":1,},
    {"id":{"name":"obj_wall","path":"objects/obj_wall/obj_wall.yy",},"order":6,},
    {"id":{"name":"obj_interactable","path":"objects/obj_interactable/obj_interactable.yy",},"order":7,},
    {"id":{"name":"spr_r_strip4","path":"sprites/spr_r_strip4/spr_r_strip4.yy",},"order":4,},
    {"id":{"name":"rm_main_menu","path":"rooms/rm_main_menu/rm_main_menu.yy",},"order":1,},
    {"id":{"name":"snd_Land01","path":"sounds/snd_Land01/snd_Land01.yy",},"order":12,},
    {"id":{"name":"snd_Fall01","path":"sounds/snd_Fall01/snd_Fall01.yy",},"order":6,},
    {"id":{"name":"snd_Death02","path":"sounds/snd_Death02/snd_Death02.yy",},"order":5,},
    {"id":{"name":"spr_blue_cape_up","path":"sprites/spr_blue_cape_up/spr_blue_cape_up.yy",},"order":4,},
    {"id":{"name":"con_client","path":"objects/con_client/con_client.yy",},"order":0,},
    {"id":{"name":"snd_Attack01","path":"sounds/snd_Attack01/snd_Attack01.yy",},"order":0,},
    {"id":{"name":"scr_recieved_packet","path":"scripts/scr_recieved_packet/scr_recieved_packet.yy",},"order":0,},
    {"id":{"name":"spr_test_tile","path":"sprites/spr_test_tile/spr_test_tile.yy",},"order":0,},
    {"id":{"name":"snd_Hurt02","path":"sounds/snd_Hurt02/snd_Hurt02.yy",},"order":8,},
    {"id":{"name":"snd_MusicMYSTERY","path":"sounds/snd_MusicMYSTERY/snd_MusicMYSTERY.yy",},"order":2,},
    {"id":{"name":"spr_d_strip4","path":"sprites/spr_d_strip4/spr_d_strip4.yy",},"order":0,},
    {"id":{"name":"scr_task_complete","path":"scripts/scr_task_complete/scr_task_complete.yy",},"order":1,},
    {"id":{"name":"spr_blue_cape","path":"sprites/spr_blue_cape/spr_blue_cape.yy",},"order":0,},
    {"id":{"name":"spr_penguin","path":"sprites/spr_penguin/spr_penguin.yy",},"order":0,},
    {"id":{"name":"snd_Valid01","path":"sounds/snd_Valid01/snd_Valid01.yy",},"order":15,},
    {"id":{"name":"spr_dl_strip4","path":"sprites/spr_dl_strip4/spr_dl_strip4.yy",},"order":1,},
    {"id":{"name":"spr_blue_cape_right","path":"sprites/spr_blue_cape_right/spr_blue_cape_right.yy",},"order":2,},
    {"id":{"name":"con_camera","path":"objects/con_camera/con_camera.yy",},"order":5,},
    {"id":{"name":"spr_taskbar_border","path":"sprites/spr_taskbar_border/spr_taskbar_border.yy",},"order":15,},
    {"id":{"name":"snd_Jump01","path":"sounds/snd_Jump01/snd_Jump01.yy",},"order":9,},
    {"id":{"name":"snd_Cursor01","path":"sounds/snd_Cursor01/snd_Cursor01.yy",},"order":3,},
    {"id":{"name":"snd_MenuBack01","path":"sounds/snd_MenuBack01/snd_MenuBack01.yy",},"order":13,},
    {"id":{"name":"scr_unpause","path":"scripts/scr_unpause/scr_unpause.yy",},"order":2,},
    {"id":{"name":"obj_apple","path":"objects/obj_apple/obj_apple.yy",},"order":8,},
    {"id":{"name":"snd_Attack03","path":"sounds/snd_Attack03/snd_Attack03.yy",},"order":2,},
    {"id":{"name":"spr_apple1","path":"sprites/spr_apple1/spr_apple1.yy",},"order":2,},
    {"id":{"name":"scr_pickup","path":"scripts/scr_pickup/scr_pickup.yy",},"order":3,},
    {"id":{"name":"con_game_manager","path":"objects/con_game_manager/con_game_manager.yy",},"order":3,},
    {"id":{"name":"snd_Pickup01","path":"sounds/snd_Pickup01/snd_Pickup01.yy",},"order":14,},
    {"id":{"name":"spr_object2","path":"sprites/spr_object2/spr_object2.yy",},"order":1,},
    {"id":{"name":"snd_Hurt01","path":"sounds/snd_Hurt01/snd_Hurt01.yy",},"order":7,},
    {"id":{"name":"snd_Attack02","path":"sounds/snd_Attack02/snd_Attack02.yy",},"order":1,},
    {"id":{"name":"con_chat","path":"objects/con_chat/con_chat.yy",},"order":4,},
    {"id":{"name":"rm_client","path":"rooms/rm_client/rm_client.yy",},"order":0,},
  ],
  "Options": [
    {"name":"Main","path":"options/main/options_main.yy",},
    {"name":"Windows","path":"options/windows/options_windows.yy",},
    {"name":"Linux","path":"options/linux/options_linux.yy",},
    {"name":"macOS","path":"options/mac/options_mac.yy",},
    {"name":"Amazon Fire","path":"options/amazonfire/options_amazonfire.yy",},
    {"name":"Android","path":"options/android/options_android.yy",},
    {"name":"HTML5","path":"options/html5/options_html5.yy",},
    {"name":"iOS","path":"options/ios/options_ios.yy",},
    {"name":"tvOS","path":"options/tvos/options_tvos.yy",},
    {"name":"Windows UWP","path":"options/windowsuap/options_windowsuap.yy",},
  ],
  "isDnDProject": false,
  "isEcma": false,
  "tutorialPath": "",
  "configs": {
    "name": "Default",
    "children": [],
  },
  "RoomOrderNodes": [
    {"roomId":{"name":"rm_main_menu","path":"rooms/rm_main_menu/rm_main_menu.yy",},},
    {"roomId":{"name":"rm_client","path":"rooms/rm_client/rm_client.yy",},},
  ],
  "Folders": [
    {"folderPath":"folders/Sprites.yy","order":1,"resourceVersion":"1.0","name":"Sprites","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Tile Sets.yy","order":2,"resourceVersion":"1.0","name":"Tile Sets","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sounds.yy","order":3,"resourceVersion":"1.0","name":"Sounds","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Paths.yy","order":4,"resourceVersion":"1.0","name":"Paths","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Scripts.yy","order":5,"resourceVersion":"1.0","name":"Scripts","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Shaders.yy","order":6,"resourceVersion":"1.0","name":"Shaders","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Fonts.yy","order":7,"resourceVersion":"1.0","name":"Fonts","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Timelines.yy","order":8,"resourceVersion":"1.0","name":"Timelines","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Objects.yy","order":9,"resourceVersion":"1.0","name":"Objects","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Rooms.yy","order":10,"resourceVersion":"1.0","name":"Rooms","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sequences.yy","order":11,"resourceVersion":"1.0","name":"Sequences","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Animation Curves.yy","order":12,"resourceVersion":"1.0","name":"Animation Curves","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Notes.yy","order":13,"resourceVersion":"1.0","name":"Notes","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Extensions.yy","order":14,"resourceVersion":"1.0","name":"Extensions","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Gray Humanoid.yy","order":11,"resourceVersion":"1.0","name":"Gray Humanoid","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sounds/SFX_PixelPackTOPDOWN.yy","order":1,"resourceVersion":"1.0","name":"SFX_PixelPackTOPDOWN","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sounds/MUSIC_PixelPackTOPDOWN.yy","order":2,"resourceVersion":"1.0","name":"MUSIC_PixelPackTOPDOWN","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Mythril Age.yy","order":14,"resourceVersion":"1.0","name":"Mythril Age","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Mythril Age/blue cape.yy","order":2,"resourceVersion":"1.0","name":"blue cape","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Test Sprites.yy","order":19,"resourceVersion":"1.0","name":"Test Sprites","tags":[],"resourceType":"GMFolder",},
  ],
  "AudioGroups": [
    {"targets":461609314234257646,"resourceVersion":"1.0","name":"audiogroup_default","resourceType":"GMAudioGroup",},
  ],
  "TextureGroups": [
    {"isScaled":true,"autocrop":true,"border":2,"mipsToGenerate":0,"groupParent":null,"targets":461609314234257646,"resourceVersion":"1.0","name":"Default","resourceType":"GMTextureGroup",},
  ],
  "IncludedFiles": [],
  "MetaData": {
    "IDEVersion": "2.3.1.536",
  },
  "resourceVersion": "1.4",
  "name": "Client",
  "tags": [],
  "resourceType": "GMProject",
=======
{
  "resources": [
    {"id":{"name":"spr_u_strip4","path":"sprites/spr_u_strip4/spr_u_strip4.yy",},"order":5,},
    {"id":{"name":"scr_pause","path":"scripts/scr_pause/scr_pause.yy",},"order":1,},
    {"id":{"name":"spr_ur_strip4","path":"sprites/spr_ur_strip4/spr_ur_strip4.yy",},"order":7,},
    {"id":{"name":"snd_Jump03","path":"sounds/snd_Jump03/snd_Jump03.yy",},"order":11,},
    {"id":{"name":"con_menu","path":"objects/con_menu/con_menu.yy",},"order":4,},
    {"id":{"name":"snd_Jump02","path":"sounds/snd_Jump02/snd_Jump02.yy",},"order":10,},
    {"id":{"name":"scr_change_difficulty","path":"scripts/scr_change_difficulty/scr_change_difficulty.yy",},"order":4,},
    {"id":{"name":"spr_blue_cape_left","path":"sprites/spr_blue_cape_left/spr_blue_cape_left.yy",},"order":3,},
    {"id":{"name":"spr_l_strip4","path":"sprites/spr_l_strip4/spr_l_strip4.yy",},"order":3,},
    {"id":{"name":"snd_Death01","path":"sounds/snd_Death01/snd_Death01.yy",},"order":4,},
    {"id":{"name":"spr_taskbar","path":"sprites/spr_taskbar/spr_taskbar.yy",},"order":16,},
    {"id":{"name":"scr_exit_game","path":"scripts/scr_exit_game/scr_exit_game.yy",},"order":2,},
    {"id":{"name":"msc_MusicADVENTURE","path":"sounds/msc_MusicADVENTURE/msc_MusicADVENTURE.yy",},"order":0,},
    {"id":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"order":1,},
    {"id":{"name":"spr_ul_strip4","path":"sprites/spr_ul_strip4/spr_ul_strip4.yy",},"order":6,},
    {"id":{"name":"spr_dr_strip4","path":"sprites/spr_dr_strip4/spr_dr_strip4.yy",},"order":2,},
    {"id":{"name":"scr_change_resolution","path":"scripts/scr_change_resolution/scr_change_resolution.yy",},"order":5,},
    {"id":{"name":"spr_object1","path":"sprites/spr_object1/spr_object1.yy",},"order":0,},
    {"id":{"name":"Font1","path":"fonts/Font1/Font1.yy",},"order":0,},
    {"id":{"name":"spr_blue_cape_down","path":"sprites/spr_blue_cape_down/spr_blue_cape_down.yy",},"order":1,},
    {"id":{"name":"msc_MusicDUNGEON","path":"sounds/msc_MusicDUNGEON/msc_MusicDUNGEON.yy",},"order":1,},
    {"id":{"name":"obj_other","path":"objects/obj_other/obj_other.yy",},"order":2,},
    {"id":{"name":"spr_apple2","path":"sprites/spr_apple2/spr_apple2.yy",},"order":3,},
    {"id":{"name":"Sprite17","path":"sprites/Sprite17/Sprite17.yy",},"order":15,},
    {"id":{"name":"spr_penguin_red","path":"sprites/spr_penguin_red/spr_penguin_red.yy",},"order":1,},
    {"id":{"name":"obj_wall","path":"objects/obj_wall/obj_wall.yy",},"order":6,},
    {"id":{"name":"obj_interactable","path":"objects/obj_interactable/obj_interactable.yy",},"order":7,},
    {"id":{"name":"spr_r_strip4","path":"sprites/spr_r_strip4/spr_r_strip4.yy",},"order":4,},
    {"id":{"name":"rm_main_menu","path":"rooms/rm_main_menu/rm_main_menu.yy",},"order":1,},
    {"id":{"name":"snd_Land01","path":"sounds/snd_Land01/snd_Land01.yy",},"order":12,},
    {"id":{"name":"snd_Fall01","path":"sounds/snd_Fall01/snd_Fall01.yy",},"order":6,},
    {"id":{"name":"snd_Death02","path":"sounds/snd_Death02/snd_Death02.yy",},"order":5,},
    {"id":{"name":"spr_blue_cape_up","path":"sprites/spr_blue_cape_up/spr_blue_cape_up.yy",},"order":4,},
    {"id":{"name":"con_client","path":"objects/con_client/con_client.yy",},"order":2,},
    {"id":{"name":"snd_Attack01","path":"sounds/snd_Attack01/snd_Attack01.yy",},"order":0,},
    {"id":{"name":"scr_recieved_packet","path":"scripts/scr_recieved_packet/scr_recieved_packet.yy",},"order":0,},
    {"id":{"name":"spr_test_tile","path":"sprites/spr_test_tile/spr_test_tile.yy",},"order":0,},
    {"id":{"name":"scr_change_volume","path":"scripts/scr_change_volume/scr_change_volume.yy",},"order":3,},
    {"id":{"name":"snd_Hurt02","path":"sounds/snd_Hurt02/snd_Hurt02.yy",},"order":8,},
    {"id":{"name":"msc_MusicMYSTERY","path":"sounds/msc_MusicMYSTERY/msc_MusicMYSTERY.yy",},"order":2,},
    {"id":{"name":"spr_d_strip4","path":"sprites/spr_d_strip4/spr_d_strip4.yy",},"order":0,},
    {"id":{"name":"scr_change_window_mode","path":"scripts/scr_change_window_mode/scr_change_window_mode.yy",},"order":6,},
    {"id":{"name":"scr_task_complete","path":"scripts/scr_task_complete/scr_task_complete.yy",},"order":1,},
    {"id":{"name":"scr_resume_game","path":"scripts/scr_resume_game/scr_resume_game.yy",},"order":1,},
    {"id":{"name":"spr_blue_cape","path":"sprites/spr_blue_cape/spr_blue_cape.yy",},"order":0,},
    {"id":{"name":"spr_penguin","path":"sprites/spr_penguin/spr_penguin.yy",},"order":0,},
    {"id":{"name":"snd_Valid01","path":"sounds/snd_Valid01/snd_Valid01.yy",},"order":15,},
    {"id":{"name":"scr_create_menu_page","path":"scripts/scr_create_menu_page/scr_create_menu_page.yy",},"order":0,},
    {"id":{"name":"spr_dl_strip4","path":"sprites/spr_dl_strip4/spr_dl_strip4.yy",},"order":1,},
    {"id":{"name":"spr_blue_cape_right","path":"sprites/spr_blue_cape_right/spr_blue_cape_right.yy",},"order":2,},
    {"id":{"name":"con_camera","path":"objects/con_camera/con_camera.yy",},"order":0,},
    {"id":{"name":"spr_taskbar_border","path":"sprites/spr_taskbar_border/spr_taskbar_border.yy",},"order":15,},
    {"id":{"name":"snd_Jump01","path":"sounds/snd_Jump01/snd_Jump01.yy",},"order":9,},
    {"id":{"name":"snd_Cursor01","path":"sounds/snd_Cursor01/snd_Cursor01.yy",},"order":3,},
    {"id":{"name":"snd_MenuBack01","path":"sounds/snd_MenuBack01/snd_MenuBack01.yy",},"order":13,},
    {"id":{"name":"scr_unpause","path":"scripts/scr_unpause/scr_unpause.yy",},"order":2,},
    {"id":{"name":"obj_apple","path":"objects/obj_apple/obj_apple.yy",},"order":8,},
    {"id":{"name":"snd_Attack03","path":"sounds/snd_Attack03/snd_Attack03.yy",},"order":2,},
    {"id":{"name":"spr_apple1","path":"sprites/spr_apple1/spr_apple1.yy",},"order":2,},
    {"id":{"name":"scr_pickup","path":"scripts/scr_pickup/scr_pickup.yy",},"order":3,},
    {"id":{"name":"con_game_manager","path":"objects/con_game_manager/con_game_manager.yy",},"order":3,},
    {"id":{"name":"snd_Pickup01","path":"sounds/snd_Pickup01/snd_Pickup01.yy",},"order":14,},
    {"id":{"name":"spr_object2","path":"sprites/spr_object2/spr_object2.yy",},"order":1,},
    {"id":{"name":"snd_Hurt01","path":"sounds/snd_Hurt01/snd_Hurt01.yy",},"order":7,},
    {"id":{"name":"snd_Attack02","path":"sounds/snd_Attack02/snd_Attack02.yy",},"order":1,},
    {"id":{"name":"con_chat","path":"objects/con_chat/con_chat.yy",},"order":1,},
    {"id":{"name":"rm_client","path":"rooms/rm_client/rm_client.yy",},"order":0,},
  ],
  "Options": [
    {"name":"Main","path":"options/main/options_main.yy",},
    {"name":"Windows","path":"options/windows/options_windows.yy",},
    {"name":"Linux","path":"options/linux/options_linux.yy",},
    {"name":"macOS","path":"options/mac/options_mac.yy",},
    {"name":"Amazon Fire","path":"options/amazonfire/options_amazonfire.yy",},
    {"name":"Android","path":"options/android/options_android.yy",},
    {"name":"HTML5","path":"options/html5/options_html5.yy",},
    {"name":"iOS","path":"options/ios/options_ios.yy",},
    {"name":"tvOS","path":"options/tvos/options_tvos.yy",},
    {"name":"Windows UWP","path":"options/windowsuap/options_windowsuap.yy",},
  ],
  "isDnDProject": false,
  "isEcma": false,
  "tutorialPath": "",
  "configs": {
    "name": "Default",
    "children": [],
  },
  "RoomOrder": [
    {"name":"rm_main_menu","path":"rooms/rm_main_menu/rm_main_menu.yy",},
    {"name":"rm_client","path":"rooms/rm_client/rm_client.yy",},
  ],
  "Folders": [
    {"folderPath":"folders/Sprites.yy","order":1,"resourceVersion":"1.0","name":"Sprites","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Tile Sets.yy","order":2,"resourceVersion":"1.0","name":"Tile Sets","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sounds.yy","order":3,"resourceVersion":"1.0","name":"Sounds","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Paths.yy","order":4,"resourceVersion":"1.0","name":"Paths","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Scripts.yy","order":5,"resourceVersion":"1.0","name":"Scripts","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Shaders.yy","order":6,"resourceVersion":"1.0","name":"Shaders","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Fonts.yy","order":7,"resourceVersion":"1.0","name":"Fonts","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Timelines.yy","order":8,"resourceVersion":"1.0","name":"Timelines","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Objects.yy","order":9,"resourceVersion":"1.0","name":"Objects","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Rooms.yy","order":10,"resourceVersion":"1.0","name":"Rooms","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sequences.yy","order":11,"resourceVersion":"1.0","name":"Sequences","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Animation Curves.yy","order":12,"resourceVersion":"1.0","name":"Animation Curves","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Notes.yy","order":13,"resourceVersion":"1.0","name":"Notes","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Extensions.yy","order":14,"resourceVersion":"1.0","name":"Extensions","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Gray Humanoid.yy","order":11,"resourceVersion":"1.0","name":"Gray Humanoid","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sounds/SFX_PixelPackTOPDOWN.yy","order":1,"resourceVersion":"1.0","name":"SFX_PixelPackTOPDOWN","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sounds/MUSIC_PixelPackTOPDOWN.yy","order":2,"resourceVersion":"1.0","name":"MUSIC_PixelPackTOPDOWN","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Mythril Age.yy","order":14,"resourceVersion":"1.0","name":"Mythril Age","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Mythril Age/blue cape.yy","order":2,"resourceVersion":"1.0","name":"blue cape","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Sprites/Test Sprites.yy","order":19,"resourceVersion":"1.0","name":"Test Sprites","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Scripts/menus.yy","order":4,"resourceVersion":"1.0","name":"menus","tags":[],"resourceType":"GMFolder",},
    {"folderPath":"folders/Objects/Controllers.yy","order":7,"resourceVersion":"1.0","name":"Controllers","tags":[],"resourceType":"GMFolder",},
  ],
  "AudioGroups": [
    {"targets":461609314234257646,"resourceVersion":"1.0","name":"audiogroup_default","resourceType":"GMAudioGroup",},
    {"targets":461609314234257646,"resourceVersion":"1.0","name":"audiogroup_music","resourceType":"GMAudioGroup",},
    {"targets":461609314234257646,"resourceVersion":"1.0","name":"audiogroup_soundeffects","resourceType":"GMAudioGroup",},
    {"targets":461609314234257646,"resourceVersion":"1.0","name":"audiogroup_master","resourceType":"GMAudioGroup",},
  ],
  "TextureGroups": [
    {"isScaled":true,"autocrop":true,"border":2,"mipsToGenerate":0,"targets":461609314234257646,"resourceVersion":"1.0","name":"Default","resourceType":"GMTextureGroup",},
  ],
  "IncludedFiles": [],
  "MetaData": {
    "IDEVersion": "2.3.0.529",
  },
  "resourceVersion": "1.3",
  "name": "Client",
  "tags": [],
  "resourceType": "GMProject",
>>>>>>> e0b63583d85c055ce7fd95cc465f64f2eb5ea158
}