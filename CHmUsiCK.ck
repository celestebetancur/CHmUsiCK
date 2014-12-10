public class CHmUsiCK extends Chubgraph
{
    Gain Master => Dyno Processor => outlet;
    
    120 => float OverallTempo;
    8 => int OverallDivision;
    
    public float master(float Mgain)
    {
        Mgain => Master.gain;
        return Mgain;
    }
    public float master()
    {
        return Master.gain();
    }
    public void limit()
    {
        Processor.limit();
    }
    public void compress()
    {
        Processor.compress();
    }
    public void expand()
    {
        Processor.expand();
    }
    public void gate()
    {
        Processor.gate();
    }
    public void duck()
    {
        Processor.duck();
    }
}