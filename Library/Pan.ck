//
//  Pan.ck
//  CHmUsiCK
//
//  Created by Celeste Betancur on 10/12/14.
//

public class Pan extends Chmusick
{
    inlet => Pan2 p => outlet;
    
    public void randomPan()
    {        
        while(true)
        {
            Math.random2f(-1,1) => p.pan; 
            0.125::second => now; 
        }
    }
    public void randomPanEx()
    {        
        while(true)
        {
            Math.random2f(-1,1)  => float temp;
            if(temp < 0 ){
                -1 => p.pan; 
            }
            if(temp > 0 ) {
                1 => p.pan; 
            }
            250::ms => now; 
        }
    }
    public void circularPan(float t)
    {
        while(true)
        {
            for(0 => float i;true; i + 0.1 => i)
            {
                Math.sin(i) => p.pan; 
                t::ms => now; 
            }
        }
    }
}