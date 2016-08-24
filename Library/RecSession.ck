//
//  RecSession.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 10/12/14.
//

public class Rec
{
    0.5 => float Vol;
    
    public float gain(float vol)
    {
        vol => Vol;
        return Vol;
    }
    public float gain()
    {
        return Vol;
    }
    public string recDAC(string name)
    {  
        dac => WvOut2 w => blackhole;
        
        // this is the output file name
        me.dir() + "/RecordedFiles/" + name => w.wavFilename;
        
        // print it out
        <<<"file: ", w.filename()>>>;
        
        // any gain you want for the output
        Vol => w.fileGain;
        
        null @=> w;
        
        while( true ) 1::second => now;
    }
    public string recADC(string name)
    {  
        adc => WvOut2 w => blackhole;
        
        // this is the output file name
        me.dir() + "/RecordedFiles/" + name => w.wavFilename;
        
        // print it out
        <<<"file: ", w.filename()>>>;
        
        // any gain you want for the output
        Vol => w.fileGain;
        
        null @=> w;
        
        while( true ) 1::second => now;
    }
}