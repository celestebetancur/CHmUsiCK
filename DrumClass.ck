//
//  DrumClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified on 19/11/14.
//
public class Drum extends Chmusick
{
    OscOut oscout;
    FileIO rythyms;
    
    oscout.dest("localhost",5000);
    rythyms.open(me.dir() + "/favoriteRythyms.txt", FileIO.READ);
    
    Gain Normalize => Gain vol => Master;
    
    0.6 => Normalize.gain; //don't change this
    
    SndBuf Kick[8]; SndBuf Snare[12]; SndBuf HH[9];
    
    //--------samples for bass drum------//
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (1).wav" => Kick[0].read;
	me.dir() + "/Drum Kits/Electronica/Kick_Electronica (2).wav" => Kick[1].read; 
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (3).wav" => Kick[2].read; 
    me.dir() + "/Drum Kits/Hip Hop/Kick (1).wav" => Kick[3].read;
    me.dir() + "/Drum Kits/Hip Hop/Kick (2).wav" => Kick[4].read;
    me.dir() + "/Drum Kits/Hip Hop/Kick (3).wav" => Kick[5].read;
    me.dir() + "/Drum Kits/Vintage Drum/kick a.wav" => Kick[6].read;
    me.dir() + "/Drum Kits/Vintage Drum/kick b.wav" => Kick[7].read;
	//??????samples for snare drum?????//
    me.dir() + "/Drum Kits/Electronica/Claps and Snare_Electronica (1).wav" => Snare[0].read;
    me.dir() + "/Drum Kits/Electronica/Claps and Snare_Electronica (2).wav" => Snare[1].read;
    me.dir() + "/Drum Kits/Electronica/Claps and Snare_Electronica (3).wav" => Snare[2].read;
    me.dir() + "/Drum Kits/Electronica/Claps_Electronica (1).wav"=> Snare[3].read;
    me.dir() + "/Drum Kits/Electronica/Claps_Electronica (2).wav"=> Snare[4].read;
    me.dir() + "/Drum Kits/Electronica/Claps_Electronica (3).wav"=> Snare[5].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (1).wav" => Snare[6].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (2).wav" => Snare[7].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (3).wav" => Snare[8].read;
    me.dir() + "/Drum Kits/Hip Hop/Snare - Clap (4).wav" => Snare[9].read;
    me.dir() + "/Drum Kits/Vintage Drum/snare a.wav" => Snare[10].read;
    me.dir() + "/Drum Kits/Vintage Drum/snare b.wav" => Snare[11].read;
    //??????sample for hhSounds?????????//
    me.dir() + "/Drum Kits/Electronica/Hit_Hat_Electronica (1).wav" => HH[0].read;
    me.dir() + "/Drum Kits/Electronica/Hit_Hat_Electronica (2).wav" => HH[1].read;
    me.dir() + "/Drum Kits/Electronica/Hit_Hat_Electronica (3).wav" => HH[2].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat - Shaker (1).wav" => HH[3].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat - Shaker (2).wav" => HH[4].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat - Shaker (3).wav" => HH[5].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat (1).wav" => HH[6].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat (2).wav" => HH[7].read;
    me.dir() + "/Drum Kits/Hip Hop/Hihat (3).wav" => HH[8].read;
	
    for(0 => int i; i < Kick.cap(); i++)
    {
        Kick[i] => Normalize;
        Kick[i].samples() => Kick[i].pos;
    }
    for(0 => int i; i < Snare.cap(); i++)
    { 
        Snare[i] => Normalize;
        Snare[i].samples() => Snare[i].pos;
    }
    for(0 => int i; i < HH.cap(); i++)
    {   
        HH[i] => Normalize;
        HH[i].samples() => HH[i].pos;
    }
    
    7 => int Refill;
    
    0 => int randomSize;
    
    0 => int bdSound;
    9 => int snSound;
    8 => int hhSound;
    
    8 => int Division;
    
    [1] @=> int hhGlobal[];
    [1] @=> int snGlobal[];
    [1] @=> int bdGlobal[];
    
    int rythym[0][0]; 
	
    public float gain(float volum)
    {
        volum => vol.gain;
        return vol.gain();
    }
    public float gain()
    {
        return vol.gain();
    }
     public int subdivision(int div)
    {
        div => Division;
        return Division;
    }
    public int subdivision()
    {
        return subdivision(Division);
    }
    public int BDSound(int num)
    {
        num => bdSound;
        return bdSound;
    }
    public int BDSound()
    {
        return BDSound(bdSound);
    }
    public int SNSound(int num)
    {
        num => snSound;
        return snSound;
    }
    public int SNSound()
    {
        return SNSound(snSound);
    }
    public int HHSound(int num)
    {
        num => hhSound;
        return hhSound;
    }
    public int HHSound()
    {
        return HHSound(hhSound);
    }
    public int fillEach(int refillC)
    {
        refillC => Refill;
        return Refill;
    }
    public int fillEach()
    {
        return fillEach(Refill);
    }
    public int[][] favorite(int num)
    {
        return FavoriteArray.Drum[num];
    }
    public int[][] randomFavorite(int num)
    {
        return Array.Drum[num];
    }
    private void saveFavorite(int k[], int sn[], int hh[])
    {
        rythyms.open(me.dir() + "/favoriteRythyms.txt", FileIO.WRITE);
        rythyms.size() => rythyms.seek;
        
        for(0 => int i; i < Array.Drum.cap(); i++)
        {
            for(0 => int ii; ii < Array.Drum[i].cap(); ii++)
            {
                for(0 => int iii; iii < Array.Drum[i][ii].cap(); iii++)
                {
                    rythyms <= Array.Drum[i][ii][iii];
                    rythyms <= " ";
                }
            }
            rythyms <= "\n";
        }
        rythyms.close();
    }
    private void event(int k[],int sn[] ,int hh[])
    {   
        saveFavorite(k,sn,hh);
        [k,sn,hh] @=> rythym;
        
        Hid hi;
        HidMsg msg;
        
        0 => int device;
        
        if( me.args() ) me.arg(0) => Std.atoi => device;
        
        if( !hi.openKeyboard( device ) ) me.exit();
        <<<"Press -?- key to save random to favorites">>>;
        
        while (true)
        {
            hi => now;
            
            while( hi.recv( msg ) )
            {
                if( msg.isButtonDown())
                {
                    if( msg.which == 45)
                    {
                        saveFavorite(k,sn,hh);
                        Array.Drum << rythym;
                        <<<"Stored">>>;
                    }
                }
            }
        }
    }
    public void randomDrum()
    {
        Math.random2(0,Math.random2(0,32)) => int capacity;
        randomDrum(Division,capacity);
    }
    public void randomDrum(int capacity)
    {
        randomDrum(Division,capacity);
    }
    public void randomDrum(int div, int capacity)
    {
        rand(capacity) @=> int kick[];
        rand(capacity) @=> int snare[];
        rand(capacity) @=> int hh[];
        
        spork~ drumF(kick,snare,hh);
        spork~ event(kick,snare,hh);  
        while(true) 1::second => now;
    }
    public void bdRandomFill(int capacity)
    {
        rand(capacity) @=> int kick[];
        
        bdFill(kick);
    }
    public void hhRandomFill(int capacity)
    {
        rand(capacity) @=> int hihat[];
        
        hhFill(hihat);
    }
    public void snRandomFill(int capacity)
    {
        rand(capacity) @=> int snare[];
        
        snFill(snare);
    }
    public void randomFill(int capacity, int capHH)
    {
        rand(capacity) @=> int kick[];
        rand(capacity) @=> int hh[];
        
        fill(kick,hh);
    }
    public void randomFill(int capacity)
    {
        rand(capacity) @=> int kick[];
        rand(capacity) @=> int snare[];
        rand(capacity) @=> int hh[];
        
        fill(kick,snare,hh);
    }
    private void bdFill (int k[])
    {
        for(0 => int i; i < k.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
				Math.random2f(0.5,1) => Kick[bdSound].gain;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void hhFill (int hh[])
    {        
        for(0 => int i; i < hh.cap(); i++)
        {
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
				Math.random2f(0.5,1) => HH[hhSound].gain;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void snFill (int sn[])
    {        
        for(0 => int i; i < sn.cap(); i++)
        {
            if (sn[i] == 1)
            {
                0 => Snare[snSound].pos;
				Math.random2f(0.5,1) => Snare[snSound].gain;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void fill (int k[], int hh[])
    {        
        for(0 => int i; i < k.cap() && i < hh.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
				Math.random2f(0.5,1) => Kick[bdSound].gain;
            }
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
				Math.random2f(0.5,1) => HH[hhSound].gain;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    private void fill (int k[],int s[],int hh[])
    {        
        for(0 => int i; i < k.cap() && i < s.cap() && i < hh.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
				Math.random2f(0.5,1) => Kick[bdSound].gain;
            }
            if (s[i] == 1)
            {
                0 => Snare[snSound].pos;
				Math.random2f(0.5,1) => Snare[snSound].gain;
            }
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
				Math.random2f(0.5,1) => HH[hhSound].gain;
            }
            Dur(convert(TEMPO),Division) => now;
        } 
    }
    //------------------set Global variables--------------------//
    public int[] bd(int bd[])
    {
        bd.size() => bdGlobal.size;
        bd @=> bdGlobal;
        return bdGlobal;
    }
    public int[] hh(int hh[])
    {
        hh.size() => hhGlobal.size;
        hh @=> hhGlobal;
        return hhGlobal;
    }
    public int[] sn(int sn[])
    {
        sn.size() => snGlobal.size;
        sn @=> snGlobal;
        return snGlobal;
    }
    //--------------------no argument funtion ----------------------//
    public int[] bd ()
    {
        bassDrum(bdGlobal);
        return bdGlobal;
    }
    public int[] bdF ()
    {
        bassDrumF(bdGlobal);
        return bdGlobal;
    }
    public int[] sn ()
    {
        snare(snGlobal);
        return snGlobal;
    }
    public int[] snF ()
    {
        snareF(snGlobal);
        return snGlobal;
    }
    public int[] hh ()
    {
        hihat(hhGlobal);
        return hhGlobal;
    }
    public int[] hhF ()
    {
        hihatF(hhGlobal);
        return hhGlobal;
    }
    
    //--------------------Drum with Fill-------------------------//
    public void drumF (int k[])
    {
        bassDrumF(k);
    }
    public void drumF (int k[],int hh[])
    {
        spork~ bassDrumF(k);
        spork~ hihatF(hh);
        while(true) 1::ms => now;
    }
    public void drumF (int k[],int s[],int hh[])
    {
        spork~ bassDrumF(k);
        spork~ snareF(s);
        spork~ hihatF(hh);
        while(true) 1::ms => now;
    }
    public void drumF (int full[][])
    {   
        if(full.cap() == 3)
        {             
            spork~ bassDrumF(full[0]);
            spork~ snareF(full[1]);
            spork~ hihatF(full[2]);
            while(true) 1::ms => now;
        }
        if(full.cap() == 2)
        {             
            spork~ bassDrumF(full[0]);
            spork~ hihatF(full[1]);
            while(true) 1::ms => now;
        }
    }
    //--------------------Drum without fill------------------------//
    public int[] drum ()
    {
        spork~ bassDrum(bdGlobal);
        spork~ snare(snGlobal);
        spork~ hihat(hhGlobal);
        while(true) 1::ms => now;
        return bdGlobal,snGlobal,hhGlobal;
    }
    public int[] drum (int k[])
    {
        bassDrum(k);
        return k;
    }
    public int[] drum (int k[],int hh[])
    {
        spork~ bassDrum(k);
        spork~ hihat(hh);
        while(true) 1::ms => now;
        return k,hh;
    }
    public int[] drum (int k[],int s[],int hh[])
    {
        spork~ bassDrum(k);
        spork~ snare(s);
        spork~ hihat(hh);
        while(true) 1::ms => now;
        return k,s,hh;
    }
    public int[] drum (int full[][])
    {                
        if(full.cap() == 3)
        {             
            spork~ bassDrum(full[0]);
            spork~ snare(full[1]);
            spork~ hihat(full[2]);
            while(true) 1::ms => now;
        }
        if(full.cap() == 2)
        {             
            spork~ bassDrum(full[0]);
            spork~ hihat(full[1]);
            while(true) 1::ms => now;
        }
        return full[0],full[1],full[2];
    }
    //-----------------Basic Functions---------------------//
    private int[] bassDrumF (int k[])
    {
        k @=> bdGlobal;
        
        0 => int count;
        
        while(count < Refill)
        {
            for(0 => int i; i < k.cap(); i++)
            {
                if (k[i] == 1)
                {
                    0 => Kick[bdSound].pos;
					Math.random2f(0.5,1) => Kick[bdSound].gain;
                }
                Dur(convert(TEMPO),Division) => now;
            }
            count ++;
            
            if(count == Refill) 
            {
                bdRandomFill(k.cap());
                0 => count;
            }
        }
        return k;
    }
    private int[] bassDrum (int k[])
    {        
        k @=> bdGlobal;
        
        while(true)
        {
            for(0 => int i; i < k.cap(); i++)
            {
                if (k[i] == 1)
                {
                    0 => Kick[bdSound].pos;
		    Math.random2f(0.5,1) => Kick[bdSound].gain;
		    oscout.start("/bd");
                    oscout.add(1);
                    oscout.send();
                }
                Dur(convert(TEMPO),Division) => now;
            }
        }
        return k;
    }
    private int[] hihat (int hh[])
    {       
        hh @=> hhGlobal;
        
        while(true)
        {
            for(0 => int i; i < hh.cap(); i++)
            {
                if (hh[i] == 1)
                {
                    0 => HH[hhSound].pos;
		    Math.random2f(0.5,1) => HH[hhSound].gain;
		    oscout.start("/hh");
                    oscout.add(1);
                    oscout.send();
                }
                Dur(convert(TEMPO),Division) => now;
            }
        }
        return hh;
    }
    private int[] hihatF (int hh[])
    {
        hh @=> hhGlobal;
        
        0 => int count;
        
        while(count < Refill)
        {
            for(0 => int i; i < hh.cap(); i++)
            {
                if (hh[i] == 1)
                {
                    0 => HH[hhSound].pos;
					Math.random2f(0.5,1) => HH[hhSound].gain;
                }
                Dur(convert(TEMPO),Division) => now;
            }
            count ++;
            
            if(count == Refill) 
            {
                hhRandomFill(hh.cap());
                0 => count;
            }
        }
        return hh;
    }
    private int[] snare (int sn[])
    {        
        sn @=> snGlobal;
        
        while(true)
        {
            for(0 => int i; i < sn.cap(); i++)
            {
                if (sn[i] == 1)
                {
                    0 => Snare[snSound].pos;
		    Math.random2f(0.5,1) => Snare[snSound].gain;
		    oscout.start("/sn");
                    oscout.add(1);
                    oscout.send();
                }
                Dur(convert(TEMPO),Division) => now;
            } 
        }
        return sn;
    }
    private int[] snareF (int sn[])
    {
        sn @=> snGlobal;
        
        0 => int count;
        
        while(count < Refill)
        {
            for(0 => int i; i < sn.cap(); i++)
            {           
                if (sn[i] == 1)
                {
                    0 => Snare[snSound].pos;
					Math.random2f(0.5,1) => Snare[snSound].gain;
                }
                Dur(convert(TEMPO),Division) => now;
            }
            count ++;
            
            if(count == Refill) 
            {
                snRandomFill(sn.cap());
                0 => count;
            }
        }
        return sn;
    }
}
