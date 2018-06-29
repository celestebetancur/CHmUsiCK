Chmusick live => dac;

120 => STATIC.TEMPO;

Notes n;
FMSynth fm;
TriOsc bass;
HevyMetl stk;
//TheCooker cooker => dac;
Synthfrog frog => dac;

//0.15 => cooker.gain;
//0.25 => frog8.gain;

live.file("kick",1) => Buffer.d1.read;
live.file("kick",3) => Buffer.d2.read;
live.file("hh",1) => Buffer.d3.read;
live.file("drum",1) => Buffer.d4.read;
live.file("cp",1) => Buffer.d5.read;

[1,0] @=> int K[];
spork~live.play(Buffer.d1,K,0);spork~live.play(Buffer.d2,K,0);
spork~live.play(Buffer.d3,[1,1,1,1],1);
spork~live.play(Buffer.d4,[0,1],0);
spork~live.play(Buffer.d5,[0,0,0,0,1,0,0,1],0);

spork~live.play(bass,live.rotate([0,36,0,36],2),1);

//spork~cooker.synth(8,[60,60,62,63,67,72]);
//spork~live.play(fm,[60,0,0,62,0,63,0,67],0);

spork~frog.synth(8,[60,0,0]);

//spork~live.play(stk,live[0].transpose([36,38,39,0,36,0,36,38,39,0,36],36),0);

week => now;