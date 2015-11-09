Sampler  s => dac;

//spork~s.sound(s.every(8));
s.file("hola");
s.changeStress([0,3]);
spork~s.sound([1,0,0,1,1,0,1,0]);
//q.file("sometimes");
//spork~q.sound(q.accelerate(q.every(4),12));

//s.stress(4,[0,2]) @=> float g[];

//for(0 => int i; i < g.cap(); i++) <<< g[i] >>>;



day => now;
