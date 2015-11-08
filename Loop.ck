//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 24/06/15.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

CHmUsiCK extractor;

Sync sync;
sync.sync(CHmUsiCK.Measure, Sync.NUMMEASURES);

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

spork~loopTrigger();
spork~beatCounter();

while(true){1::second => now;}

public int loopTrigger()
{
    while(true)
    { 
        if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
        {
            Machine.remove(fileID);
            Machine.add(me.dir()+"/LiveCode.ck") => int fileID;
        }
        (extractor.convert(CHmUsiCK.Tempo) * Sync.tSync) => now;
    }
    return fileID;
}

public static int beatCounter()
{
    while(true)
    {
        STATIC.BEATS++;
        //<<<STATIC.BEATS, "Beats">>>; //uncomment to see # of beats
        
        measureCounter();
        phraseCounter();
        
        extractor.convert(extractor.tempo(extractor.Tempo)) => now;
    }
    return STATIC.BEATS;
}

public static int measureCounter()
{
    if(STATIC.BEATS % CHmUsiCK.Measure == 0)
    {
        STATIC.MEASURES++;
        //<<<STATIC.MEASURES, "Measures">>>; //uncomment to see # of measures
    }
    return STATIC.MEASURES;
}

public static int phraseCounter()
{
    if(STATIC.BEATS % (Sync.NUMMEASURES * CHmUsiCK.Measure) == 0)
    {
        STATIC.PHRASES++;
        //<<<STATIC.PHRASES, "Phrases">>>; //uncomment to see # of phrases
    }
    return STATIC.PHRASES;
}
