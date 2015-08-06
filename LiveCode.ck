Gain gate => dac;

FMSynth fm => Audio audio => gate; 
FMSynth fm1 => audio => gate; 
Melody melody => gate;
Drum drum => gate;
Bass bass => gate;
Harmony har => audio => gate;

(1,1) => fm.ratio;
(6,3) => fm1.ratio;

fm.random("eb",16) @=> int mel[];
2 => melody.controlChange;

//120 => CHmUsiCK.Tempo;
1 => audio.master;



//spork~fm.fmBass(fm.every(60,16));
//spork~fm1.fmBass(fm.trunc(mel,0.8)); fm1.gain(0.3);
//spork~fm.fmBass(fm.rotate(mel,3));
spork~melody.metronome(140,8,2);
//spork~drum.drumF(drum.densify(drum.every(16)));
//spork~bass.techBass(2);
//spork~har.sawOsc(["cm"],4); har.gain(0.1);

day => now;