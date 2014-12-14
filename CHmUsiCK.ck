public class CHmUsiCK extends Chubgraph
{
    Gain Master => Dyno Processor => outlet;
    
    120 => float OverallTempo;
    8 => int OverallDivision;
    
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
    public int[] reverse(int pattern[])
    {
        int reversed[0];
        
        for((pattern.cap()-1) => int i; i >= 0 ; i - 1 => i)
        {
            reversed << pattern[i];
        }
        return reversed;
    }
    public int[] degrade(int pattern[])
    {
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] == 1 && maybe)
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
        (div / 4) => float factor;
        (beat / factor) => dur tempo;
        return tempo;
    }
}