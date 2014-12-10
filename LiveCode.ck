Notes chords;
Drum drum => dac;
Harmony pad => dac;

3 => pad.measure;

spork~drum.drum([1,0,0],[0,1,1],[1,1,1]);
spork~ pad.sinOsc(chords.ptos(chords.progression(3),"C"));

1::day => now;