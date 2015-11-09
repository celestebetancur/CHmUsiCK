Sampler  s => dac;

//spork~s.sound(s.every(8));
s.file("hola");
spork~s.sound(s.rotate(s.every(2)));
//q.file("sometimes");
//spork~q.sound(q.accelerate(q.every(4),12));

//s.stress(4,[0,2]) @=> float g[];

//for(0 => int i; i < g.cap(); i++) <<< g[i] >>>;



day => now;
