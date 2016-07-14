//
//  Looper.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 10/12/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class Looper extends Chmusick
{
    Gain Normalize;
    LiSa Looper;
    
    0.6 => Normalize.gain;
    
    (convert(TEMPO)*4) => dur Dura; 
    1 => float Rate;
    1 => int Play;
    1 => int Loop;
    0 => int Bi;
    200 => float Ramp;
    1 => float Vol;
    0.5 => float Tracker;
    2 => int Sync;
    2 => int Tgain;
    4 => int Tstep;
    
    public void looper()
    {
        adc => Looper => Normalize => Master => outlet;
        
        Dura => Looper.duration;
        Looper.recRamp( Ramp::ms );
        
        Looper.record( 1 );
        Dura => now;
        Looper.record(0);
        
        Rate => Looper.rate;
        Play => Looper.play;
        Loop => Looper.loop;
        Bi => Looper.bi;
        
        Vol => Looper.gain;
        
        while(true) 1::ms => now;
    }
    public void looper(float beat)
    {
        adc => Looper => Normalize => Master => outlet;
        
        convert(beat) => Looper.duration;
        Looper.recRamp( Ramp::ms );
        
        Looper.record( 1 );
        Dura => now;
        Looper.record(0);
        
        Rate => Looper.rate;
        Play => Looper.play;
        Loop => Looper.loop;
        Bi => Looper.bi;
        
        Vol => Looper.gain;
        
        while(true) 1::ms => now;
    }
    public void looper(string file)
    {
        SndBuf buf;
        Looper => Normalize => Master => outlet;
        
        me.dir() + "/RecordedFiles/" + file + ".wav" => buf.read;
        
        buf.samples() * 1::samp => Looper.duration;
        
        for ( 0 => int i; i < buf.samples(); i++ )
        {
            Looper.valueAt(buf.valueAt(i), i::samp);  
        }
        
        Rate => Looper.rate;
        Bi => Looper.bi;
        
        Play => Looper.play;
        Vol => Looper.gain;
        
        while (true) 1::ms => now; 
    }
    public void madLooper(string file)
    {
        SndBuf buf;
        Looper => Normalize => Master => outlet;
        
        me.dir() + "/RecordedFiles/" + file + ".wav" => buf.read;
        
        buf.samples() * 1::samp => Looper.duration;
        
        for ( 0 => int i; i < buf.samples(); i++ )
        {
            Looper.valueAt(buf.valueAt(i), i::samp);  
        }
        
        Sync => Looper.sync;
        Rate => Looper.rate;
        Bi => Looper.bi;
        
        SinOsc tracker => Looper;
        Step step => Looper;
        
        Tracker => tracker.freq;
        
        Looper.duration() / Tgain::samp => tracker.gain;
        Looper.duration() / Tstep::samp => step.next;
        
        Play => Looper.play;
        Vol => Looper.gain;
        
        while (true) 1::ms => now; 
    }
    public float gain(int vol)
    {
        vol => Vol;
        return Vol;
    }
    public float gain()
    {
        return Vol;
    }
    public dur duration(dur Duration)
    {
        Duration => Dura;
        return Dura;
    }
    public dur duration(float beat)
    {
        convert(beat) => Dura;
        return Dura;
    }
    public dur duration()
    {
        return Dura;
    }
    public float rate(float rate)
    {
        rate => Rate;
        return Rate;
    }
    public float rate()
    {
        return Rate;
    }
    public int play(int play)
    {
        play => Play;
        return Play;
    }
    public int play()
    {
        return Play;
    }
    public int loop(int loop)
    {
        loop => Loop;
        return Loop;
    }
    public int loop()
    {
        return Loop;
    }
    public int bi(int bi)
    {
        bi => Bi;
        return Bi;
    }
    public int bi()
    {
        return Bi;
    }
    public float ramp(int ramp)
    {
        ramp => Ramp;
        return Ramp;
    }
    public float ramp()
    {
        return Ramp;
    }
    public float tracker(float tracker)
    {
        tracker => Tracker;
        return Tracker;
    }
    public float tracker()
    {
        return Tracker;
    }
    public int sync(int s)
    {
        s => Sync;
        return Sync;
    }
    public int sync()
    {
        return Sync;
    }
    public float ratio(int a, int b)
    {
        a => Tgain;
        b => Tstep;
        return a/(b$float);
    }
    public float ratio()
    {
        return Tgain/(Tstep$float);
    }
}