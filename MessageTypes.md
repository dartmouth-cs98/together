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

### `move`
* ID: 4
* Protocol
    * When the user inputs the move command, the client sends this message. Format: `<ID, horizontal_input, vertical_input, walk_speed>`
    * The server recieves this and echoes it to all players. Format: `<ID, player_socket, horizontal_input, vertical_input, walk_speed>`
    * Each player recieves this and updates player positions and sprites based on it. No response.

### `chat`
* ID: 5
* Protocol
    * When the user sends a chat message, the client sends this message. Format: `<ID, chat_text, color_id>`
    * The server recieves this and echoes it out to all players. Format: `<ID, chat_text, color_id>`
    * The client recieves this and updates their chat log. No response.

### `pause`
* ID: 6
* Protocol
    * When the user pauses, the client sends this message and then executes a pause client-side. Format: `<ID>`
    * The server recieves this, stops the player's animation, and echoes the message out to the other players. Format: `<ID, player_socket>`
    * Each other player recieves this and also stops that player's animation. No response

### `unpause`
* ID: 7
* Protocol
    * When the user unpauses, the client sends this message and then executes an upause client-side. Format: `<ID>`
    * The server recieves this, restarts the player's animation, and echoes the message out to the other players. Format: `<ID, player_socket>`
    * Each other player recieves this and also restarts that player's animation. No response