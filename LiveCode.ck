Sampler s => dac;
Sampler p => dac;
Sampler q => dac;
Drum drum => dac;

//spork~s.sound(s.every(8));
//p.file("hey");
//spork~p.sound(p.rotate(p.every(2)));
//q.file("sometimes");
//spork~q.sound(q.accelerate(q.every(4),12));

spork~drum.drumF(drum.favorite(1));


day => now;
