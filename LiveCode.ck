Chmusick tempo; 

Gain gate => NRev rev => dac;

Sampler r => gate;
Sampler s => gate;
Sampler t => gate;
Sampler u => gate;

Drum drum => gate;

0.05 => rev.mix;

130 => tempo.tempo;
2 => tempo.cycles;

r.file("rave");
s.file("f");
u.file("moog",3);

spork~r.sound(s.every(5));
spork~s.sound(s.every(3));
spork~t.sound("birds3",t.rotate(r.every(3)));
spork~u.sound(u.every(7));

spork~drum.drumF(drum.favorite(0));

day => now;

