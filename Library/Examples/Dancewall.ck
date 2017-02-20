Gain gate => dac;
Drum drum => gate;
FMSynth bass => gate;
FMSynth bass1 => gate;
Melody mel => Pan pan => gate;
Harmony harm => pan => gate;
FMSynth d => DelayL delay => NRev rev => gate;

.5::second => delay.max => delay.delay;
rev.mix(.2);

Chmusick.tempo(190);

mel.controlChange(1);
mel.gain(1.5);

bass1.gain(1.5);

bass.attack(2::ms);
bass.sustain(1.1);
bass.ratio(1,4);
bass.mgain(1000);

harm.gain(.3);

//spork~drum.drum([1,0,0,1,0,0,1,0],[0,0,0,0,0,0,1,0],[1,1,1,1,1,1,1,1]);
//spork~bass1.fmBass([36,0,0,36,0,0,43,0]);
//spork~bass.fmBass([60,0,0,60,63,0,63,0,62,0,62,0,67,0,65,0]);
//spork~mel.synth([0,0,0,0,0,0,0,0,63,63,63,63,62,0,0,0,0,0,0,0,0,0,0,0,62,62,62,62,60,0,0,0]);
//spork~d.fmBass([60,58,63,67]); d.ratio(8,1);
//spork~harm.sinOsc(["Cm","Cm","Ab","Bb"]);
//spork~pan.circularPan(10);

while(true) {samp => now;}