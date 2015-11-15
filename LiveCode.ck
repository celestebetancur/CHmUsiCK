Chmusick tempo; 

Gain gate => NRev rev => dac;

SinOsc sin => gate;

Sampler r => gate;
Sampler s => gate;
Sampler t => gate;
Sampler u => gate;

Drum drum => gate;

0.05 => rev.mix;

130 => tempo.tempo;
2 => tempo.cycles;

30 => sin.freq;
0.75 => sin.gain;

r.file("83253__zgump__bass-0209");
s.file("x");
u.file("y");

//spork~r.sound(s.every(7));
//spork~s.sound(s.every(3));
//spork~t.sound("v",t.rotate(r.every(3)));
//spork~u.sound(u.rand(8));

//spork~drum.drumF(drum.favorite(4));

day => now;

