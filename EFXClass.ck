public class EFX extends CHmUsiCK
{     
    Gain Normalize;
    
    0.25 => Normalize.gain; //don't change this
    
    float t;
    
    public void bpf(float Dur)
    {
        Noise noise => BPF filter => Normalize => Master => outlet;

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
        SqrOsc sq => BRF filter => Normalize => Master => outlet;
        
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
        Noise noise => HPF filter => Normalize => Master => outlet;

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
        Noise noise => LPF lpf => Normalize => Master => outlet;

        while( true )
        {

            Math.sin(t) * 110 => Std.fabs => Std.mtof => lpf.freq;

            .005 +=> t;

            Dur::ms => now;
        }
    }
    public void rezonZ(float Dur)
    {
        Noise noise => ResonZ filter => Normalize => Master => outlet;

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
        SqrOsc sq => HPF filter => Normalize => Master => outlet;

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
        SqrOsc sq => LPF filter => Normalize => Master => outlet;
        
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