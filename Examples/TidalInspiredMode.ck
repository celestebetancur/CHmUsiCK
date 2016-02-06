Sampler d1 => dac;
Sampler d2 => dac;

spork~d1.sound(["bd","sn"]);
spork~d2.sound(["cp","cp","cp"]);

day => now;