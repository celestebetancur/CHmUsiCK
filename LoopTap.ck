//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 23/11/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//
Tap tap;
tap.tap();

Sync sync;
sync.sync(CHmUsiCK.Measure, Sync.NUMMEASURES);

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

while(true)
{
    (Tap.beat * Sync.tSync) => now;
    if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
    {
        Machine.remove(fileID);
        Machine.add(me.dir()+"/LiveCode.ck") => int fileID;
    }
}