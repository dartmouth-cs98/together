/// @description Insert description here
// You can write your code in this editor

if (x > (15 + other.x)){ // Collision left
	h_collide = -1;	
}

if (x < (-15 + other.x)){ // Collision right
	h_collide = 1;	
}

if (y > (15 + other.y)){ // Collision up
	v_collide = -1;	
}

if (y < (-15 + other.y)){ // Collision down
	v_collide = 1;	
}