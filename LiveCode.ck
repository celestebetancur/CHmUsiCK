TheCooker  s => dac;
Drum drum => dac;
Harmony h => dac;
FMSynth fm => dac;

[60,62,63] @=> int notes[];

spork~drum.drum(drum.favorite(4));
spork~h.sinOsc(["Cm","Cm","Ab","Ab"]);
spork~fm.fmBass([48,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0]);

while(true)
{
    for(0 => int i; i< notes.cap(); i++)
    {
        Std.mtof(notes[i]) => s.freq;
        s.sound();
        0.25::second => now;
    }
}
