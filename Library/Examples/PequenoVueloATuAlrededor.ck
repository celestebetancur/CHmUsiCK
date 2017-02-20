TheCooker  s => dac;
Drum drum => dac;
Harmony h => dac;
FMSynth fm => Echo echo => NRev rev => dac;
Rec r;

[60,62,63,62,70] @=> int notes[];
(32,1) => fm.ratio;

0.5 => rev.mix;
0.6 => echo.mix;

170 => Chmusick.tempo;

spork~drum.drum(drum.favorite(5));
spork~h.sinOsc(["Cm","Cm","Ab","Ab"]);
//spork~h.sinOsc(["Bb"]);
spork~fm.fmBass([48,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0]);
spork~s.sound(notes);

day => now;