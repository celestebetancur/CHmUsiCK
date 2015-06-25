FMSynth fm => Audio audio => dac; 
FMSynth fm1 => audio => dac; 
Melody melody => dac;
Drum drum => dac;
Bass bass => dac;

(1,2) => fm.ratio;
(4,3) => fm1.ratio;

[60,59,0,57,62,0,0,64,65,0,72] @=> int mel[];
4 => melody.controlChange;

120 => CHmUsiCK.Tempo;
1 => audio.master;

spork~fm.fmBass(fm.trunc(mel,0.8));
spork~fm1.fmBass(fm.trunc(mel,0.6));
//spork~fm1.fmBass(fm.rotate(mel,3));
//spork~melody.synth(fm.rotate(fm.rotate(mel),3));
spork~drum.drumF(drum.favorite(0));
//spork~bass.techBass("c");

1::day => now;