//Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if ((place_meeting(x,y+1,oWall1)) || place_meeting(x,y+1,oWall2)) && (key_jump)
{
	vsp = -8;
}

if (hsp != 0) image_xscale = sign(hsp);

//horizontal collision
if (place_meeting(x+hsp,y,oWall1)) 
{
	while (!place_meeting(x+sign(hsp),y,oWall1))
	{
		x = x + sign(hsp);
	}
	if (place_meeting(x+sign(hsp),y,oPlasma))
	{
		game_restart();
	}
	hsp = 0;
	
}
x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,oWall1)) || (place_meeting(x,y+vsp,oWall2))
{
	while (!place_meeting(x,y+sign(vsp),oWall1))// && (!place_meeting(x,y+sign(vsp),oWall2))
	{
		y = y + sign(vsp);
	}
	if (place_meeting(x,y+sign(vsp),oPlasma))
	{
		game_restart();
	}
	vsp = 0;
}
y = y + vsp;

throwingdelay = throwingdelay - 1
if (mouse_check_button(mb_left)) && (throwingdelay < 0)
 {
	throwingdelay = 10;
	with (instance_create_layer(x,y,"Kunai",oKunai))
	{
		speed = 25;
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
	}
 }