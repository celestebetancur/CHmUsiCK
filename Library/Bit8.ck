// Phone-quality speech, by Perry R. Cook, Summer 2015
// Eight bit quantization

public class Bit8 extends Chubgraph{ 
    
    inlet => Gain inp;
    
    HPF hp; // high-pass filter, low frequency rolloff
    LPF lp[6]; // low-pass filters, high-frequency rolloff
    inp => hp => lp[0]; // first in the chain;
    50 => hp.freq; 1.0 => hp.Q; // set up high-pass section 
    Step outp => outlet; // last in chain
    
    for (int i; i < 5; i++)  { // set all up for same cutoff
        lp[i] => lp[i+1];
        4500 => lp[i].freq;
        1.0 => lp[i].Q;
    }
    lp[5] => blackhole; // have to draw samples through so we can work on them
    3500 => lp[5].freq;
    1.0 => lp[5].Q;
    
    public void convert() {
        while (true)  {
            Std.ftoi(64.0*lp[5].last()) => int temp; // stash in integer
            (temp*1.0) / 128.0 => outp.next;      // then convert back
            samp => now;                       // to do 8-bit quantization
        }
    }
}