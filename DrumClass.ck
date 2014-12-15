//
//  DrumClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified on 19/11/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//
public class Drum extends CHmUsiCK
{
    FileIO rythyms;
    
    Gain Normalize => Gain vol => Master => outlet;
    
    0.22 => Normalize.gain; //don't change this
    
    SndBuf Kick[8]; SndBuf Snare[12]; SndBuf HH[9];
    
    //——————samples for bass drum——————//
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (1).wav" => Kick[0].read; 
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (2).wav" => Kick[1].read; 
    me.dir() + "/Drum Kits/Electronica/Kick_Electronica (3).wav" => Kick[2].read; 
    me.dir() + "/Drum Kits/Hip Hop/Kick (1).wav" => Kick[3].read;
    me.dir() + "/Drum Kits/Hip Hop/Kick (2).wav" => Kick[4].read;
    me.dir() + "/Drum Kits/Hip Hop/Kick (3).wav" => Kick[5].read;
    me.dir() + "/Drum Kits/Vintage Drum/kick a.wav" => Kick[6].read;
    me.dir() + "/Drum Kits/Vintage Drum/kick b.wav" => Kick[7].read;
    //——————samples for snare drum—————//
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
    //——————sample for hhSounds—————————//
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
    
    4 => int bdSound;
    3 => int snSound;
    8 => int hhSound;

    8 => int Division;
    
    int hhGlobal[0];
    int snGlobal[0];
    int bdGlobal[0];
    
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
    public int[] random(int capacity)
    {
        capacity => randomSize;
        
        int random[capacity];
        
        for(0 => int i; i < random.cap(); i ++)
        {
            Math.random2(0,1) => random[i];
        }
        return random;
    }
    public int[][] favorite(int num)
    {
        return FavoriteArray.Drum[num];
    }
    public int[][] randomFavorite(int num)
    {
        return Array.Drum[num];
    }
    public int[] every(int parameter)
    {
        int everyArray[parameter];
        
        1 => everyArray[0];
        
        for(1 => int i; i < everyArray.cap(); i++)
        {
            0 => everyArray[i];
        }
        
        return everyArray;
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
                }
                rythyms <= " ";
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
        randomDrum(Tempo,Division,capacity);
    }
    public void randomDrum(int capacity)
    {
        randomDrum(Tempo,Division,capacity);
    }
    public void randomDrum(dur beat, int capacity)
    {
        randomDrum(beat,Division,capacity);
    }
    public void randomDrum(float beat, int capacity)
    {
        randomDrum(convert(beat),Division,capacity);
    }
    public void randomDrum(float beat, int div, int capacity)
    {
        randomDrum(convert(beat),div,capacity);
    }
    public void randomDrum(dur beat, int div, int capacity)
    {
        random(capacity) @=> int kick[];
        random(capacity) @=> int snare[];
        random(capacity) @=> int hh[];
        
        Math.random2(0,7) => int bdsample; BDSound(bdsample);
        Math.random2(0,11) => int snsample; SNSound(snsample);
        Math.random2(0,8) => int hhsample; HHSound(hhsample);
        
        spork~ drumF(beat,div,kick,snare,hh);
        spork~ event(kick,snare,hh);  
        while(true) 1::second => now;
    }
    public void bdRandomFill(dur beat, int div, int capacity)
    {
        random(capacity) @=> int kick[];
        
        bdFill(beat,div,kick);
    }
    public void bdRandomFill(float beat, int div, int capacity)
    {
        bdRandomFill(convert(beat),div,capacity);
    }
    public void hhRandomFill(dur beat, int div, int capacity)
    {
        random(capacity) @=> int hihat[];
        
        hhFill(beat,div,hihat);
    }
    public void hhRandomFill(float beat, int div, int capacity)
    {
        hhRandomFill(convert(beat),div,capacity);
    }
    public void snRandomFill(dur beat, int div, int capacity)
    {
        random(capacity) @=> int snare[];
        
        snFill(beat,div,snare);
    }
    public void snRandomFill(float beat, int div, int capacity)
    {
        snRandomFill(convert(beat),div,capacity);
    }
    public void randomFill(dur beat, int div, int capacity, int capHH)
    {
        random(capacity) @=> int kick[];
        random(capacity) @=> int hh[];
        
        fill(beat,div,kick,hh);
    }
    public void randomFill(float beat, int div, int capacity, int capHH)
    {
        randomFill(convert(beat),div,capacity,capHH);
    }
    public void randomFill(dur beat, int div, int capacity, int capSnare, int capHH )
    {
        random(capacity) @=> int kick[];
        random(capacity) @=> int snare[];
        random(capacity) @=> int hh[];
        
        fill(beat,div,kick,snare,hh);
    }
    public void randomFill(float beat, int div, int capacity, int capSnare, int capHH )
    {
        randomFill(convert(beat),div,capacity,capSnare,capHH);
    }
    private void bdFill (dur beat,int div,int k[])
    {
        for(0 => int i; i < k.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
            }
            Dur(beat,div) => now;
        } 
    }
    private void hhFill (dur beat,int div,int hh[])
    {        
        for(0 => int i; i < hh.cap(); i++)
        {
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
            }
            Dur(beat,div) => now;
        } 
    }
    private void snFill (dur beat,int div,int sn[])
    {        
        for(0 => int i; i < sn.cap(); i++)
        {
            if (sn[i] == 1)
            {
                0 => Snare[snSound].pos;
            }
            Dur(beat,div) => now;
        } 
    }
    private void fill (dur beat,int div,int k[], int hh[])
    {        
        for(0 => int i; i < k.cap() && i < hh.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
            }
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
            }
            Dur(beat,div) => now;
        } 
    }
    private void fill (dur beat,int div,int k[],int s[],int hh[])
    {        
        for(0 => int i; i < k.cap() && i < s.cap() && i < hh.cap(); i++)
        {
            if (k[i] == 1)
            {
                0 => Kick[bdSound].pos;
            }
            if (s[i] == 1)
            {
                0 => Snare[snSound].pos;
            }
            if (hh[i] == 1)
            {
                0 => HH[hhSound].pos;
            }
            Dur(beat,div) => now;
        } 
    }
    //————————————————set Global variables————————————————//
    public void bd(int bd[])
    {
        bd.size() => bdGlobal.size;
        bd @=> bdGlobal;
    }
    public void hh(int hh[])
    {
        hh.size() => hhGlobal.size;
        hh @=> hhGlobal;
    }
    public void sn(int sn[])
    {
        sn.size() => snGlobal.size;
        sn @=> snGlobal;
    }
    // ———————————————no argument funtion ———————————————//
    public void bd ()
    {
        bassDrum(convert(Tempo),Division,bdGlobal);
    }
    public void bdF ()
    {
        bassDrumF(convert(Tempo),Division,bdGlobal);
    }
    public void sn ()
    {
        snare(convert(Tempo),Division,snGlobal);
    }
    public void snF ()
    {
        snareF(convert(Tempo),Division,snGlobal);
    }
    public void hh ()
    {
        hihat(convert(Tempo),Division,hhGlobal);
    }
    public void hhF ()
    {
        hihatF(convert(Tempo),Division,hhGlobal);
    }
    
    // ———————————————Drum with Fill———————————————//
    public void drumF (int k[])
    {
        bassDrumF(convert(Tempo),Division,k);
    }
    public void drumF (dur beat,int k[])
    {
        bassDrumF(beat,Division,k);
    }
    public void drumF (float beat,int k[])
    {
        bassDrumF(convert(beat),Division,k);
    }
    public void drumF (float beat,int div,int k[])
    {
        bassDrumF(convert(beat),div,k);
    }
    public void drumF (int k[],int hh[])
    {
        spork~ bassDrumF(convert(Tempo),Division,k);
        spork~ hihatF(convert(Tempo),Division,hh);
        while(true) 1::ms => now;
    }
    public void drumF (dur beat,int k[],int hh[])
    {
        spork~ bassDrumF(beat,Division,k);
        spork~ hihatF(beat,Division,hh);
        while(true) 1::ms => now;
    }
    public void drumF (float beat,int k[],int hh[])
    {
        spork~ bassDrumF(convert(beat),Division,k);
        spork~ hihatF(convert(beat),Division,hh);
        while(true) 1::ms => now;
    }
    public void drumF (float beat,int div,int k[],int hh[])
    {
        spork~ bassDrumF(convert(beat),div,k);
        spork~ hihatF(convert(beat),div,hh);
        while(true) 1::ms => now;
    }
    public void drumF (dur beat,int div,int k[],int hh[])
    {
        spork~ bassDrumF(beat,div,k);
        spork~ hihatF(beat,div,hh);
        while(true) 1::ms => now;
    }
    public void drumF (int k[],int s[],int hh[])
    {
        spork~ bassDrumF(convert(Tempo),Division,k);
        spork~ snareF(convert(Tempo),Division,s);
        spork~ hihatF(convert(Tempo),Division,hh);
        while(true) 1::ms => now;
    }
    public void drumF (dur beat,int k[],int s[],int hh[])
    {
        spork~ bassDrumF(beat,Division,k);
        spork~ snareF(beat,Division,s);
        spork~ hihatF(beat,Division,hh);
        while(true) 1::ms => now;
    }
    public void drumF (float beat,int k[],int s[],int hh[])
    {
        spork~ bassDrumF(convert(beat),Division,k);
        spork~ snareF(convert(beat),Division,s);
        spork~ hihatF(convert(beat),Division,hh);
        while(true) 1::ms => now;
    }
    public void drumF (float beat,int div,int k[],int s[],int hh[])
    {
        spork~ bassDrumF(convert(beat),div,k);
        spork~ snareF(convert(beat),div,s);
        spork~ hihatF(convert(beat),div,hh);
        while(true) 1::ms => now;
    }
    public void drumF (dur beat,int div,int k[],int s[],int hh[])
    {
        spork~ bassDrumF(beat,div,k);
        spork~ snareF(beat,div,s);
        spork~ hihatF(beat,div,hh);
        while(true) 1::ms => now;
    }
    public void drumF (int full[][])
    {                
        spork~ bassDrumF(convert(Tempo),Division,full[0]);
        spork~ snareF(convert(Tempo),Division,full[1]);
        spork~ hihatF(convert(Tempo),Division,full[2]);
        while(true) 1::ms => now;
    }
    public void drumF (float beat, int full[][])
    {                
        spork~ bassDrumF(convert(beat),Division,full[0]);
        spork~ snareF(convert(beat),Division,full[1]);
        spork~ hihatF(convert(beat),Division,full[2]);
        while(true) 1::ms => now;
    }
    public void drumF (dur beat,int full[][])
    {                
        spork~ bassDrumF(beat,Division,full[0]);
        spork~ snareF(beat,Division,full[1]);
        spork~ hihatF(beat,Division,full[2]);
        while(true) 1::ms => now;
    }
    public void drumF (float beat,int div, int full[][])
    {                
        spork~ bassDrumF(convert(beat),div,full[0]);
        spork~ snareF(convert(beat),div,full[1]);
        spork~ hihatF(convert(beat),div,full[2]);
        while(true) 1::ms => now;
    }
    public void drumF (dur beat,int div, int full[][])
    {                
        spork~ bassDrumF(beat,div,full[0]);
        spork~ snareF(beat,div,full[1]);
        spork~ hihatF(beat,div,full[2]);
        while(true) 1::ms => now;
    }
    //———————————————————Drum without fill———————————————————//
    public void drum (int k[])
    {
        bassDrum(convert(Tempo),Division,k);
    }
    public void drum (dur beat,int k[])
    {
        bassDrum(beat,Division,k);
    }
    public void drum (float beat,int k[])
    {
        bassDrum(convert(beat),Division,k);
    }
    public void drum (float beat,int div,int k[])
    {
        bassDrum(convert(beat),div,k);
    }
    public void drum (dur beat,int div,int k[])
    {
        bassDrum(beat,div,k);
    }
    public void drum (int k[],int hh[])
    {
        spork~ bassDrum(convert(Tempo),Division,k);
        spork~ hihat(convert(Tempo),Division,hh);
        while(true) 1::ms => now;
    }
    public void drum (dur beat,int k[],int hh[])
    {
        spork~ drum(beat,Division,k);
        spork~ hihat(beat,Division,hh);
        while(true) 1::ms => now;
    }
    public void drum (float beat,int k[],int hh[])
    {
        spork~ drum(convert(beat),Division,k);
        spork~ hihat(convert(beat),Division,hh);
        while(true) 1::ms => now;
    }
    public void drum (float beat,int div,int k[],int hh[])
    {
        spork~ drum(convert(beat),div,k);
        spork~ hihat(convert(beat),div,hh);
        while(true) 1::ms => now;
    }
    public void drum (dur beat,int div,int k[],int hh[])
    {   
        spork~ drum(beat,div,k);
        spork~ hihat(beat,div,hh);
        while(true) 1::ms => now;
    }
    public void drum (int k[],int s[],int hh[])
    {
        spork~ bassDrum(convert(Tempo),Division,k);
        spork~ snare(convert(Tempo),Division,s);
        spork~ hihat(convert(Tempo),Division,hh);
        while(true) 1::ms => now;
    }
    public void drum (dur beat,int k[],int s[],int hh[])
    {
        spork~ bassDrum(beat,Division,k);
        spork~ snare(beat,Division,s);
        spork~ hihat(beat,Division,hh);
        while(true) 1::ms => now;
    }
    public void drum (float beat,int k[],int s[],int hh[])
    {
        spork~ bassDrum(convert(beat),Division,k);
        spork~ snare(convert(beat),Division,s);
        spork~ hihat(convert(beat),Division,hh);
        while(true) 1::ms => now;
    }
    public void drum (float beat,int div,int k[],int s[],int hh[])
    {
        spork~ bassDrum(convert(beat),div,k);
        spork~ snare(convert(beat),div,s);
        spork~ hihat(convert(beat),div,hh);
        while(true) 1::ms => now;
    }
    public void drum (dur beat,int div,int k[],int s[],int hh[])
    {   
        spork~ bassDrum(beat,div,k);
        spork~ snare(beat,div,s);
        spork~ hihat(beat,div,hh);
        while(true) 1::ms => now;
    }
    public void drum (int full[][])
    {                
        spork~ bassDrum(convert(Tempo),Division,full[0]);
        spork~ snare(convert(Tempo),Division,full[1]);
        spork~ hihat(convert(Tempo),Division,full[2]);
        while(true) 1::ms => now;
    }
    public void drum (float beat, int full[][])
    {                
        spork~ bassDrum(convert(beat),Division,full[0]);
        spork~ snare(convert(beat),Division,full[1]);
        spork~ hihat(convert(beat),Division,full[2]);
        while(true) 1::ms => now;
    }
    public void drum (dur beat,int full[][])
    {                
        spork~ bassDrum(beat,Division,full[0]);
        spork~ snare(beat,Division,full[1]);
        spork~ hihat(beat,Division,full[2]);
        while(true) 1::ms => now;
    }
    public void drum (float beat,int div, int full[][])
    {                
        spork~ bassDrum(convert(beat),div,full[0]);
        spork~ snare(convert(beat),div,full[1]);
        spork~ hihat(convert(beat),div,full[2]);
        while(true) 1::ms => now;
    }
    public void drum (dur beat,int div, int full[][])
    {                
        spork~ bassDrum(beat,div,full[0]);
        spork~ snare(beat,div,full[1]);
        spork~ hihat(beat,div,full[2]);
        while(true) 1::ms => now;
    }
    //——————————————————Basic Functions————————————————————//
    private void bassDrumF (dur beat,int div,int k[])
    {
        convertD(beat) => Tempo;
        div => Division;
        k @=> bdGlobal;
        
        0 => int count;
        
        while(count < Refill)
        {
            for(0 => int i; i < k.cap(); i++)
            {
                if (k[i] == 1)
                {
                    0 => Kick[bdSound].pos;
                }
                Dur(beat,div) => now;
            }
            count ++;
            
            if(count == Refill) 
            {
                bdRandomFill(beat,div,k.cap());
                0 => count;
            }
        }
    }
    private void bassDrum (dur beat,int div,int k[])
    {        
        convertD(beat) => Tempo;
        div => Division;
        k @=> bdGlobal;
        
        while(true)
        {
            for(0 => int i; i < k.cap(); i++)
            {
                if (k[i] == 1)
                {
                    0 => Kick[bdSound].pos;
                }
                Dur(beat,div) => now;
            }
        }
    }
    private void hihat (dur beat,int div,int hh[])
    {       
        convertD(beat) => Tempo;
        div => Division;
        hh @=> hhGlobal;
        
        while(true)
        {
            for(0 => int i; i < hh.cap(); i++)
            {
                if (hh[i] == 1)
                {
                    0 => HH[hhSound].pos;
                }
                Dur(beat,div) => now;
            }
        }
    }
    private void hihatF (dur beat,int div,int hh[])
    {
        convertD(beat) => Tempo;
        div => Division;
        hh @=> hhGlobal;
        
        0 => int count;
        
        while(count < Refill)
        {
            for(0 => int i; i < hh.cap(); i++)
            {
                if (hh[i] == 1)
                {
                    0 => HH[hhSound].pos;
                }
                Dur(beat,div) => now;
            }
            count ++;
            
            if(count == Refill) 
            {
                hhRandomFill(beat,div,hh.cap());
                0 => count;
            }
        }
    }
    private void snare (dur beat,int div,int sn[])
    {        
        convertD(beat) => Tempo;
        div => Division;
        sn @=> snGlobal;
        
        while(true)
        {
            for(0 => int i; i < sn.cap(); i++)
            {
                if (sn[i] == 1)
                {
                    0 => Snare[snSound].pos;
                }
                Dur(beat,div) => now;
            } 
        }
    }
    private void snareF (dur beat,int div,int sn[])
    {
        convertD(beat) => Tempo;
        div => Division;
        sn @=> snGlobal;
        
        0 => int count;
        
        while(count < Refill)
        {
            for(0 => int i; i < sn.cap(); i++)
            {           
                if (sn[i] == 1)
                {
                    0 => Snare[snSound].pos;
                }
                Dur(beat,div) => now;
            }
            count ++;
            
            if(count == Refill) 
            {
                snRandomFill(beat,div,sn.cap());
                0 => count;
            }
        }
    }
}