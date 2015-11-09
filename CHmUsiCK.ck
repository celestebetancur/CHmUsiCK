public class CHmUsiCK extends Chubgraph
{        
    Gain Master => Dyno Processor => outlet;
    
    120 => static float Tempo;  
    convert(Tempo) => static dur ConvertedTempo;
    
    4 => int OverallDivision;
    
    4 => static int Measure;
    
    1 => static float MASTER;
    
    MASTER => Master.gain;
    
    public static float tempo(float t)
    {
        t => Tempo;
        return Tempo;
    }
    public float tempoD(dur t)
    {
        convertD(t) => Tempo;
        return Tempo;
    }
    public static float tempo()
    {
        return Tempo;
    }
    public int overallDivision(int div)
    {
        div  => OverallDivision;
        return OverallDivision;
    }
    public int overallDivision()
    {
        return OverallDivision;
    }
    public static int measure(int m)
    {
        m => Measure;
        return Measure;
    }
    public static int measure()
    {
        return Measure;
    }
    public static float master(float Mgain)
    {
        Mgain => MASTER;
        return MASTER;
    }
    public float master()
    {
        return Master.gain();
    }
    public void limit()
    {
        Processor.limit();
    }
    public void compress()
    {
        Processor.compress();
    }
    public void expand()
    {
        Processor.expand();
    }
    public void gate()
    {
        Processor.gate();
    }
    public void duck()
    {
        Processor.duck();
    }
    public dur fadeIn(dur d)
    {
        0 => Master.gain;
        
        while(Master.gain() <= 1)
        {
            Master.gain() + 0.01 => Master.gain;
            (d/100) => now;
        }
        return d;
    }
    public dur fadeOut(dur d)
    {
        Master.gain() => Master.gain;
        (Master.gain()*100) => float div;
        
        while(Master.gain() >= 0)
        {
            Master.gain() - 0.01 => Master.gain;
            (d/div) => now;
        }
        0 => Master.gain;
        return d;
    }
    public float accel(float limit)
    {
        if(tempo() < limit)
        {
            while(tempo() < limit)
            {
                tempo() + 0.1 => Tempo;
                convert(Tempo) * 0.25 => now;
            }
        }
        else
        { 
            while(tempo() > limit)
            {
                tempo() - 0.1 => Tempo;
                convert(Tempo) * 0.25 => now;
            }
        }
        return limit;
    }
	public float[] stress(int capacity, int positions[])
	{
		float toReturn[capacity];

		for(0 => int i; i < toReturn.cap(); i++)
		{
			0.4 => toReturn[i];
		}
		for(0 => int i; i < positions.cap(); i++)
		{
			1.0 => toReturn[positions[i]];
		}
		return toReturn;
	}
    public int[] rand(int capacity)
    {
        int random[capacity];
        
        for(0 => int i; i < random.cap(); i ++)
        {
            Math.random2(0,1) => random[i];
        }
        return random;
    }
    public int[] trunc(int pattern[], float howmany)
    {
        (pattern.size() * howmany)$int => int newsize;
        int truncated[newsize];
        
        for(0 => int i; i < newsize; i++)
        {
            pattern[i] => truncated[i];
        }
        return truncated;
    }
    public int[] reverse(int pattern[])
    {
        int reversed[0];
        
        for((pattern.cap()-1) => int i; i >= 0 ; i - 1 => i)
        {
            reversed << pattern[i];
        }
        return reversed;
    }
    public int[] densify(int pattern[])
    {
        int notes[0];
        
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0) 
            {
                notes << pattern[i];
            }
        }
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] == 0 && maybe)
            {
                notes[Math.random2(0, (notes.cap() - 1))] => pattern[i];
            } 
        }
        return pattern;
    }
    public int[] degrade(int pattern[])
    {
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0 && maybe)
            {
                0 => pattern[i];
            }
        }
        return pattern;
    }
    public int[] every(int parameter)
    {
        int everyArray[parameter];
        
        1 => everyArray[0];
        
        for(1 => int i; i < everyArray.cap(); i++)
        {
            0 => everyArray[i];
        }
        
        return everyArray;
    }
    public int[] every(int note, int parameter)
    {
        int everyArray[parameter];
        
        note => everyArray[0];
        
        for(1 => int i; i < everyArray.cap(); i++)
        {
            0 => everyArray[i];
        }
        
        return everyArray;
    }
    public int[] rotate(int pattern[])
    {
        int newPattern[pattern.cap()];
        
        pattern[pattern.cap()-1] => newPattern[0];
        
        for(0 => int i; i < (pattern.cap()-1); i++)
        {
            pattern[i] => newPattern[i+1];
        }
        return newPattern;
    }
    public int[] rotate(int pattern[], int move)
    {
        int newPattern[pattern.cap()];
        
        repeat(move)
        {
            rotate(pattern) @=> newPattern;
            newPattern @=> pattern;
        }
        return pattern;
    }
    public int counter(int pattern[])
    {
        0 => int notesOn;
        
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0)
            {
                1 +=> notesOn; 
            }
        }
        return notesOn;
    }
    public int counter(float pattern[])
    {
        0 => int notesOn;
        
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0)
            {
                1 +=> notesOn; 
            }
        }
        return notesOn;
    }
    public int[] density(int pattern[], float parameter)
    //densify or degrade an array with a float parameter as percentage
    {   
        int toReturn[pattern.cap()];
        pattern.cap() => float size;
        
        if(parameter >= 0 && parameter <= 1)
        {
            Std.ftoi(size * parameter) => int toAdd;
            
            if(counter(pattern) == toAdd) pattern @=> toReturn;
            
            else
            {
                if(counter(pattern) > toAdd)
                {
                    counter(pattern) - toAdd => int c;
                    
                    while(c > 0) 
                    {
                        for(0 => int i; i < pattern.cap(); i++)
                        {
                            if(pattern[i] != 0 && maybe)
                            {
                                0 => pattern[i];
                                1 -=> c;
                            }
                            if(c == 0) break;
                        }
                    }
                    pattern @=> toReturn;
                }
                if(counter(pattern) < toAdd)
                {
                    toAdd - counter(pattern) => int c;
                    
                    while(c > 0) 
                    {
                        for(0 => int i; i < pattern.cap(); i++)
                        {
                            if(pattern[i] == 0 && maybe)
                            {
                                1 => pattern[i];
                                1 -=> c;
                            }
                            if(c == 0) break;
                        }
                    }
                    pattern @=> toReturn;
                }
            }
        }
        else
        {
            <<< "Parameter must be a number between 0 and 1">>>;  
        }
        return toReturn;
    }
    public int[] palindrome(int pattern[])
    {
        int toReturn[(pattern.cap()*2)];
        (pattern.cap()*2) -1 => int countDown; 
        
        for(0 => int i; i < pattern.cap(); i++)
        {
            pattern[i] => toReturn[i];
            pattern[i] => toReturn[countDown];
            1 -=> countDown;
        }
        return toReturn;
    }
    private dur convert(float beat)
    {
        Std.fabs(beat) => beat;
        
        60/beat => float tempo;
        return tempo::second;
    }
    private float convertD(dur beat)
    {
        ((60::second/beat)$float) => float tempo;
        return tempo;
    }
    private dur Dur(dur beat, int div)
    {
        Std.abs(div) => div;
        
        (div / 4.0) => float factor;
        (beat / factor) => dur tempo;
        return tempo;
    }
}