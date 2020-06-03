public class Indigo extends Chmusick
{

BandedWG bwg => ADSR e => JCRev rev1 => Gain out;
BandedWG bwg2 => NRev rev2 => e =>  out;
BandedWG bwg3 => rev2 => rev1 => e => out;
out => outlet;

0.05 => rev1.mix;
0.08 => rev2.mix;

e.set(0.02::ms,0.02::ms,0.002,0.002::ms);

out.gain(1);

.5 => bwg.bowRate;
.9 => bwg.bowPressure;
.4 => bwg.strikePosition;
1 => bwg.preset;
.5 => bwg2.bowRate;
.9 => bwg2.bowPressure;
.4 => bwg2.strikePosition;
1 => bwg2.preset;
.5 => bwg3.bowRate;
.9 => bwg3.bowPressure;
.4 => bwg3.strikePosition;
1 => bwg3.preset;

public void synth(int div,int notes[])
{

    while(true)
    {
        for(0 => int i; i < notes.cap(); i++)
        {
            if(notes[i] == 0)
            {
                e.keyOff();
                Dur(STATIC.TEMPO,div) => now;
            }
            else
            {


                Std.mtof(notes[i]+0)=> bwg.freq;
                Std.mtof(notes[i]+3)=> bwg2.freq;
                Std.mtof(notes[i]+6)=> bwg3.freq;
                e.keyOn();
                3 => bwg.pluck;
                3 => bwg2.pluck;
                3 => bwg3.pluck;
                Dur(STATIC.TEMPO,div) => now;
                //e.keyOff();
            }
        }
    }
}
}
