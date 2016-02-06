FMSynth fm => dac;
Drum drum => dac;

spork~fm.jux([60,0,63,62,0,70,62]); // sends the melody reversed in stereo
spork~drum.drumF([0,1],[1,0]);

day => now;