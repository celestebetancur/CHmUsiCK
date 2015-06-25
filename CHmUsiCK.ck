public class CHmUsiCK extends Chubgraph
{        
    Gain Master => Dyno Processor => outlet;
    
    120 => static float Tempo;  
    convert(Tempo) => static dur ConvertedTempo;
    4 => int OverallDivision;
    
    4 => static int Measure;
    
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
    public int measure(int m)
    {
        m => Measure;
        return Measure;
    }
    public int measure()
    {
        return Measure;
    }
    public float master(float Mgain)
    {
        Mgain => Master.gain;
        return Mgain;
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
    public float density(float limit)
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