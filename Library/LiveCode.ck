Chmusick live => dac;

130 => STATIC.TEMPO;

Notes n;
FMSynth fm;

MidiOut midi; 
midi.open(0);

//TheCooker cooker => dac;
Synthfrog frog => dac;

live.file("kick",1) => Buffer.d1.read;
live.file("kick",3) => Buffer.d2.read;
live.file("shaker",3) => Buffer.d3.read;
live.file("drum",1) => Buffer.d4.read;

[1,0] @=> int K[];
spork~live.play(Buffer.d1,K,0);
spork~live.play(Buffer.d2,K,0);
spork~live.play(Buffer.d3,[1,1,1,1],1);
spork~live.play(Buffer.d4,[0,1],0);
spork~live.play(fm,[[67,8],[0,8],[67,16],[0,16],[67,8],[0,16]]);
spork~live.play(midi,[[67.,4],[63.,0.5],[60.,1],[72.,.25],[70.,.25],[0.,1.],[67.,0.5]],8,1);

week => now;