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

//Std.system("./CMKlang CMKbridge");
Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

spork~beatCounter();

while(true){second => now;}

public static int beatCounter()
{
    while(true)
    {
        STATIC.BEATS++;
        //<<<STATIC.BEATS, "Beats">>>; //uncomment to see # of beats
        
        if(STATIC.BEATS % (extractor.MEASURE * extractor.CYCLES) == 0)
        {
			//Std.system("./CMKlang CMKbridge");
            if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
            {
				//Std.system("./CMKlang CMKbridge");
                Machine.remove(fileID);
                Machine.add(me.dir()+"/LiveCode.ck") => fileID;
            }
        }
        
        measureCounter();
        phraseCounter();
        
        extractor.convert(extractor.tempo()) => now;
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
