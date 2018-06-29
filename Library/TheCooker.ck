//
// TheCooker.ck
// CHmUsiCK
// Created in 2015 by Esteban Betancur
//
// Medellin - Colombia
//

public class TheCooker extends Chmusick
//SynthDef using Perry Cook's example and STK BlitSaw implementation
{
    10 => int partial;
   
    BlitSaw s[partial];      
    Gain Normalize => Gain volum => NRev rev => Envelope env => outlet;  
    
    0.15 => rev.mix;
    
    1.0/partial => Normalize.gain;  
    
    440 => float frq;

    0.1 => float Factor;
    
    for (int i; i < partial; i++) 
    {
        partial => s[i].harmonics;       
            s[i] => Normalize; 
    }
    public float gain(float parameter)
    {
        parameter => volum.gain;
        return volum.gain();
    }
    public float gain()
    {
        return volum.gain();
    }
    public float freq(float freq)
    {
        freq => frq;
        return frq;
    }
    public float freq()
    {
        return frq;
    }
    public float factor(float f)
    {
        f => Factor;
        return Factor;
    }
    public float factor()
    {
        return Factor;
    }
    public void freqAssign()
    {
        for (int i; i < partial; i++) 
        {                   
            (freq() + (factor() * i)) => s[i].freq;
        }
    }
    public void synth(int notes[])
    {
        synth(Division, notes);
    }
    public void synth(int div,int notes[])
    {
        div => Division;
        
        while(true)
        {
            for(0 => int i; i < notes.cap(); i++)
            {
                if(notes[i] == 0)
                {
                    env.keyOff();
                    Dur(STATIC.TEMPO,Division) => now;
                }
                else
                {
                    Std.mtof(notes[i]) => freq;
                    freqAssign();
                    env.keyOn();
                    Dur(STATIC.TEMPO,Division) => now;
                }
            }          
        }
    }
}