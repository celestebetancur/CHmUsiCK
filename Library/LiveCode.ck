Chmusick live[16];

for(0 => int i; i < 16; i++){
    live[i] => dac;
}

135 => STATIC.TEMPO;

Notes n;
FMSynth fm[4];
TriOsc bass;
HevyMetl stk;
//TheCooker cooker => dac.chan(4);
Synthfrog frog => dac;
Synthfrog frog3 => dac;
Synthfrog frog8 => dac;

//0.15 => cooker.gain;
//0.25 => frog8.gain;

MidiOut mout;
mout.open(0);

live[0].file("kick",1) => Buffer.d1.read;
live[0].file("kick",3) => Buffer.d2.read;
live[1].file("hh",1) => Buffer.d3.read;
live[1].file("drum",1) => Buffer.d4.read;
live[2].file("cp",1) => Buffer.d5.read;

[1,0] @=> int K[];
spork~live[0].play(Buffer.d1,K,0);spork~live[0].play(Buffer.d2,K,0);
spork~live[1].play(Buffer.d3,[1,1,1,1],1);
spork~live[1].play(Buffer.d4,[0,1],0);
spork~live[2].play(Buffer.d5,[0,0,0,0,1,0,0,1],0);

spork~live[3].play(mout,[60,0,0,60,0,0,60,0,0,60,0,0,60,0,60,0,58,0,0,58,0,0,58,0,0,58,0,0,58,0,58,0],0x90);
spork~live[3].play(mout,[63,0,0,63,0,0,63,0,0,63,0,0,63,0,63,0,62,0,0,62,0,0,62,0,0,62,0,0,62,0,62,0],0x90);
spork~live[3].play(mout,[72,0,0,72,0,0,72,0,0,72,0,0,72,0,72,0,70,0,0,70,0,0,70,0,0,70,0,0,70,0,70,0],0x90);

spork~live[3].play(bass,live[0].rotate([0,36,0,36],2),1);

//spork~cooker.synth(8,[60,60,62,63,67,72]);
//spork~live[4].play(fm[1],[60,0,0,62,0,63,0,67],0);
//spork~live[5].play(fm[2],[60,0,0,62,0,63,0,67],0);

spork~frog.synth(8,[60,0,0,60,0,0,60,0,0,60,0,0,60,0,60,0,58,0,0,58,0,0,58,0,0,58,0,0,58,0,58,0]);
spork~frog3.synth(8,[63,0,0,63,0,0,63,0,0,63,0,0,63,0,63,0,62,0,0,62,0,0,62,0,0,62,0,0,62,0,62,0]);
spork~frog8.synth(8,[72,0,0,72,0,0,72,0,0,72,0,0,72,0,72,0,70,0,0,70,0,0,70,0,0,70,0,0,70,0,70,0]);

//spork~live[7].play(stk,live[0].transpose([36,38,39,0,36,0,36,38,39,0,36],36),0);

week => now;