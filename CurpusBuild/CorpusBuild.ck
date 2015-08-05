public class CorpusBuild {
    
    8 => static int STEPS; 
    
    int Kick[STEPS];
    int Snare[STEPS];
    int HiHat[STEPS];
    
    Kick.clear();
    Snare.clear();
    HiHat.clear();
    
    FileIO kickTxt;
    FileIO snareTxt;
    FileIO hhTxt;
    
    kickTxt.open(me.dir() + "Kick.txt",FileIO.READ);
    
    int num;
    
    while(kickTxt => num)
    {
        num <= Std.atoi(IO.newline());
        Kick << num;
    }
    kickTxt.close();
    
    snareTxt.open(me.dir() + "Snare.txt",FileIO.READ);

    while(snareTxt => num)
    {
        num <= Std.atoi(IO.newline());
        Snare << num;
    }
    snareTxt.close();
    
    hhTxt.open(me.dir() + "HH.txt",FileIO.READ);
    
    while(hhTxt => num)
    {
        num <= Std.atoi(IO.newline());
        HiHat << num;
    }
    hhTxt.close();
    
    public void clear()
    {
        kickTxt.open(me.dir() + "/Kick.txt", FileIO.WRITE);
        snareTxt.open(me.dir() + "/Snare.txt", FileIO.WRITE);
        hhTxt.open(me.dir() + "/HH.txt", FileIO.WRITE);
        
        for(0 => int i; i < STEPS; i++)
        {
            kickTxt.write(0);
            kickTxt.write("\n");
            
            snareTxt.write(0);
            snareTxt.write("\n");
            
            hhTxt.write(0);
            hhTxt.write("\n");
        }
        kickTxt.close();
        snareTxt.close();
        hhTxt.close();
    }
    
    public int[] kick(int k[])
    {
        kickTxt.close();

        kickTxt.open(me.dir() + "/Kick.txt", FileIO.WRITE);
        
        if(k.cap() != STEPS)
        {
            <<<"You should add an eight step secuence">>>;
        }
        else
        {
            for(0 => int i; i < k.cap(); i++)
            {
                if(k[i] == 1)
                {
                    1 +=> Kick[i];
                    kickTxt.write(Kick[i]);
                    kickTxt.write("\n");
                }
                if(k[i] == 0)
                {
                    kickTxt.write(Kick[i]);
                    kickTxt.write("\n");
                }
                if(k[i] != 1 && k[i] != 0)
                {
                    <<<"array fill with 0 or 1">>>;
                }
            }
            kickTxt.close();
        }
        return Kick;
    }

    public int[] snare(int s[])
    {
        snareTxt.close();

        snareTxt.open(me.dir() + "/Snare.txt", FileIO.WRITE);
        
        if(s.cap() != STEPS)
        {
            <<<"You should add an eight step secuence">>>;
        }
        else
        {
            for(0 => int i; i < s.cap(); i++)
            {
                if(s[i] == 1)
                {
                    1 +=> Snare[i];
                    snareTxt.write(Snare[i]);
                    snareTxt.write("\n");
                }
                if(s[i] == 0)
                {
                    snareTxt.write(Snare[i]);
                    snareTxt.write("\n");
                }
                if(s[i] != 1 && s[i] != 0)
                {
                    <<<"array fill with 0 or 1">>>;
                }
            }
            snareTxt.close();
        }
        return Snare;
    }
    public int[] HH(int hh[])
    {
        hhTxt.close();

        hhTxt.open(me.dir() + "/HH.txt", FileIO.WRITE);
        
        if(hh.cap() != STEPS)
        {
            <<<"You should add an eight step secuence">>>;
        }
        else
        {
            for(0 => int i; i < hh.cap(); i++)
            {
                if(hh[i] == 1)
                {
                    1 +=> HiHat[i];
                    hhTxt.write(HiHat[i]);
                    hhTxt.write("\n");
                }
                if(hh[i] == 0)
                {
                    hhTxt.write(HiHat[i]);
                    hhTxt.write("\n");
                }
                if(hh[i] != 1 && hh[i] != 0)
                {
                    <<<"array fill with 0 or 1">>>;
                }
            }
            hhTxt.close();
        }
        return HiHat;
    }
    
}
