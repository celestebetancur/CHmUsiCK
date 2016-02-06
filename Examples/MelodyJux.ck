Melody mel => dac;
Drum drum => dac;

4 => mel.controlChange;

spork~mel.jux([60,0,63,62,0,70,62]);
spork~drum.drumF([0,1],[1,0]);

day => now;