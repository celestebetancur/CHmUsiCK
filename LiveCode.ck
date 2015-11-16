Chmusick tempo; 

Gain gate => NRev rev => dac;

Sampler r => gate;
Sampler s => gate;
Sampler t => gate;
Sampler u => gate;

Drum drum => gate;

0.05 => rev.mix;

130 => tempo.tempo;
1 => tempo.cycles;

//r.file("83253__zgump__bass-0209");
//s.file("x");
u.file("moog",3);

//spork~r.sound(s.every(7));
//spork~s.sound(s.every(3));
//spork~t.sound("bd",t.rotate(r.every(3)));
spork~u.sound(u.every(3));

//spork~drum.drumF(drum.favorite(4));

day => now;

