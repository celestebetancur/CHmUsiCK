//
//  Pan.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 10/12/14.
//

public class Pan extends Chmusick
{
    inlet => Pan2 p => Master => outlet;
    
    8 => int Division;
    
    public void jux(int pattern[], FMSynth l)
    {
        FMSynth r;
        l => dac.left;
        r => dac.right;
        spork~l.fmBass(pattern);
        spork~r.fmBass(r.reverse(pattern));
        while(true) 1::second => now;
    }
    public void randomPan()
    {        
        while(true)
        {
            Math.sin(now/1::second*(Math.random2f(-1,1))*pi) => p.pan; 
            Dur(convert(TEMPO),Division) => now; 
        }
    }
    public void randomPan(float t)
    {
        t => TEMPO;
        
        while(true)
        {
            Math.sin(now/1::second*(Math.random2f(-1,1))*pi) => p.pan; 
            Dur(convert(TEMPO),Division) => now; 
        }
    }
    public void circularPan(float t)
    {
        while(true)
        {
            for(0 => float i;true; i + 0.1 => i)
            {
                Math.sin(i) => p.pan; 
                <<<Math.sin(i)>>>;
                t::ms => now; 
            }
        }
    }
    public int subdivision(int div)
    {
        div => Division;
        return Division;
    }
    public int subdivision()
    {
        return subdivision(Division);
    }
}