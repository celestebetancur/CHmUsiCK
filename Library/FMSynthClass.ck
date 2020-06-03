//
//  FMSynth.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 18/10/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//


public class FMSynth extends Chubgraph
{

    SinOsc modulator => ADSR envelope => SinOsc carrier => Envelope env => Gain Normalize => outlet;

    0.15 => Normalize.gain; //don't change this

    2 => carrier.sync;
    1000 => modulator.gain;

    3 => float NUM;
    2 => float DEN;

    (NUM/DEN) => float Ratio;

    10::ms => dur A;
    8::ms => dur D;
    0.5 => float S;
    5::ms => dur R;

    envelope.set(A, D, S, R);

    8 => int Division;

    [60,0,0,0] @=> int Notes[];

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
        mg => modulator.gain;
        return modulator.gain();
    }
    public float mgain()
    {
        return modulator.gain();
    }
    public float freq(float cf)
    {
        cf => carrier.freq;
        carrier.freq() * Ratio => modulator.freq;
        return carrier.freq();
    }
    public float freq()
    {
        return carrier.freq();
    }
    public float gain(float cg)
    {
        cg => env.gain;
        return env.gain();
    }
    public float gain()
    {
        return carrier.gain();
    }
    public float ratio(float num, float den)
    {
        num => NUM;
        den => DEN;
        (num/den) => Ratio;
        return Ratio;
    }
    public float ratio()
    {
        return Ratio;
    }
    public void noteOn(){
        envelope.keyOn();
        env.keyOn();
    }
    public void noteOff(){
        envelope.keyOff();
        env.keyOff();
    }
}
