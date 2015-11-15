Chmusick tempo; 

Gain gate => Delay delay => dac;

TheCooker synth => gate;
Drum drum => JCRev rev => gate;

180 => tempo.tempo;
4 => tempo.cycles;

0.05 => rev.mix;

60::ms => delay.delay;

drum.fillEach(1);

spork~drum.drumF(drum.favorite(5));
spork~synth.sound([60,62,64,0,70,65,72]);

day => now;

