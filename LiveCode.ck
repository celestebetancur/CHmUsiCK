FMSynth fm => Audio audio => dac; 
FMSynth fm1 => audio => dac; 
Melody melody => dac;
Drum drum => dac;
Bass bass => dac;
Harmony har => audio => dac;

(1,1) => fm.ratio;
(6,3) => fm1.ratio;

fm.random("c",16) @=> int mel[];
2 => melody.controlChange;

140 => CHmUsiCK.Tempo;
1 => audio.master;



spork~fm.fmBass(fm.granularize(mel,16));
//spork~fm1.fmBass(fm.trunc(mel,0.8)); fm1.gain(0.5);
//spork~fm.fmBass(fm.rotate(mel,3));
//spork~melody.synth(melody.granularize(mel,16));
spork~drum.randomDrum(4);
//spork~bass.techBass(2);
spork~har.sinOsc(["c","f"],4); har.gain(0.4);

1::day => now;