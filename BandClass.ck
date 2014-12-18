public class Band extends CHmUsiCK
{
    Notes notes;
    
    Pan2 p => Gain vol => Master => outlet;
    
    Drum drum => vol;
    Bass bass => vol;
    Melody melody => vol;
    Harmony harmony => vol;
    FMSynth fm => p.left;
    FMSynth fm1 => p.right;
    
    8 => int Division;
    4 => int Beats;
    "C" => string Key;
    
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
        return Division;
    }
    public string key(string k)
    {
        k => Key;
        return Key;
    }
    public string key()
    {
        return Key;
    }
    public void randomBand()
    {
        randomBand(Beats,Division,notes.randomNote());
    }
    public void randomBand(string key)
    {
        randomBand(Beats,Division,key);
    }
    public void randomBand(int beats)
    {
        randomBand(beats,Division,notes.randomNote());
    }
    public void randomBand(int beats, int div)
    {
        randomBand(beats,div,notes.randomNote());
    }
    public void randomBand(int beats, int div, string key)
    {
        div => Division;
        key => Key;
        
        harmony.random(beats,key) @=> string chords[];
        notes.stodArray(key,chords) @=> int note[];
        
        10::ms => now;
        
        spork~ harmony.sinOsc(chords,4);
        spork~ drum.randomDrum(Division, (beats*2));
        spork~ bass.bass((notes.stom(Key)),note,4);
        spork~ melody.randomMelody((Division * 2),(beats*8),Key);
        spork~ fm.randomFM(Division,(beats*4),Key);
        spork~ fm1.randomFM(Division,(beats*4),Key);
        while(true) 1::second => now;
    }
}