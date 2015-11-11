//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 24/06/15.
//

Chmusick extractor;

Sync sync;
sync.sync(Chmusick.MEASURE, Sync.NUMMEASURES);

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

spork~loopTrigger();
spork~beatCounter();

while(true){1::second => now;}

public int loopTrigger()
{
    while(true)
    {
		sync.sync(Chmusick.MEASURE, Sync.NUMMEASURES);
		
        if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
        {
            Machine.remove(fileID);
            Machine.add(me.dir()+"/LiveCode.ck") => int fileID;
        }
        (extractor.convert(Chmusick.TEMPO) * Sync.tSync) => now;
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
        
        extractor.convert(extractor.tempo(extractor.TEMPO)) => now;
    }
    return STATIC.BEATS;
}

public static int measureCounter()
{
    if(STATIC.BEATS % Chmusick.MEASURE == 0)
    {
        STATIC.MEASURES++;
        //<<<STATIC.MEASURES, "Measures">>>; //uncomment to see # of measures
    }
    return STATIC.MEASURES;
}

public static int phraseCounter()
{
    if(STATIC.BEATS % (Sync.NUMMEASURES * Chmusick.MEASURE) == 0)
    {
        STATIC.PHRASES++;
        //<<<STATIC.PHRASES, "Phrases">>>; //uncomment to see # of phrases
    }
    return STATIC.PHRASES;
}
