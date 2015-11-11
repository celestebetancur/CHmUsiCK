//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 23/11/14.
//
Tap tap;
tap.tap();

Sync sync;
//sync.sync(Chmusick.MEASURE, Sync.NUMMEASURES);

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

8::second => now;

while(true)
{
	sync.sync(Chmusick.MEASURE, Sync.NUMMEASURES);
	
    if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
    {
        Machine.remove(fileID);
        Machine.add(me.dir()+"/LiveCode.ck") => int fileID;
    }
    (Tap.beat * Sync.tSync) => now;
}