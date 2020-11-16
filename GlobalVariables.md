# Global Variables
Description of global variables.

## Client

### `global.mysocket`
* The socket of the player associated with the client.

### `global.chat`
* The list of chat messages.

### `global.chat_color`
* The list of colors in which messages should be displayed. Tracks with `global.chat`.

### `global.cam_X & global.cam_Y`
* The X & Y positions of `con_camera`.

### `global.cam_width & global.cam_height`
* The width & height of `con_camera`'s window.

### `global.paused`
* Boolean, true when the player is paused, false when they are not paused.

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

---

## Server

### `global.chat`
* The list of chat messages.

### `global.chat_color`
* The list of colors in which messages should be displayed. Tracks with `global.chat`.