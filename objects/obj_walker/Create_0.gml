/// @desc Invisible fellow used for Wait action

// Inherit the parent event
event_inherited();
sprite[RIGHT] = spr_Player_Right;
sprite[UP] = spr_Player_Up;
sprite[LEFT] = spr_Player_Left;
sprite[DOWN] = spr_Player_Down;

// New x Walker is going to, as used in the Wait() function
goingToX = 0;
