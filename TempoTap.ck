//
//  TempoTap.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 03/11/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class Tap
{ 
    Hid hi;
    HidMsg msg;
    
    0 => int device;
    if( me.args() ) me.arg(0) => Std.atoi => device;
    
    if( !hi.openKeyboard( device ) ) me.exit();
    <<< hi.name() + "' ready">>>;
    
    time memory[0];
    
    private dur Tap(time tapped)
    {
        memory << tapped;
    }
    
    static dur beat;
    dur partial1, partial2;
    
    public dur tap()
    {
        while (true)
        {
            hi => now;
            
            while( hi.recv( msg ) )
            {
                if( msg.isButtonDown())
                {
                    if( msg.which == 44)
                    {
                        Tap(now);
                    }
                    else
                    {
                        <<<"Tap with space bar!">>>;
                    }
                }
            }
            if(memory.cap() % 4 == 0 && memory.cap() != 0)
            {
                for(0 => int i; i < memory.cap() ; i++)
                {
                    (memory[3]-memory[2])=> partial1;  
                    (memory[1]-memory[0])=> partial2;   
                    (partial1 + partial2) / 2=> beat;     
                }
                beat => now;
                return (beat);
                memory.clear();
            }
        }
    }
}
