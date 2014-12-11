//
//  Pan.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 10/12/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class Pan extends CHmUsiCK
{
    inlet => Pan2 p => Master => outlet;
    
    120 => float Tempo;
    8 => int Division;
    
    public void randomPan(float t)
    {
        t => Tempo;
        
        while(true)
        {
            Math.sin(now/1::second*(Math.random2f(-1,1))*pi) => p.pan; 
            Dur(convert(Tempo),Division) => now; 
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
    private dur Dur(dur beat, int div)
    {
        (div / 4) => float factor;
        (beat / factor) => dur tempo;
        return tempo;
    }
    private dur convert(float beat)
    {
        60/beat => float tempo;
        return tempo::second;
    }
    public float tempo(float t)
    {
        t => Tempo;
        return Tempo;
    }
    public float tempo()
    {
        return tempo(Tempo);
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