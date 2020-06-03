//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 24/06/15.
//  Testing ram overflow fix 1/03/2017.

/*Hid hi;
HidMsg msg;

0 => int device;
if( me.args() ) me.arg(0) => Std.atoi => device;

if( !hi.openKeyboard( device ) ) me.exit();
<<< "keyboard '" + hi.name() + "' ready for sync - cmd+r", "" >>>;*/

KBHit kb;

0 => int cmd;
0 => int syncState;
Shred counterID;

Chmusick extractor;
Buffer buffer;

Sync sync;
sync.sync(STATIC.MEASURE, Sync.NUMMEASURES);

spork~replaceSyncTerminal();
//Std.system("./CMKlang CMKbridge");

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

if(fileID != 0){
    spork~beatCounter() @=> counterID;
    spork~replaceSyncTerminal();
    while(true) day => now;
}
else {
    <<< "Check your LiveCode.ck file and add Library.ck again..." >>>;
}

/* spork~beatCounter() @=> counterID;
spork~replaceSyncTerminal();
while(true) day => now; */

public static int beatCounter()
{
    while(true)
    {
        STATIC.BEATS++;
        if(STATIC.BEATS % (STATIC.MEASURE * STATIC.CYCLES) == 0 && STATIC.BEATS > 2)
        {
            samp => now;
            Machine.replace(fileID,me.dir()+"/LiveCode.ck");
            /* if(Machine.replace(fileID,me.dir()+"/LiveCode.ck"))
            {
                Machine.remove(fileID);
                Machine.add(me.dir()+"/LiveCode.ck") => fileID;
            } */
        }
        samp => now; // to let ChucK change STATIC.TEMPO value in case of change
        measureCounter();
        phraseCounter();
        extractor.convert(STATIC.TEMPO) => now;
    }
    return STATIC.BEATS;
}

public static int measureCounter()
{
    if(STATIC.BEATS % STATIC.MEASURE == 0)
    {
        STATIC.MEASURES++;
        //<<<STATIC.MEASURES, "Measures">>>; //uncomment to see # of measures
    }
    return STATIC.MEASURES;
}

public static int phraseCounter()
{
    if(STATIC.BEATS % (Sync.NUMMEASURES * STATIC.MEASURE) == 0)
    {
        STATIC.PHRASES++;
        //<<<STATIC.PHRASES, "Phrases">>>; //uncomment to see # of phrases
    }
    return STATIC.PHRASES;
}

/*public void replaceSyncMac(){
    while( true )
    {
        hi => now;
        while( hi.recv( msg ) )
        {
            if( msg.isButtonDown() && msg.which == 224)
            {
                1 => cmd;
            }
            if( !msg.isButtonDown() && msg.which == 224)
            {
                0 => cmd;
                0 => syncState;
            }
            if(msg.which == 21 && cmd == 1){
                if(syncState == 0){
                    if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") => fileID)
                    {
                        Machine.remove(fileID);
                        Machine.add(me.dir()+"/LiveCode.ck") => fileID;
                        0 => STATIC.BEATS;
                        0 => STATIC.MEASURES;
                        0 => STATIC.PHRASES;
                        <<< "Syncing CHmUsiCK..." >>>;
                        counterID.exit();
                        extractor.convert(STATIC.TEMPO)*2 => now;
                        spork~beatCounter() @=> counterID;
                        1 => syncState;
                    }
                }
            }
        }
    }
}*/

public void replaceSyncTerminal(){
    while( true )
    {
        kb => now;
        while( kb.more() )
        {
          //<<<kb.getchar()>>>;
            if(kb.getchar() == 82){
                if(syncState == 0){
                    if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") => fileID)
                    {
                        Machine.remove(fileID);
                        Machine.add(me.dir()+"/LiveCode.ck") => fileID;
                        0 => STATIC.BEATS;
                        0 => STATIC.MEASURES;
                        0 => STATIC.PHRASES;
                        <<< "Syncing CHmUsiCK..." >>>;
                        counterID.exit();
                        extractor.convert(STATIC.TEMPO)*2 => now;
                        spork~beatCounter() @=> counterID;
                    }
                }
            }
        }
    }
}
