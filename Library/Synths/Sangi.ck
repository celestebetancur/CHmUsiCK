public class Sangi extends Chmusick

{
Noise noise => ADSR env1 => SqrOsc two =>  Gain ramp => SqrOsc one =>  ResonZ reson => ADSR env2 => HalfRect hf =>NRev rev=> Gain out => HPF hpf => LPF lpf => outlet;

one.sync(2);

env1.set(50::ms,20::ms,0.1,80::ms);
env2.set(50::ms,50::ms,0.1,80::ms);

two.gain(0.03);
one.gain(0.05);
ramp.gain(10);
out.gain(15);
reson.freq(1000);
reson.Q(0.2);
hpf.freq(1000);
hpf.Q(2);
lpf.freq(1000);
lpf.Q(5);

0.1=> rev.mix;
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
                reson.freq(two.freq(one.freq())*3);
                env1.keyOn();
                env2.keyOn();
                Dur(STATIC.TEMPO,div) => now;
            }
        }
    }
}
}
