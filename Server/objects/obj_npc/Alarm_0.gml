/// @description Test alarm, have the NPC walk in a square
// Alarms can be used to set periodic behavior for NPCs.

move_dir += 90;
if (move_dir > 315) { move_dir = 0; }

alarm_set(0, 2 * room_speed);