Chmusick live;

135 => STATIC.TEMPO;

Notes n;
FMSynth fm;

//TheCooker cooker => dac;
Synthfrog frog => dac;

live[0].file("kick",1) => Buffer.d1.read;
live[0].file("kick",3) => Buffer.d2.read;


[1,0] @=> int K[];
spork~live.play(Buffer.d1,K,0);
spork~live.play(Buffer.d2,K,0);
spork~live.play(Buffer.d3,[1,1,1,1],1);

week => now;