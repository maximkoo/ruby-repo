module ImageFiles
	$explosion_animation_big=Gosu::Image.load_tiles('./PNG/Explosions/explosionframes1.png', 1024/8,384/3);    
	$explosion_animation_small=Gosu::Image.load_tiles('./PNG/Explosions/exp2_0_50.png', 128/4,128/4);    
	#EEE=Gosu::Image.load_tiles('./PNG/Explosions/explosionframes1.png', 1024/8,384/3); 

	$enemy_red1=Gosu::Image.new('./PNG/Enemies/enemyRed1.png');
	$enemy_red2=Gosu::Image.new('./PNG/Enemies/enemyRed2.png');
	$enemy_red3=Gosu::Image.new('./PNG/Enemies/enemyRed3.png');
	$enemy_red4=Gosu::Image.new('./PNG/Enemies/enemyRed4.png');
	$enemy_red5=Gosu::Image.new('./PNG/Enemies/enemyRed5.png');

	$enemy_green1=Gosu::Image.new('./PNG/Enemies/enemyGreen1.png');
	$enemy_green2=Gosu::Image.new('./PNG/Enemies/enemyGreen2.png');
	$enemy_green3=Gosu::Image.new('./PNG/Enemies/enemyGreen3.png');
	$enemy_green4=Gosu::Image.new('./PNG/Enemies/enemyGreen4.png');
	$enemy_green5=Gosu::Image.new('./PNG/Enemies/enemyGreen5.png');


	$laser_blue01=Gosu::Image.new('./PNG/Lasers/laserBlue01.png');

	$meteor_brown_big1=Gosu::Image.new('./PNG/Meteors/MeteorBrown_big1.png');
end;