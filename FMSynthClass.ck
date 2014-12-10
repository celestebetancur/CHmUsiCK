//
//  FMSynth.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//


public class FMSynth extends CHmUsiCK
{
    SinOsc modulator=> SinOsc carrier => ADSR envelope => Master => outlet;
    
    SinOsc carrier2;
    8 => float C2f;
    carrier.freq() * C2f => carrier2.freq;
    2 => carrier2.sync;
    
    SinOsc modulator2;
    0.2 => float M2f;
    carrier.freq() * M2f => modulator2.freq; 
    2 => modulator2.gain;
    
    0.7 => carrier.gain;
    
    2 => carrier.sync;
    10000 => modulator.gain;
    
    3 => float NUM;
    2 => float DEN;
    
    (NUM/DEN) => float mf;
    carrier.freq() * mf => modulator.freq;
    
    10::ms => dur A;
    8::ms => dur D;
    0.5 => float S;
    5::ms => dur R;
    
    envelope.set(A, D, S, R);
    
    OverallTempo => float Tempo;
    OverallDivision => int Division;
    
    int Notes[0];
    
    public float tempo(float t)
    {
        t => Tempo;
        return Tempo;
    }
    public float tempo()
    {
        return tempo(Tempo);
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
    public int[] setNotes(int notes[])
    {
        notes @=> Notes;
        return Notes; 
    }
    public int[] setNotes()
    {
        return Notes;
    }
    public dur attack(dur attacK)
    {
        attacK => A;
        return A;
    }
    public dur attack()
    {
        return attack(A);
    }
    public dur decay(dur decaY)
    {
        decaY => D;
        return D;
    }
    public dur decay()
    {
        return decay(D);
    }
    public float sustain(float sustaiN)
    {
        sustaiN => S;
        return S;
    }
    public float sustain()
    {
        return sustain(S);
    }
    public dur release(dur releasE)
    {
        releasE => R;
        return R;
    }
    public dur release()
    {
        return release(R);
    }
    public int sync(int mode)
    {
        mode => carrier.sync;
        return mode;
    }
    public int sync()
    {
        return carrier.sync();
    }
    public float mfreq(float mf)
    {
        mf => modulator.freq;
        return mf;
    }
    public float mfreq()
    {
        return modulator.freq();
    }
    public float mgain(float mg)
    {
        (mg * 10000) => modulator.gain;
        return modulator.gain();
    }
    public float mgain()
    {
        return modulator.gain();
    }
    public float cfreq(float cf)
    {
        cf => carrier.freq;
        return carrier.freq();
    }
    public float cfreq()
    {
        return carrier.freq();
    }
    public float gain(float cg)
    {
        cg => carrier.gain;
        return carrier.gain();
    }
    public float gain()
    {
        return carrier.gain();
    }
    public float ratio(float num, float den)
    {
        num => NUM;
        den => DEN;
        (num/den) => mf;
        return mf;
    }
    public float ratio()
    {
        return mf;
    }
    public int[] random(int capacity)
    {
        int notes[capacity];
        
        Notes harmony;
        harmony.voicing(harmony.randomNote())[Math.random2(0,12)] @=> int note;
        
        for(0 => int i; i < notes.cap(); i++)
        {
            if(Math.random2(0,1) == 0)
            {
                (note - 24) => notes[i];
            }
            else
            {
                0 => notes[i];
            }
        }
        return notes;
    }
    public int[] random(string key, int capacity)
    {
        int notes[capacity];
        
        Notes harmony;
        harmony.voicing(key)[Math.random2(0,12)] @=> int note;

        for(0 => int i; i < notes.cap(); i++)
        {
            if(Math.random2(0,1) == 0)
            {
                (note - 24) => notes[i];
            }
            else
            {
                0 => notes[i];
            }
        }
        return notes;
    }
    private dur Dur(dur beat, int div)
    {
        (div / 4) => float factor;
        (beat / factor) => dur tempo;
        return tempo;
    }
    private dur convert(float beat)
    {
        60/beat => float tempo;
        return tempo::second;
    }
    private float convertD(dur beat)
    {
        ((60::second/beat)$float) => float tempo;
        return tempo;
    }
    public int c2sync(int mode)
    {
        mode => carrier.sync;
        return mode;
    }
    public int c2sync()
    {
        return carrier.sync();
    }
    public float c2freq(float c2f)
    {   
        c2f => C2f;
        return carrier2.freq();
    }
    public float c2freq()
    {
        return carrier2.freq();
    }
    public float c2gain(float c2g)
    {
        c2g => carrier2.gain;
        return carrier2.gain();
    }
    public float c2gain()
    {
        return carrier2.gain();
    }
    public float m2freq(float m2f)
    {
        m2f => M2f;
        return modulator2.freq();
    }
    public float m2freq()
    {
        return modulator2.freq();
    }
    public float m2gain(float m2g)
    {
        m2g * 10000 => modulator2.gain;
        return modulator2.gain();
    }
    public float m2gain()
    {
        return modulator2.gain();
    }
    public string fm()
    {
        modulator=> carrier => envelope => outlet;
        return "fm";
    }
    public string fmC2()
    {
        modulator => carrier2 => envelope => outlet;
        return "Fm double carrier";
    }
    public string fmM2()
    {
        modulator2 => carrier => envelope => outlet;
        return "FM double modulator";
    }
    public void randomFM()
    {
        Math.random2(0,Math.random2(0,64)) => int capacity;
        fmBass(convert(Tempo),Division,random(capacity));
    }
    public void randomFM(int capacity)
    {
        fmBass(convert(Tempo),Division,random(capacity));
    }
    public void randomFM(float beat ,int capacity)
    {
        fmBass(convert(beat),Division,random(capacity));
    }
    public void randomFM(dur beat ,int capacity)
    {
        fmBass(beat,Division,random(capacity));
    }
    public void randomFM(float beat, int div ,int capacity)
    {
        fmBass(convert(beat),Division,random(capacity));
    }
    public void randomFM(dur beat, int div ,int capacity)
    {
        fmBass(beat,div,random(capacity));
    }
    public void randomFM(float beat, int div ,int capacity, string key)
    {
        fmBass(convert(beat),div,random(key,capacity));
    }
    public void randomFM(dur beat, int div ,int capacity, string key)
    {
        fmBass(beat,div,random(key,capacity));
    }
    public void fmBass()
    {
        fmBass(convert(Tempo),Division,Notes);
    }
    public void fmBass(int notes[])
    {
        setNotes(notes);
        fmBass(convert(Tempo),Division,Notes);
    }
    public void fmBass(float beat, int notes[])
    {
        beat => Tempo;
        setNotes(notes);
        fmBass(convert(beat),Division,Notes);
    }
    public void fmBass(dur beat,int notes[])
    {
        convertD(beat) => Tempo;
        setNotes(notes);
        fmBass(beat,Division,Notes);
    }
    public void fmBass(float beat,int div,int notes[])
    {
        beat => Tempo;
        setNotes(notes);
        div => Division;
        fmBass(convert(beat),Division,Notes);
    }
    public void fmBass(dur beat,int div,int notes[])
    {
        convertD(beat) => Tempo;
        setNotes(notes);
        div => Division;
        Dur(beat,div) => dur tempo;
        
        while(true)
        {
            for(0 => int i; i < notes.cap(); i++)
            {
                if(notes[i] == 0)
                {
                    envelope.keyOff();
                    tempo => now;
                }
                else
                {
                    Std.mtof(notes[i]) => carrier.freq;
                    carrier.freq() * mf => modulator.freq;
                    carrier.freq() * C2f => carrier2.freq;
                    carrier.freq() * M2f => modulator2.freq;
                    envelope.keyOn();
                    tempo => now;
                    envelope.keyOff();
                }
            }          
        }
    }
}
