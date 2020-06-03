public class Deelay extends Chubgraph {
    
    DelayL delay[10];
    inlet => NRev rev; 
    
    0.3 => rev.mix;
    
    1000 => int Size;
    
    for(0 => int i; i < delay.size(); i ++){
        rev => delay[i] => outlet;
        ((1.0/(i+1))*Size)::ms => delay[i].max => delay[i].delay;
        (1.0/(i+1)) => delay[i].gain;
    }
    
    public int size(int S){
        S => Size;
        for(0 => int i; i < delay.size(); i ++){
            inlet => delay[i] => outlet;
            ((1.0/(i+1))*Size)::ms => delay[i].max => delay[i].delay;
            (1.0/(i+1)) => delay[i].gain;
        }
        
    }
}

