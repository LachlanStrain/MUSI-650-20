(
// harmonic swimming
play({
	var f, p, z, offset;
	f = 50;		// fundamental frequency
	p = 20;		// number of partials per channel
	z = 0.0;		// start of oscil daisy chain
	offset = Line.kr(0, -0.02, 60); // causes sound to separate and fade
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 		// freq of partial
				0,
				max(0, 			// clip negative amplitudes to zero
					LFNoise1.kr(
						6 + [4.0.rand2, 4.0.rand2],	// amplitude rate
						0.02, 					// amplitude scale
						offset					// amplitude offset
					)
				),
				z
		)
	});
	z
}))

(
// harmonic swimming
play({
	var f, p, z, offset;
	f = 63;		// fundamental frequency
	p = 20;		// number of partials per channel
	z = 0.0;		// start of oscil daisy chain
	offset = Line.kr(0, -0.02, 60); // causes sound to separate and fade
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 		// freq of partial
				0,
				max(0, 			// clip negative amplitudes to zero
					LFNoise1.kr(
						6 + [4.0.rand2, 4.0.rand2],	// amplitude rate
						0.02, 					// amplitude scale
						offset					// amplitude offset
					)
				),
				z
		)
	});
	z
}))

(
// harmonic swimming
play({
	var f, p, z, offset;
	f = 75;		// fundamental frequency
	p = 20;		// number of partials per channel
	z = 0.0;		// start of oscil daisy chain
	offset = Line.kr(0, -0.02, 60); // causes sound to separate and fade
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 		// freq of partial
				0,
				max(0, 			// clip negative amplitudes to zero
					LFNoise1.kr(
						6 + [4.0.rand2, 4.0.rand2],	// amplitude rate
						0.02, 					// amplitude scale
						offset					// amplitude offset
					)
				),
				z
		)
	});
	z
}))

(
// harmonic swimming
play({
	var f, p, z, offset;
	f = 93;		// fundamental frequency
	p = 20;		// number of partials per channel
	z = 0.0;		// start of oscil daisy chain
	offset = Line.kr(0, -0.02, 60); // causes sound to separate and fade
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 		// freq of partial
				0,
				max(0, 			// clip negative amplitudes to zero
					LFNoise1.kr(
						6 + [4.0.rand2, 4.0.rand2],	// amplitude rate
						0.02, 					// amplitude scale
						offset					// amplitude offset
					)
				),
				z
		)
	});
	z
}))

(
// synthetic piano
var n;
n = 6;	// number of keys playing
play({
	Mix.ar(Array.fill(n, {	// mix an array of notes
		var delayTime, pitch, detune, strike, hammerEnv, hammer;

		// calculate delay based on a random note
		pitch = (25 + 50.rand);
		strike = Impulse.ar(0.1+0.4.rand, 2pi.rand, 0.1); // random period for each key
		hammerEnv = Decay2.ar(strike, 0.008, 0.04); // excitation envelope
		Pan2.ar(
			// array of 3 strings per note
			Mix.ar(Array.fill(3, { arg i;
				// detune strings, calculate delay time :
				detune = #[-0.05, 0, 0.04].at(i);
				delayTime = 1 / (pitch + detune).midicps;
				// each string gets own exciter :
				hammer = LFNoise2.ar(3000, hammerEnv); // 3000 Hz was chosen by ear..
				CombL.ar(hammer,		// used as a string resonator
					delayTime, 		// max delay time
					delayTime,			// actual delay time
					6) 				// decay time of string
			})),
			(pitch - 36)/27 - 1 // pan position: lo notes left, hi notes right
		)
	}))
})
)