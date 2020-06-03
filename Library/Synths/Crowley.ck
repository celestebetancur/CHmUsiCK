public class Crowley extends Chmusick

{
TriOsc one => ADSR env1 => NRev rev =>Gain out;
TriOsc two => env1 =>ADSR env3=> out;
SawOsc three => env1 => ADSR env2 => out;
SawOsc noise => ResonZ reson => Gain ramp=>Delay delay => JCRev rev2 => env1 => out;
out => HalfRect hf => outlet;

env1.set(200::ms,25::ms,0.8,20::ms);
env2.set(100::ms,25::ms,0.8,20::ms);
env3.set(200::ms,25::ms,0.8,10::ms);

  200::ms => delay.max => delay.delay;

out.gain(0.05);
ramp.gain(100);

one.gain(0.8);
two.gain(0.8);
three.gain(0.8);

rev.mix(0.1);
rev2.mix(0.1);
reson.Q(5000);

public void synth(int div,int notes[])
{

    while(true)
    {
        for(0 => int i; i < notes.cap(); i++)
        {
            if(notes[i] == 0)
            {
                env1.keyOff();
                env2.keyOff();
                env3.keyOff();
                Dur(STATIC.TEMPO,div) => now;
            }
            else
            {
                Std.mtof(notes[i]) => one.freq;
                two.freq(one.freq()*1);
                reson.freq(one.freq()*1);
                three.freq(one.freq()*3.5);
                env1.keyOn();
                env2.keyOn();
                env3.keyOn();
                Dur(STATIC.TEMPO,div) => now;
                env1.keyOff();
                env2.keyOff();
                env3.keyOff();
            }
        }
    }
}
}
