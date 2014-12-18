//
//  BassClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Modified on 10/12/14
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//


public class Bass extends CHmUsiCK
{
    TriOsc Bass => ADSR e => Gain Normalize => Gain bassGain => Master => outlet;
    e.set(10::ms, 8::ms, .5, 5::ms);
    
    0.25 => Normalize.gain; //don't change this
    
    0 => int Key;    
    1 => int Pattern;
    1.2 => bassGain.gain;
    
    Notes modes;
    Rhythm rhythm;
    
    public float gain(float vol) 
    {
        vol => bassGain.gain;
        return bassGain.gain();
    }
    public float gain()
    {
        return bassGain.gain();
    }
    public int key(int input) 
    {
        input => Key;
        return Key;
    }
    public int key()
    {
        return key(Key);
    }
    public int pattern(int input) 
    {
        input => Pattern;
        return Pattern;
    }
    public int pattern()
    {
        return pattern(Pattern);
    }
    public int[] random(int capacity)
    {
        int random[capacity];
        
        for(0 => int i; i < random.cap(); i ++)
        {
            Math.random2(0,6) => random[i];
        }
        return  random;
    }
    public void randomTechBass()
    {
        Math.random2(1,5) => Pattern;
        Math.random2(0,12) => Key;
        techBass(Pattern);
    }
    public void randomTechBass(string key)
    {
        Math.random2(1,5) => Pattern;
        modes.stom(key) => Key;
        techBass(Pattern);
    }
    public void bass (int chords[])
    { 
        bass(Key,chords,Measure);
    }
    public void bass (int chords[],int measure)
    { 
        bass(Key,chords,measure);
    } 
    public void bass (string key,int chords[])
    { 
        bass(modes.stom(key),chords,Measure);
    } 
    public void bass (int key,int chords[])
    { 
        bass(key,chords,Measure);
    } 
    public void bass (string key,int chords[],int measure)
    { 
        bass(modes.stom(key),chords,Measure);
    }
    public void bass (int key,int chords[],int measure)
    { 
        measure => Measure;
        key => Key;
        
        modes.modes(1) @=> int scale[];
        rhythm.rhythm(measure) @=> float r[];
        
        24 => int octave;

        while(true)
        {
            for(0 => int i;i < chords.cap(); i++)
            { 
                for(0 => int ii ; ii < r.cap(); ii++)
                {
                    if(Math.random2f(0,1) < 0.9)
                    {
                        Std.mtof(scale[chords[i]] + (octave + key)) => Bass.freq;
                        e.keyOn();
                        (convert(Tempo) * r[ii]) => now;
                        e.keyOff();
                    }
                    else
                    {
                        Std.mtof(scale[Math.random2(0,(scale.cap()-1))] + (octave + key)) => Bass.freq;
                        e.keyOn();
                        (convert(Tempo) * r[ii]) => now;
                        e.keyOff();
                    }
                }
            }
        }
    }  
    public void techBass ()
    {
        techBass(Pattern);
    }
    public void techBass (int pattern)
    {
        pattern => Pattern;
        
        (24 + Key) => int note;
        (36 + Key) => int octave;
        
        if(pattern == 1)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                convert(Tempo) * 2 => now;
                e.keyOff();
                convert(Tempo) * 2 => now; 
            }
        }
        if(pattern == 2)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                convert(Tempo) => now;
                e.keyOff();
                convert(Tempo) => now;
            }
        }
        if(pattern == 3)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.5) => now;
                e.keyOff();
                (convert(Tempo) * 0.5) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.5) => now;
                e.keyOff();
                (convert(Tempo) * 0.5) => now;
            }
        }
        if(pattern == 4)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.5) => now;
                e.keyOff();
                (convert(Tempo) * 0.5) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.25) => now;
                e.keyOff();
                (convert(Tempo) * 0.25) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.25) => now;
                e.keyOff();
                (convert(Tempo) * 0.25) => now;
            }
        }
        if(pattern == 5)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.25) => now;
                e.keyOff();
                (convert(Tempo) * 0.25) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.25) => now;
                e.keyOff();
                (convert(Tempo) * 0.25) => now;
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.25) => now;
                e.keyOff();
                (convert(Tempo) * 0.25) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (convert(Tempo) * 0.25) => now;
                e.keyOff();
                (convert(Tempo) * 0.25) => now;
            }
        }
    }
}