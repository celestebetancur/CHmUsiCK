//
//  EFXClass.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 10/12/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class EFX extends CHmUsiCK
{     
    Gain Normalize; Gain vol;
    
    0.18 => Normalize.gain; //don't change this
    
    float t;
    
    public float gain(float volum)
    {
        volum => vol.gain;
        return vol.gain();
    }
    public float gain()
    {
        return vol.gain();
    }
    public void bpf(float Dur)
    {
        Noise noise => BPF filter => Normalize => vol => Master => outlet;

        1 => filter.Q;
        
        while( true )
        {
            100 + Std.fabs(Math.sin(t)) * 5000 => filter.freq;
            
            .005 +=> t;
            
            Dur::ms => now;
        }
    }
    public void brf(float fr)
    {
        SqrOsc sq => BRF filter => Normalize => vol => Master => outlet;
        
        fr => sq.freq;

        .25 => filter.Q;

        .5 => filter.gain;
        
        while( true )
        {

            100 + Std.fabs(Math.sin(t)) * 5000 => filter.freq;

            .005 +=> t;

            5::ms => now;
        }
    }
    public void hpf(float Dur)
    {
        Noise noise => HPF filter => Normalize => vol => Master => outlet;

        .5 => filter.gain;
        
        while( true )
        {

            Math.sin(t) * 110 => Std.fabs => Std.mtof => filter.freq;

            .005 +=> t;

            Dur::ms => now;
        }
    }
    public void lpf(float Dur)
    {
        Noise noise => LPF lpf => Normalize => vol => Master => outlet;

        while( true )
        {

            Math.sin(t) * 110 => Std.fabs => Std.mtof => lpf.freq;

            .005 +=> t;

            Dur::ms => now;
        }
    }
    public void rezonZ(float Dur)
    {
        Noise noise => ResonZ filter => Normalize => vol => Master => outlet;

        1 => filter.Q;

        while( true )
        {

            100 + Std.fabs(Math.sin(t)) * 5000 => filter.freq;

            .005 +=> t;

            Dur::ms => now;
        }
    }
    public void rhp(float Dur)
    {
        SqrOsc sq => HPF filter => Normalize => vol => Master => outlet;

        50 => sq.freq;

        10 => filter.Q;

        .5 => filter.gain;

        while( true )
        {

            100 + Std.fabs(Math.sin(t)) * 5000 => filter.freq;

            .005 +=> t;

            Dur::ms => now;
        }
    }
    public void rlp(float Dur)
    {
        SqrOsc sq => LPF filter => Normalize => vol => Master => outlet;
        
        50 => sq.freq;

        10 => filter.Q;

        .5 => filter.gain;

        while( true )
        {
            100 + Std.fabs(Math.sin(t)) * 5000 => filter.freq;

            .005 +=> t;

            Dur::ms => now;
        }
    }
}