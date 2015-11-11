public class Sampler extends Chmusick
{
    
    SndBuf buffer => Echo echo => Gain Normalize => Gain vol => Envelope envelope => Master;
    
    1.5 => Normalize.gain;
    
    0.2 => echo.mix;
    
    8 => int Division;
    
    "Drum kits/bajo.wav" => string fileName;
    
    [0] @=> int gains[];
	
    public string file(string name)
    {
        "Samples/" + name + ".wav" => fileName;
        
        return fileName;
    }
    public int[] changeStress(int parameters[])
    {
        int toReturn[parameters.cap()];
        
        parameters.cap() => gains.size;
        parameters @=> gains;
        
        return gains;
    }
    public int[] accelerate(int patterns[], int parameter)
    {
        parameter*Division => Division;
        
        return patterns;
    }
    public int[] accelerate(int patterns[], int parameter)
    {
        parameter/Division => Division;
        
        return patterns;
    }
    public void sound(int sample[])
    {
        while(true)
        {
            for(0 => int i; i < sample.cap(); i++)
            {
                if (sample[i] == 1)
                {
                    stress(sample.cap(),gains)[i] => buffer.gain;
                    envelope.keyOn();
                    me.dir() + fileName => buffer.read;
                }
                Dur(convert(TEMPO),Division) => now;
                
                if (sample[i] == 0)
                {
                    envelope.keyOff();
                }
                Dur(convert(TEMPO),Division) => now;
            }
        }
    }
}
