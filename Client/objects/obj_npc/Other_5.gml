/// @description Destroy this NPC when leaving rm_client

if (room == rm_client) {
	instance_destroy(self);
}