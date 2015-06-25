//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 23/11/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//


CHmUsiCK extractor;

Sync sync;
sync.sync(CHmUsiCK.Measure, Sync.NUMMEASURES);

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

spork~beatCounter();

while(true)
{ 
    (extractor.convert(CHmUsiCK.Tempo) * Sync.tSync) => now;
    if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
    {
        Machine.remove(fileID);
        Machine.add(me.dir()+"/LiveCode.ck") => int fileID;
    }
}

public int beatCounter()
{
    while(true)
    {
        STATIC.BEATS++;
        <<<STATIC.BEATS, "Beats">>>;
        
        measureCounter();
        phraseCounter();
        
        extractor.convert(extractor.tempo(extractor.Tempo)) => now;
    }
}

public int measureCounter()
{
    if(STATIC.BEATS % CHmUsiCK.Measure == 0)
    {
        STATIC.MEASURES++;
        <<<STATIC.MEASURES, "Measures">>>;
    }
}

public int phraseCounter()
{
    if(STATIC.BEATS % (Sync.NUMMEASURES * CHmUsiCK.Measure) == 0)
    {
        STATIC.PHRASES++;
        <<<STATIC.PHRASES, "Phrases">>>;
    }
}
