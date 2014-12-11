public class Audio extends CHmUsiCK
{
    JCRev reverb;
    Delay delaY;
    
    inlet => delaY => reverb => outlet;
    
    800::samp => dur dDelay; 
    dDelay => delaY.delay;
    
    0.22 => float Mix;
    Mix => reverb.mix;
    
    public float mix(float mix)
    {
        mix => Mix;
        Mix => reverb.mix;
        return Mix;
    }
    public float mix()
    {
        return reverb.mix();
    }
    public dur delay(dur delay)
    {
        delay => dDelay;
        dDelay => delaY.delay;
        return delay;
    }
    public dur delay()
    {
        return delaY.delay();
    }
}