public class TheCooker extends Chmusick
//SynthDef using Perry Cook's example and STK BlitSaw implementation
{
    10 => int partial;
   
    BlitSaw s[partial];      
    Gain Normalize => Gain volum => NRev rev => Master;  
    
    0.2 => rev.mix;
    
    1.2/partial => Normalize.gain;  
    
    400 => float frq;
    
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
    public void sound()
    {
        for (int i; i < partial; i++) 
        {                   
            (freq() + (0.1*i)) => s[i].freq;
        }
    }
}