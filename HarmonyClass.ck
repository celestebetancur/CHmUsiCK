//
//  SynthClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//


public class Harmony extends Chmusick
{  
    Gain Normalize => Gain vol => Master => outlet;
    
    0.035 => Normalize.gain; // don't change this
    
    Notes chords;

    3 => int numVoices;
    
    string Notes[0];

    public float gain(float volum)
    {
        volum => vol.gain;
        return vol.gain();
    }
    public float gain()
    {
        return vol.gain();
    }
    public int voices(int num)
    {
        num => numVoices;
        return numVoices;
    }
    public int voices()
    {
        return voices(numVoices);
    }
    public string[] setNotes(string notes[])
    {
        notes @=> Notes;
        return Notes; 
    }
    public string[] setNotes()
    {
        return Notes;
    }
    public string[] random(int capacity)
    {
        string progression[0];
        
        chords.key(chords.randomNote()) @=> string notes[];
        
        for(0 => int i; i < capacity ; i++)
        {
            progression << notes[Math.random2(0,(notes.cap()-1))];
        }  
        return progression;
    }
    public string[] random(int capacity, string Key)
    {
        string progression[0];
        
        for(0 => int i; i < capacity ; i++)
        {
            progression << chords.key(Key)[Math.random2(0,(chords.key(Key).cap()-1))];
        }  
        return progression;
    }
    public void randomHarmony()
    {
        sinOsc(random(Math.random2(0,16)),numVoices);
    }
    public void randomHarmony(int capacity)
    {
        sinOsc(random(capacity),numVoices);
    }
    public void randomHarmony(int capacity, int voices)
    {
        sinOsc(random(capacity),voices);
    }
    public void randomHarmony(int capacity, string key, int voices)
    {
        sinOsc(random(capacity,key),voices);
    }
    public void sinOsc(string note[])
    {
        sinOsc(note,numVoices);
    }
    public void sinOsc(string note[],int voices)
    {
        voices => numVoices;
        setNotes(note);

        SinOsc polyphony[voices];
        for (0 => int i; i < polyphony.cap(); i++)
        {
            polyphony[i] => Normalize;
        }  
        
        while(true)
        {
            for (0 => int i; i < note.cap(); i++)
            {
                chords.voicing(note[i]) @=> int harmony[];
                 
                for(0 => int i; i < polyphony.cap(); i++)
                {
                    Std.mtof(harmony[i]) => polyphony[i].freq;                
                }
                (convert(TEMPO) * MEASURE) => now;  
            }
        }
    }
    public void sqrOsc(string note[])
    {
        sqrOsc(note,numVoices);
    }
    public void sqrOsc(string note[],int voices)
    {
        voices => numVoices;
        setNotes(note);
        
        SqrOsc polyphony[voices];
        for (0 => int i; i < polyphony.cap(); i++)
        {
            polyphony[i] => Normalize;
        }   
        while(true)
        {
            for (0 => int i; i < note.cap(); i++)
            {
                chords.voicing(note[i]) @=> int harmony[];
                 
                for(0 => int i; i < polyphony.cap(); i++)
                {
                    Std.mtof(harmony[i]) => polyphony[i].freq;                
                }
                (convert(TEMPO) * MEASURE) => now;  
            }
        }
    }
    public void triOsc(string note[])
    {
        triOsc(note,numVoices);
    }
    public void triOsc(string note[],int voices)
    {
        voices => numVoices;
        setNotes(note);
        
        TriOsc polyphony[voices];
        for (0 => int i; i < polyphony.cap(); i++)
        {
            polyphony[i] => Normalize;
        }  
        while(true)
        {
            for (0 => int i; i < note.cap(); i++)
            {
                chords.voicing(note[i]) @=> int harmony[];
                   
                for(0 => int i; i < polyphony.cap(); i++)
                {
                    Std.mtof(harmony[i]) => polyphony[i].freq;                
                }
                (convert(TEMPO) * MEASURE) => now;  
            }
        }
    }
    public void sawOsc(string note[])
    {
        sawOsc(note,numVoices);
    }
    public void sawOsc(string note[],int voices)
    {
        voices => numVoices;
        setNotes(note);
        
        SawOsc polyphony[voices];
        for (0 => int i; i < polyphony.cap(); i++)
        {
            polyphony[i] => Normalize;
        }  
        while(true)
        {
            for (0 => int i; i < note.cap(); i++)
            {
                chords.voicing(note[i]) @=> int harmony[];
                   
                for(0 => int i; i < polyphony.cap(); i++)
                {
                    Std.mtof(harmony[i]) => polyphony[i].freq;                
                }
                (convert(TEMPO) * MEASURE) => now;  
            }
        }
    }
    public void pulseOsc(string note[])
    {
        pulseOsc(note,numVoices);
    }
    public void pulseOsc(string note[],int voices)
    {
        voices => numVoices;
        setNotes(note);
        
        PulseOsc polyphony[voices];
        for (0 => int i; i < polyphony.cap(); i++)
        {
            polyphony[i] => Normalize;
        }
        while(true)
        {
            for (0 => int i; i < note.cap(); i++)
            {
                chords.voicing(note[i]) @=> int harmony[];
                   
                for(0 => int i; i < polyphony.cap(); i++)
                {
                    Std.mtof(harmony[i]) => polyphony[i].freq;                
                }
                (convert(TEMPO) * MEASURE) => now;  
            }
        }
    }
}