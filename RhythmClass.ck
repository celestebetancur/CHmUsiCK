//
//  RhythmClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//


public class Rhythm
{
    public float[] rhythm (int measure)
    {
        [1.0,0.5,0.25] @=> float selection[];
        
        measure * 4 => int Max;
        float rit[0];
        
        0 => float sum;
        
        while(sum < measure)
        {
            selection[Math.random2(0,(selection.cap()-1))] => float selected;
            if(selected == 0.25) 
            {
                rit << selected;
                rit << 0.25;
                sum + (selected * 2) => sum;
            }
            else
            {
                sum + selected => sum;
                rit << selected;
            }
        }
        return rit;
    }
}