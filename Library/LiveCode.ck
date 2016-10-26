Chmusick tempo; 

Gain gate => NRev rev => dac; 
Sampler r => gate;
Sampler a => dac; Sampler l => dac; Sampler e => dac; Sampler x => dac;
Melody s => gate => Delay d;
Melody t => gate => d;
Drum drum => gate;
Harmony pad => gate;

125 => tempo.tempo;
4 => tempo.cycles;

0.13 => rev.mix;

10 => s.controlChange;
9 => t.controlChange;

[53,0,55,0,58,0,56,55,0,53,0,55,0,53,0,0] @=> int n[];

/*spork~a.sound(a.every(16)); a.file("alphabet","a"); a.gain(2); 16 => a.Division;
spork~l.sound(l.rotate(l.every(16),2)); l.file("alphabet","l"); l.gain(2); 16 => l.Division;
spork~e.sound(e.rotate(e.every(16),3)); e.file("alphabet","e"); e.gain(1); 
spork~x.sound(x.rotate(x.every(16),4)); x.file("alphabet","x"); x.gain(1); 

spork~a.sound([0,0,1,0,1,0,0,0,1,0,0,1,0,0,1,0]); a.file("alphabet","a"); a.gain(2); 16 => a.Division;
spork~l.sound([0,0,1,0,1,1,0,1,1,0,1,1,0,1,1,1]); l.file("alphabet","l"); l.gain(2); 16 => l.Division;
spork~e.sound([1]); e.file("alphabet","e"); e.gain(1); 
spork~x.sound([1,0,1,1]); x.file("alphabet","x"); x.gain(1); 
spork~r.sound(s.every(13)); r.file("alex");
spork~s.synth(s.granularize(n,4));
spork~t.synth(t.granularize(n,4));
spork~drum.drumF(drum.favorite(2)); drum.gain(2);
spork~drum.drum([0,0,0,0],[0,0,0,0],[1,0,1,1]);*/
spork~pad.sawOsc(["Fm","","","Eb"]); pad.gain(0.7);

day => now;
