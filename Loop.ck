//
//  Loop.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified 23/11/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

Sync sync;
sync.sync(4,4);

Machine.add(me.dir()+"/LiveCode.ck") => int fileID;

while(true)
{
    (0.25::second * Sync.tSync) => now;
    if(Machine.replace(fileID,me.dir()+"/LiveCode.ck") == true)
    {
        Machine.remove(fileID);
        Machine.add(me.dir()+"/LiveCode.ck") => int fileID;
    }
}