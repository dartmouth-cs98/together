# Global Variables
Description of global variables.

## Client

### `global.mysocket`
* The socket of the player associated with the client.

### `global.chat`
* The list of chat messages.
* Currently not in use.

### `global.chat_color`
* The list of colors in which messages should be displayed. Tracks with `global.chat`.

### `global.cam_X & global.cam_Y`
* The X & Y positions of `con_camera`.

### `global.cam_width & global.cam_height`
* The width & height of `con_camera`'s window.

### `global.paused`
* Boolean, true when the player is paused, false when they are not paused.
* Default: `false`

### `global.pause_menu`
* Boolean, true when the pause menu specifically is open, false in all other cases.

### `global.key_enter`
* Int, contains the value of whatever key is mapped to enter/confirm.
* Default: `vk_enter`

### `global.key_left`
* Int, contains the value of whatever key is mapped to left.
* Default: `vk_left`

### `global.key_right`
* Int, contains the value of whatever key is mapped to right.
* Default: `vk_right`

### `global.key_up`
* Int, contains the value of whatever key is mapped to up.
* Default: `vk_up`

### `global.key_down`
* Int, contains the value of whatever key is mapped to down.
* Default: `vk_down`

### `global.taskbar`
* Int, indicates progress of tasks
* Default: `0`

### `global.minigame_passcode`
* Bool, indicates whether or not the passcode minigame should be active.
* Default: `false`

### `global.any_menu`
* Set to true when any menu is opened, set to false when the menu is closed.
* Menu open/cose code should only execute if this condition is met: `!(global.any_menu && !global.relevant_menu)`
    * In other words, only if either `global.any_menu` is false or `global.relevant_menu` is true.
* Default: `false`

### `global.taskbar_max`
* Int, The value that the taskbar must reach for the players to win.
* Default:  `100`

### `global.master_volume`
* Float, ranges between 0 and 1. Determines how loud all audio in the game is.
* Default: `0.5`

### `global.sound_volume`
* Float, ranges between 0 and 1. Determines how loud all non-music sounds are.
* Default: `0.5`

### `global.music_volume`
* Float, ranges between 0 and 1. Determines how loud the music is.
* Default: `0.5`

---

## Server

### `global.chat`
* The list of chat messages.

### `global.chat_color`
* The list of colors in which messages should be displayed. Tracks with `global.chat`.

### `global.task`
* Int, indicates progress of tasks