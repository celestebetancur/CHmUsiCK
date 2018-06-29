public class Crowley extends Chmusick

{
SqrOsc one => ADSR env1 => Gain out;
SqrOsc two => env1 => out;
SqrOsc three => env1 => out;
Noise noise => ResonZ reson => Gain ramp => env1 => out;
out => HalfRect hf => outlet;

env1.set(5::ms,15::ms,0.7,80::ms);

out.gain(0.05);
ramp.gain(500);

one.gain(0.5);
two.gain(0.4);
three.gain(0.5);

reson.Q(3000);

public void synth(int div,int notes[])
{
    
    while(true)
    {
        for(0 => int i; i < notes.cap(); i++)
        {
            if(notes[i] == 0)
            {
                env1.keyOff();
                Dur(STATIC.TEMPO,div) => now;
            }
            else
            {
                Std.mtof(notes[i]) => one.freq;
                two.freq(one.freq()*2);
                reson.freq(one.freq());
                three.freq(one.freq()*0.5);
                env1.keyOn();
                Dur(STATIC.TEMPO,div) => now;
                env1.keyOff();
            }
        }          
    }
}
}