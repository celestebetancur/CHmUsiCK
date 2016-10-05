Chmusick params;
Notes mode;
Gain gate => dac;

Drum drum => gate;
FMSynth bass => gate;
Melody mel => NRev rev => gate;
TheCooker cook => gate;

bass.attack(0.125::ms);
bass.sustain(.2);
bass.ratio(1,4);
bass.mgain(10);

3 => int mod;

bass.subArray(bass.transpose(mode.modes(mod),36),[6,1,2,3]) @=> int subMode[];
mel.subArray(mel.transpose(mode.modes(mod),48),[2,3,6,0,0,3]) @=> int subMode1[];
cook.subArray(cook.transpose(mode.modes(mod),48),[0,1,2]) @=> int subMode2[];

mel.controlChange(6);
rev.mix(0.2);

drum.hhGain(0.5);

spork~drum.drum([1,0,0,0],[1,0,0,0]);
spork~bass.fmBass(subMode);
spork~mel.synth(subMode1);
spork~cook.sound(subMode2);

while(true) {samp => now;}