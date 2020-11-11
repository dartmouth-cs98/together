/// @description Insert description here
// You can write your code in this editor

// Check object's center-to-bottom distance
// Make this check only if trying to move up

if (x > (other.x + 37)){ // Collision left
	h_collide = -1;	
}

else if (x < (other.x - 37)){ // Collision right
	h_collide = 1;	
}

else if (y > (other.y + 34)){ // Collision up
	v_collide = -1;	
}

else if (y < (other.y - 34)){ // Collision down
	v_collide = 1;	
}