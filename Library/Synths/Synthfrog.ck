public class Synthfrog extends Chmusick

{
    SinOsc one => ADSR env1 => TriOsc two => ADSR env2 => Gain out;
    Noise n => ResonZ res => env2 => out;
    SqrOsc three => NRev rev => ADSR env3 => out;
    SinOsc partial => env2 => out;
    out => JCRev rev2 => outlet; 

    two.sync(2);

    env1.set(500::ms,20::ms,0.2,20::ms);
    env2.set(40::ms,20::ms,0.2,10::ms);
    env3.set(20::ms,20::ms,0.2,20::ms);

    one.gain(500);

    res.Q(5);
 
    three.gain(0.12);
    rev.mix(0.3);

    rev2.mix(0.03);
    
    out.gain(0.15);

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
                    Std.mtof(notes[i]) => two.freq;
                    one.freq(two.freq()/2);
                    res.freq(one.freq()*4);
                    three.freq(one.freq()*8);
                    partial.freq(one.freq()*2);
                    env1.keyOn();
                    env2.keyOn();
                    env3.keyOn();
                    Dur(STATIC.TEMPO,div) => now;
                }
            }          
        }
    }
}