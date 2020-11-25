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
* Menus only open if this variable is false.
* Default: `false`

---

## Server

### `global.chat`
* The list of chat messages.

### `global.chat_color`
* The list of colors in which messages should be displayed. Tracks with `global.chat`.

### `global.task`
* Int, indicates progress of tasks