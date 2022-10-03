
vsp = vsp + grv;

if (hsp != 0) image_xscale = sign(hsp);

//horizontal collision
if (place_meeting(x+hsp,y,oWall1)) 
{
	while (!place_meeting(x+sign(hsp),y,oWall1))
	{
		x = x + sign(hsp);
	}
	
	hsp = -hsp;
	
}
x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,oWall1)) || (place_meeting(x,y+vsp,oWall2)) || (place_meeting(x,y+vsp,oPlasma))
{
	while (!place_meeting(x,y+sign(vsp),oWall1)) && (!place_meeting(x,y+sign(vsp),oWall2)) && (!place_meeting(x,y+sign(vsp),oPlasma))
	{
		y = y + sign(vsp);
	}
	
	
	
	vsp = 0;
}
y = y + vsp;

