# weight shift

weightShift = func {

	var amount = 0;
	var maxweightshift = 3;

	weightAft = getprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[2]");
	if(weightAft == nil) { weightAft = 0; }

	weightFwd = getprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[3]");
	if(weightFwd == nil) { weightFwd = 0; }

	if ( weightFwd > levelFwd and levelDropStbd > 0){
		amount = capacityFwd - levelFwd;
		if (amount > maxweightshift) {
			amount = maxweightshift;
		}
		if (amount > maxweightshift) {
			amount = maxweightshift;
		}
		levelDropStbd = levelDropStbd - amount/2;
		levelDropPort = levelDropPort - amount/2;
		levelFwd = levelFwd + amount;
		setprop( "/fdm/jsbsim/inertia/pointmass-weight-lbs[2]",levelDropStbd);
		setprop( "/fdm/jsbsim/inertia/pointmass-weight-lbs[2]",levelDropPort);
	}

	if ( capacityFwd > levelFwd and levelSaddle > 0){
		amount = capacityFwd - levelFwd;
		if (amount > levelSaddle) {
			amount = levelSaddle;
		}
		if (amount > maxweightshift) {
			amount = maxweightshift;
		}
		levelSaddle = levelSaddle - amount;
		levelFwd = levelFwd + amount;
		setprop( "consumables/fuel/tank[2]/level-gal_us",levelSaddle);
		setprop( "consumables/fuel/tank[0]/level-gal_us",levelFwd);
	}

#print("Upper: ",levelSaddle, " Lower: ",levelFwd);
#print( " Amount: ",amount);

	registerTimer(weightShift);

} # end funtion weightShift    

# fire it up

registerTimer(weightShift);

# ========================== end weight shift stuff ======================================