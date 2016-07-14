FMSynth fm => dac;

fm.attack(100::ms);
fm.decay(10::ms);
fm.sustain(.5);
fm.release(100::ms);

fm.mgain(200);

fm.ratio(4,1);

spork~fm.fmBass([60,64,59,72]);

day => now;