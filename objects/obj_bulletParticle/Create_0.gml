/// @description Insert description here
// You can write your code in this editor
liveTime = 0.1;
alarm[0] = room_speed * liveTime;

// Randomization
rot = irandom_range(0, 360);
xOffset = irandom_range(-10, 10);
yOffset = irandom_range(-10, 10);

x += xOffset;
y += yOffset
image_angle = rot;