public class Acid extends Chmusick {

SawOsc saw => LPF lowPass => ADSR adsr => Gain g => outlet;

lowPass.Q(8);
g.gain(0.2);

16 => int div;
[0,5,0,3,0,1] @=> int arp[]; // array of MIDI notes
Dur(STATIC.TEMPO,div) => dur duration; // arpeggio rate (main loop)
adsr.set(duration*0.1, duration*0.2, 0.7, duration*0.1); // adsr parameters in accord with duration
48 => int octaveOffset;  // offset to apply to MIDI notes

//----------FUNCTIONS-----------
function void filterSweep(LPF filter, dur t){
    // generate a sweep from 100 to 10000 Hz
    100 => float cutOff;
    50 => int step;
    (9900/step)*2 => float stepNr;
    while(true){
        filter.freq(cutOff);
        cutOff + step => cutOff;
        if(cutOff >= 10000){
            -50 => step;
        }
        else if(cutOff <= 100){
            50 => step;
        }
        t/stepNr => now; // complete a sweep (from 100 to 1000 and the way back) in "t" time
    }
}

/* create a separate thread to generate the filter
   sweep at a different rate from the main loop */
spork ~ filterSweep(lowPass, 10000::ms);

0 => int c; // arp array index


//----------MAIN-----------
public void synth(int notes[],int Div) {
  Div => div;
  Dur(STATIC.TEMPO,div) => dur duration;
while( true ){
    if( c>notes.size()-1 ){
        0 => c;
    }
    Math.random2(0,100) => int randi; // used to change the octave offset
    if(randi > 80){
        // likelihood = 20%
        60 => octaveOffset;
    }
    else{
        // likelihood = 80%
        48 => octaveOffset;
    }
    notes[c]+octaveOffset=> int note; // note from arp array + octave offset
    Std.mtof(note) => saw.freq;

    adsr.keyOn();
    duration*0.8 => now;

    adsr.keyOff();
    duration*0.2 => now;

    1 +=> c; // read next note in the arp array
  }
}
}
