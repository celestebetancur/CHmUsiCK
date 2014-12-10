//
//  SyncClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 04/11/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class Sync
{
    static float tSync; 
    
    public float sync() 
    {
        8.0 => tSync;
        return tSync;
    }
    public float sync(float beats)
    {
        beats => tSync;
        return tSync;
    }
    public float sync(float beats, float measures)
    {
        (beats * measures) => tSync;  
        return tSync;
    }
}