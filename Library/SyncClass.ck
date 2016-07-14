//
//  SyncClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 04/11/14.
//  
//

public class Sync
{
    4 => static int NUMMEASURES;
    (Sync.NUMMEASURES * Chmusick.MEASURE) => static float tSync; 
    
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
	public static float tsync()
	{
		return tSync;
	}
}
