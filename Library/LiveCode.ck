Chmusick live => dac;

134 => STATIC.TEMPO;

Notes n;
FMSynth fm;
TriOsc bass;
HevyMetl stk;
TheCooker cooker => dac;
Synthfrog frog => dac;
Crowley dave => dac;
Buffer.d6 => NRev rev => dac;

0.3 => rev.mix;
0.4 => stk.gain;

live.file("kick",1) => Buffer.d1.read;
live.file("kick",3) => Buffer.d2.read;
live.file("hh",1) => Buffer.d3.read;
live.file("drum",1) => Buffer.d4.read;
live.file("cp",1) => Buffer.d5.read;
live.file("bev",2) => Buffer.d6.read;

[1,0] @=> int K[];

spork~live.play(Buffer.d1,K,0);spork~live.play(Buffer.d2,K,0);
spork~live.play(Buffer.d3,[0,1],1);
spork~live.play(Buffer.d4,[0,0,0,0,0,0,1,0],0);
spork~live.play(Buffer.d5,[0,0,1,0],0);

spork~live.play(bass,live.rotate([0,36,0,36],2),1);
spork~live.grain(Buffer.d6,(30/STATIC.TEMPO)*1000,0,1.0,2000,0.01);

//spork~cooker.synth(8,live.transpose(live.concat([n.chord("cm7"),n.chord("cm")]),48));
//spork~dave.synth(8,[60,0,0]);
//spork~live.play(fm,[0,0,67,0,0],0);
//spork~frog.synth(8,live.arpegiate(n.chord("cm7"),4));
//spork~live.play(stk,live.transpose([36,38,39,0,36,0,36,38,39,0,36],36),0);

week => now;