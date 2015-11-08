public class Sampler extends CHmUsiCK
{
    
    SndBuf buffer => Echo echo => Gain Normalize => Gain vol =>Master;
    
    1.5 => Normalize.gain;
    
    0.2 => echo.mix;
    
    8 => int Division;
    
    "Drum kits/bajo.wav" => string fileName;
    
    public string file(string name)
    {
        "Drum kits/" + name + ".wav" => fileName;
        
        return fileName;
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
                    1 => buffer.gain;
                    me.dir() + fileName => buffer.read;
                }
                Dur(convert(Tempo),Division) => now;
                
                if (sample[i] == 0)
                {
                    0 => buffer.gain;
                }
                Dur(convert(Tempo),Division) => now;
            }
        }
    }
}
