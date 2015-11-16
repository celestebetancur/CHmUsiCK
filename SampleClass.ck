public class Sampler extends Chmusick
{
    
    SndBuf buffer => Echo echo => Gain Normalize => Gain vol => Envelope envelope => Master;
    
    0.6 => Normalize.gain;
    
    0.2 => echo.mix;
    
    8 => int Division;
    
    "" => string fileName;
	
    [0] @=> int gains[];
	
    public string file(string name, string letter)
    {
        me.dir() + "Samples/" + name + "/" + letter + ".wav" => fileName; //Mac/Linux conflict with path
        //"Samples/" + name + "/" + letter + ".wav" => fileName; //Mac/Linux conflict with path
        fileName => buffer.read;
        
        return fileName;
    }
    public string file(string name, int num)
    {
        me.dir() + "Samples/" + name + "/" + num + ".wav" => fileName; //Mac/Linux conflict with path
		//"Samples/" + name + "/" + num + ".wav" => fileName; //Mac/Linux conflict with path
        fileName => buffer.read;
		
        return fileName;
    }
	public string file(string name)
	{
		file(name, 1);
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
	public void sound(string S, int sample[])
	{
		file(S);
		sound(sample);
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
                    0 => buffer.pos;
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
