Gain gate => dac;

FMSynth fm => Audio audio => gate; 
FMSynth fm1 => audio => gate; 
FMSynth fm2 => audio => gate;
Melody melody => gate;
Drum drum => gate;
Bass bass => gate;
Harmony har => audio => gate;

(1,1) => fm.ratio;
(6,3) => fm1.ratio;

[60,62,63,65] @=> int mel[];

2 => melody.controlChange;

130 => CHmUsiCK.Tempo;
1 => audio.master;

spork~fm.fmBass(fm.every(60,16));
spork~fm2.fmBass(fm.trunc(mel,0.8)); fm2.gain(0.5);
spork~fm1.fmBass(fm.rotate(fm.every(63,4))); fm1.gain(0.3);
//spork~melody.metronome(140,8,2);
spork~drum.randomMaybe();
spork~bass.techBass(2);
spork~har.sawOsc(["cm","Ab"],4); har.gain(0.1);

day => now;