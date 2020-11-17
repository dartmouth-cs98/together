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

### `player_pause_data`
* List, contains the data for drawing the player's sprite while they're deactivated.
* Data includes: `sprite_index`, `image_index`, `x`, `y`, `image_xscale`, `image_yscale`, `image_angle`, `image_blend`, and `image_alpha`

---

## Server

### `global.chat`
* The list of chat messages.

### `global.chat_color`
* The list of colors in which messages should be displayed. Tracks with `global.chat`.