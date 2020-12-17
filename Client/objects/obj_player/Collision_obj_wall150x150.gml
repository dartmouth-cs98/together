/// @description Insert description here
// You can write your code in this editor

var width = 150;
var height = 150;

if (x > other.x + width - 20 and x < other.x + width + 15){ // Collision left
	if (y > (other.y - 45) and y < (other.y + height - 28)) h_collide = -1;
}

else if (x > other.x - 25 and x < other.x + 10){ // Collision right
	if (y > (other.y - 45) and y < (other.y + height - 28)) h_collide = 1;
}

if (y > other.y + height - 50 and y < other.y + height - 10){ // Collision up
	if (x > (other.x - 20) and x < (other.x + width + 10)) v_collide = -1;	
}

else if (y > other.y - 68 and y < other.y + 10){ // Collision down
	if (x > (other.x - 10) and x < (other.x + width + 10)) v_collide = 1;
}