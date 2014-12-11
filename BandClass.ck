public class Band extends CHmUsiCK
{
    Notes notes;
    
    Gain vol => Master => outlet;
    
    Drum drum => vol;
    Bass bass => vol;
    Melody melody => vol;
    Harmony harmony => vol;
    FMSynth fm => vol;
    
    8 => int Division;
    OverallTempo => float Tempo;
    4 => int Beats;
    
    public float gain(float volum)
    {
        volum => vol.gain;
        return vol.gain();
    }
    public float gain()
    {
        return vol.gain();
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
    public int subdivision(int div)
    {
        div => Division;
        return Division;
    }
    public int subdivision()
    {
        return subdivision(Division);
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
    public void randomBand()
    {
        randomBand(convert(Tempo),Beats,Division,notes.randomNote());
    }
    public void randomBand(string key)
    {
        randomBand(convert(Tempo),Beats,Division,key);
    }
    public void randomBand(float beat)
    {
        randomBand(convert(beat),Beats,Division,notes.randomNote());
    }
    public void randomBand(dur beat)
    {
        randomBand(beat,Beats,Division,notes.randomNote());
    }
    public void randomBand(float beat, int beats)
    {
        randomBand(convert(beat),beats,Division,notes.randomNote());
    }
    public void randomBand(dur beat, int beats)
    {
        randomBand(beat,beats,Division,notes.randomNote());
    }
    public void randomBand(float beat, int beats, int div)
    {
        randomBand(convert(beat),beats,div,notes.randomNote());
    }
    public void randomBand(dur beat, int beats, int div)
    {
        randomBand(beat,beats,div,notes.randomNote());
    }
    public void randomBand(float beat, int beats, int div, string key)
    {
        randomBand(convert(beat),beats,div,key);
    }
    public void randomBand(dur beat, int beats, int div, string key)
    {
        div => Division;
        
        harmony.random(beats,key) @=> string chords[];
        notes.stodArray(key,chords) @=> int note[];
        
        10::ms => now;
        
        spork~ harmony.sinOsc(beat,chords,4);
        spork~ drum.randomDrum(beat,Division, (beats*2));
        spork~ bass.bass(beat,(notes.stom(key)),note,4);
        spork~ melody.randomMelody(beat,(Division * 2),(beats*8),key);
        spork~ fm.randomFM(beat,Division,(beats*4),key);
        while(true) 1::second => now;
    }
}