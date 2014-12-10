//
//  BassClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//


public class Bass extends CHmUsiCK
{
    TriOsc Bass => ADSR e => Gain bassGain => Master => outlet;
    e.set(10::ms, 8::ms, .5, 5::ms);
    
    int basspatern[5];
    
    OverallTempo => float Tempo;
    4 => int Measure;
    1 => int Mode;
    1 => int Key;    
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
    public float tempo(float t)
    {
        t => Tempo;
        return Tempo;
    }
    public float tempo()
    {
        return tempo(Tempo);
    }
    public int mode(int input) 
    {
        input => Mode;
        return Mode;
    }
    public int mode()
    {
        return mode(Mode);
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
    private dur convert(float beat)
    {
        (60/beat) => float tempo;
        return tempo::second;
    }
    private float convertD(dur beat)
    {
        ((60::second/beat)$float) => float tempo;
        return tempo;
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
        Math.random2(0,12) => Mode;
        techBass(convert(Tempo),Mode,Pattern);
    }
    public void randomTechBass(float beat)
    {
        randomTechBass(convert(beat));
    }
    public void randomTechBass(dur beat)
    {
        Math.random2(1,5) => Pattern;
        Math.random2(0,12) => Mode;
        techBass(beat,Mode,Pattern);
    }
    public void randomTechBass(float beat, string key)
    {
        randomTechBass(convert(beat),key);
    }
    public void randomTechBass(dur beat, string key)
    {
        Math.random2(1,5) => Pattern;
        modes.stom(key) => Mode;
        techBass(beat,Mode,Pattern);
    }
    public void bass (int chords[])
    {  
        bass(Tempo,Mode,Key,chords,Measure);
    }
    public void bass (float beat,int chords[])
    { 
        bass(convert(beat),Mode,Key,chords,Measure);
    }
    public void bass (dur beat,int chords[])
    { 
        bass(beat,Mode,Key,chords,Measure);
    }
    public void bass (float beat,int chords[],int measure)
    { 
        bass(convert(beat),Mode,Key,chords,measure);
    }
    public void bass (dur beat,int chords[],int measure)
    { 
        bass(beat,Mode,Key,chords,measure);
    } 
    public void bass (float beat,int key,int chords[])
    { 
        bass(convert(beat),Mode,key,chords,Measure);
    } 
    public void bass (dur beat,int key,int chords[])
    { 
        bass(beat,Mode,key,chords,Measure);
    } 
    public void bass (float beat,int key,int chords[],int measure)
    { 
        bass(convert(beat),Mode,key,chords,measure);
    } 
    public void bass (dur beat,int key,int chords[],int measure)
    { 
        bass(beat,Mode,key,chords,measure);
    } 
    public void bass (float beat,int Scale,int key,int chords[],int measure)
    { 
        bass(convert(beat),Scale,key,chords,measure);
    }
    public void bass (dur beat,int Scale,int key,int chords[],int measure)
    { 
        convertD(beat) => Tempo;

        modes.modes(Scale) @=> int scale[];
        rhythm.rhythm(measure) @=> float r[];
        
        Scale + 24 => int octave;
        
        while(true)
        {
            for(0 => int i;i < chords.cap(); i++)
            { 
                scale[chords[i]] + (octave + key) @=> basspatern[0];
                scale[chords[i]] + (octave + key) @=> basspatern[1];
                scale[chords[i]] + (octave + key) @=> basspatern[2];
                scale[Math.random2(0,scale.cap() -1 )] + (octave + key) @=> basspatern[3];
                scale[Math.random2(0,scale.cap() -1 )] + (octave + key) @=> basspatern[4];
                
                for(0 => int ii; ii < basspatern.cap(); ii++)
                {
                    Std.mtof(basspatern[ii]) => Bass.freq; 
                    e.keyOn();
                    (beat*r[ii]) => now;
                    e.keyOff();    
                }
            }
        }
    }  
    public void bass(dur beat,string chords[],int measure)
    {
        
    }
    public void techBass ()
    {
        techBass(Tempo,24,Pattern);
    }
    public void techBass (int pattern)
    {
        techBass(Tempo,24,pattern);
    }
    public void techBass (float beat, int pattern)
    {
        techBass(convert(beat),24,pattern);
    }
    public void techBass (dur beat, int pattern)
    {
        techBass(beat,24,pattern);
    }
    public void techBass (float beat,int key, int pattern)
    {
        techBass(convert(beat),24,pattern);
    }
    public void techBass (dur beat,int key, int pattern)
    {
        convertD(beat) => Tempo;
        pattern => Pattern;
        
        (24 + key) => int note;
        (36 + key) => int octave;
        
        if(pattern == 1)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                beat => now;
                e.keyOff();
                beat => now; 
            }
        }
        if(pattern == 2)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                beat => now;
                e.keyOff();
                beat => now;
            }
        }
        if(pattern == 3)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (beat * 0.5) => now;
                e.keyOff();
                (beat * 0.5) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (beat * 0.5) => now;
                e.keyOff();
                (beat * 0.5) => now;
            }
        }
        if(pattern == 4)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (beat * 0.5) => now;
                e.keyOff();
                (beat * 0.5) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (beat * 0.25) => now;
                e.keyOff();
                (beat * 0.25) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (beat * 0.25) => now;
                e.keyOff();
                (beat * 0.25) => now;
            }
        }
        if(pattern == 5)
        {
            while(true)
            {
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (beat * 0.25) => now;
                e.keyOff();
                (beat * 0.25) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (beat * 0.25) => now;
                e.keyOff();
                (beat * 0.25) => now;
                Std.mtof(note) => Bass.freq;
                e.keyOn();
                (beat * 0.25) => now;
                e.keyOff();
                (beat * 0.25) => now;
                Std.mtof(octave) => Bass.freq;
                e.keyOn();
                (beat * 0.25) => now;
                e.keyOff();
                (beat * 0.25) => now;
            }
        }
    }
}