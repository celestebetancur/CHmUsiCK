public class Mixa extends Chmusick {
    Noise ruido => BPF filtro => LPF lpf => Gain amp => Envelope env => Delay delay => JCRev rev => dac;
    SawOsc osc => Gain ampOsc => env => dac;
    SinOsc sin => env => dac;


    500/1 => filtro.Q;
// Mas cuerpo disminuir el (500)/20
    500/20 => amp.gain;


// cambiar por (500)/30 (500)/8 (500)/20
    440/1 => filtro.freq;
    550/16 => lpf.freq;
    1 => float divisor; 
    filtro.freq() => osc.freq;

    120::ms => delay.max => delay.delay;

    0.0 => rev.mix;
    0.08 => ampOsc.gain;
    0.0 => sin.gain;
    
    public void gain (float gainEnv){
         gainEnv => env.gain;
    }
    public void div (float Div){
         Div => divisor;
    }
    public void freq (float lpfFreq){
         lpfFreq => lpf.freq;
    }
    public void synth(int div,int notes[])
    {   
        while(true)
        {
            for(0 => int i; i < notes.cap(); i++)
            {
                if(notes[i] == 0)
                {
                    env.keyOff();
                    Dur(STATIC.TEMPO,div) => now;
                }
                else
                {
                    Std.mtof(notes[i])/divisor => filtro.freq;
                    filtro.freq() => osc.freq;
                    env.keyOn();
                    Dur(STATIC.TEMPO,div) => now;
                }
            }          
        }
    }
}