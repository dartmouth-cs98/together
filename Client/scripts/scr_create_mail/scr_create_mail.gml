/// @description Script for creating a new mail delivery task
function scr_create_mail(mailbox_x, mailbox_y, letter_x, letter_y){
	instance_create_layer(mailbox_x, mailbox_y, "Instances", obj_mailbox);
	instance_create_layer(letter_x, letter_y, "Instances", obj_letter);
}