# Message Types
Description of the different message types.

These types and their respective IDs are defined in the enum `network`. This enum must match between projects.

### `player_establish`
* ID: 0
* Protocol
    * Server sends to client after initial connection. Format: `<ID, socket>`
    * Client recieves this message, sends back message. Format: `<ID, username, sprite_sheet>`
    * Continued in `player_connect` protocol.

### `player_connect`
* ID: 1
* Protocol
    * On recieving `player_establish` from the client, server sends this message back. Format: `<ID, socket, x_pos, y_pos, username>`
        * `Player Joined` is sent shortly after.
    * Client recieves message, parses the information. No response.

### `player_joined`
* ID: 2
* Protocol
    * On recieving `player_establish` from client, server sends info about other players back to client. Format: `<ID, socket, x_pos, y_pos, username, sprite_sheet>`
    * Also sends info about the client to other players. Format: `<ID, socket, x_pos, y_pos, username, sprite_sheet>`
    * Clients only recieve info about other players through this message. When they get it, they create an `obj_other`. No response.

### `player_disconnect`
* ID: 3
* Protocol
    * When the server detects a disconnecting client, it gets rid of their info and sends this message to all non-disconnecting players. Format: `<ID, socket>`
    * When the client recieves this message, it gets rid of the player whose socket was sent. No response.

### `player_denied`
* ID: 4
* Protocol
   * When the client receives this message, it moves the player to rm_main_menu. Format: `<ID>`

### `move`
* ID: 5
* Protocol
    * When the user inputs the move command, the client sends this message. Format: `<ID, horizontal_input, vertical_input, walk_speed>`
    * The server recieves this and echoes it to all players. Format: `<ID, player_socket, horizontal_input, vertical_input, walk_speed>`
    * Each player recieves this and updates player positions and sprites based on it. No response.

### `chat`
* ID: 6
* Protocol
    * When the user sends a chat message, the client sends this message. Format: `<ID, chat_text, color_1, color_2, color_3>`
    * The server recieves this and echoes it out to all players. Format: `<ID, chat_text, color_1, color_2, color_3>`
    * The client recieves this and updates their chat log. No response.

### `task`
* ID: 7
* Protocol
    * When the user completes a task. Format: `<ID, value>`
    * The server recieves this and sends updated taskbar to all players. Format: `<ID, taskbar>`
    * The client recieves this and updates the taskbar progress. No response.

### `pause`
* ID: 8
* Protocol
    * When the user pauses, the client sends this message and then executes a pause client-side. Format: `<ID>`
    * The server recieves this, stops the player's animation, and echoes the message out to the other players. Format: `<ID, player_socket>`
    * Each other player recieves this and also stops that player's animation. No response.

### `unpause`
* ID: 9
* Protocol
    * When the user unpauses, the client sends this message and then executes an upause client-side. Format: `<ID>`
    * The server recieves this, restarts the player's animation, and echoes the message out to the other players. Format: `<ID, player_socket>`
    * Each other player recieves this and also restarts that player's animation. No response.
* *Note: This message may no longer be necessary. Recieving it client-side doesn't do anything.*

### `npc_create`
* ID: 10
* Protocol
    * When a player joins the server, the `scr_network_player_join` script sends them info about each `obj_npc` from the `npc_list`. Format: `<ID, npc_ID, npc.x, npc.y, sprite_sheet>`
        * *Note: As of 1/3/21, the sprite sheet is currently hard-coded due to differences between sprite sheet IDs on the client & server. Some sort of ds_map will need to be created later.*
    * The client recieves this message and uses it to create an `obj_npc`. No response.

### `npc_move`
* ID: 11
* Protocol
    * The `obj_npc` step event on the server determines how the npc will move and broadcasts that information to all players. Format: `<ID, npc_ID, move_x, move_y, x_frame, y_frame>`
        * *Note: x_frame & y_frame determine what part of the sprite sheet to draw*
    * The client receives this and directly updates this information in its `obj_npc` instances. No response.
    
###  `revive`
* ID: 12
* Protocol
   * When a player revives another player with food or water, it sends a message to the server. TBD
   * The client in question receives the amount of food and water given. TBD

### `update_infection_level`
* ID: 13
* Protocol
   * When a player's infection level changes, it tells the server to update that level. Format: `<ID, infection_level>`
   * Each client receives the infection level of said player and updates accordingly. Format: `<ID, player_socket, infection_level>`

### `duotask`
* ID: 14
* Protocol
   * When a player initiates a duotask, it tells the server which object is being used and whether to add/delete/complete a task. Format: `<ID, object_id, add>`
   * Each client receives the object whose task was completed and updates the taskbar and completion status accordingly. Format: `<ID, object_ID>`

### `event`
* ID: 15
* Protocol
   * Server tells clients when an event has been initiated and which event it is. Format: `<ID, event>`
