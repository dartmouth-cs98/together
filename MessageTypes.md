# Message Types
Description of the different message types.

These types and their respective IDs are defined in the enum `network`. This enum must match between projects.

### `player_establish`
* ID: 0
* Protocol
    * Server sends to client after initial connection. Format: `<ID, socket>`
    * Client recieves this message, sends back message. Format: `<ID, username>`
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
    * On recieving `player_establish` from client, server sends info about other players back to client. Format: `<ID, socket, x_pos, y_pos, username>`
    * Also sends info about the client to other players. Format: `<ID, socket, x_pos, y_pos, username>`
    * Clients only recieve info about other players through this message. When they get it, they create an `obj_other`. No response.

### `player_disconnect`
* ID: 3
* Protocol
    * When the server detects a disconnecting client, it gets rid of their info and sends this message to all non-disconnecting players. Format: `<ID, socket>`
    * When the client recieves this message, it gets rid of the player whose socket was sent. No response.

### `move`
* ID: 4
* Protocol
    * When the user inputs the move command, the client sends this message. Format: `<ID, mouse_x, mouse_y, move_dir>`
    * The server recieves this and echoes it to all players. Format: `<ID, x_pos, y_pos, move_dir>`
    * Each player recieves this and updates player positions and sprites based on it. No response.

### `chat`
* ID: 5
* Protocol
    * When the user sends a chat message, the client sends this message. Format: `<ID, chat_text, color_id>`
    * The server recieves this and echoes it out to all players. Format: `<ID, chat_text, color_id>`
    * The client recieves this and updates their chat log. No response.