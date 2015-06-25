//
//  SyncClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 04/11/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class Sync
{
    4 => static int NUMMEASURES;
    (Sync.NUMMEASURES * CHmUsiCK.Measure) => static float tSync; 
    
    public float sync() 
    {
        8.0 => tSync;
        return tSync;
    }
    public float sync(float beat)
    {
        beat => tSync;
        return tSync;
    }
    public float sync(float beat, float measures)
    {
        (beat * measures) => tSync;  
        return tSync;
    }
}