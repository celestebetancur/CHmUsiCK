public class Chmusick extends Chubgraph {

    "localhost" => string hostname;
    7788 => int port;

    Notes tool;

    8 => int Division;

    public static float tempo(float t)
    {
        t => STATIC.TEMPO;
        return STATIC.TEMPO;
    }
    public static float tempo()
    {
        return STATIC.TEMPO;
    }
    private dur convert(float beat)
    // ftod - beat(float) convertion to dur
    {
        Std.fabs(beat) => beat;

        60/beat => float tempo;
        return tempo::second;
    }
    private dur Dur(float beat, int div)
    {
        Std.abs(div) => div;

        (div / 4.0) => float factor;
        (convert(beat) / factor) => dur tempo;
        return tempo;
    }
    public string file(string name, string letter)
    {
        me.dir() + "Samples/" + name + "/" + letter + ".wav" => string fileName; //Mac/Linux conflict with path
        //"Samples/" + name + "/" + letter + ".wav" => fileName; //Mac/Linux conflict with path
        return fileName;
    }
    public string file(string name, int num)
    {
        me.dir() + "Samples/" + name + "/" + num + ".wav" => string fileName; //Mac/Linux conflict with path
        //"Samples/" + name + "/" + num + ".wav" => fileName; //Mac/Linux conflict with path
        return fileName;
    }
    public string file(string name)
    {
        file(name, 1);
        return file(name, 1);
    }
    public int[] rand(int capacity)
    // randomly fills an array with ones
    {
        int random[capacity];

        for(0 => int i; i < random.cap(); i ++)
        {
            Math.random2(0,1) => random[i];
        }
        return random;
    }
    public int[] subArray(int pattern[], int toCut[])
    // cuts an array pattern
    // Thanx to Santiago Beta
    {
        toCut.size() => int newsize;
        int sub[newsize];

        for(0 => int i; i < newsize; i++)
        {
            if(toCut[i] < pattern.size() && toCut[i] >= 0) {
                pattern[toCut[i]] => sub[i];
            }
            else {
                0 => sub[i];
            }
        }
        return sub;
    }
    public int[] trunc(int pattern[], float howmany)
    // truncates an array pattern by howmany
    {
        (pattern.size() * howmany)$int => int newsize;
        int truncated[newsize];

        for(0 => int i; i < newsize; i++)
        {
            pattern[i] => truncated[i];
        }
        return truncated;
    }
    public int[] trunc(int pattern[], int from, int to)
    // cuts an array from - to // idea: Santiago Beta
    {
        if(from >= 0 && to <= pattern.cap() && from < to)
        {
            int truncated[0];

            for(from => int i; i < to; i++)
            {
                truncated << pattern[i];
            }
            return truncated;
        }
        else
        {
            <<< "something is wrong, check trunc() parameters" >>>;
            return pattern;
        }
    }
    public int[] reverse(int pattern[])
    // reverse an array
    {
        int reversed[0];

        for((pattern.cap()-1) => int i; i >= 0 ; i - 1 => i)
        {
            reversed << pattern[i];
        }
        return reversed;
    }
    public int[] densify(int pattern[])
    // ramdomly add ones to an int array
    {
        int notes[0];

        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0)
            {
                notes << pattern[i];
            }
        }
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] == 0 && maybe)
            {
                notes[Math.random2(0, (notes.cap() - 1))] => pattern[i];
            }
        }
        return pattern;
    }
    public int[] reverse(SndBuf buffer){
      buffer => outlet;
      buffer.samples() => int total;
      while(true){
        total => buffer.pos;
        total--;
        samp => now;
      }
      return int toReturn[0];;
    }
    public int[] density(int pattern[],int times)
    {
        int toReturn[0];

        for(0 => int i; i < times; i++)
        {
            for(0 => int j; j < pattern.size(); j++)
            {
                toReturn << pattern[j];
            }
        }
        return toReturn;
    }
    public int[] degrade(int pattern[])
    // randomly removes non zero events of an int array
    {
        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0 && maybe)
            {
                0 => pattern[i];
            }
        }
        return pattern;
    }
    public int[] every(int parameter)
    // fills an array of parameter size with ones
    {
        int everyArray[parameter];

        if(parameter == 0)
        {
            everyArray << 0;
            return everyArray;
        }
        else
        {
            1 => everyArray[0];

            for(1 => int i; i < everyArray.cap(); i++)
            {
                0 => everyArray[i];
            }
        }
        return everyArray;
    }
    public int[] every(int note, int parameter)
    // fills an array -parameter sized-  with note
    {
        int everyArray[parameter];

        note => everyArray[0];

        for(1 => int i; i < everyArray.cap(); i++)
        {
            0 => everyArray[i];
        }

        return everyArray;
    }
    public int[] randomize(int pattern[])
    //shuffle pattern
    {
        int toReturn[pattern.size()];

        for(pattern.cap()-1 => int i; i > 0; i--)
        {
            Math.random2(0,pattern.size()) % (i+1) => int j;
            pattern[j] => int temp;
            pattern[i] => pattern[j];
            temp => pattern[i];
        }
        return pattern;
    }
    public int[] granularize(int array[], int howmany)
    {
        int granularized[0];

        for(0 => int count; count < array.cap(); count++)
        {
            for(0 => int i; i < howmany; i++)
            {
                granularized << array[count];
            }
        }
        return granularized;
    }
    public int[] transpose(int pattern[], int param)
    // transpose note by param
    {
        int newPattern[pattern.cap()];

        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] == 0){
                0 => newPattern[i];
            } else {
                pattern[i] + param => newPattern[i];
            }
        }
        return newPattern;
    }
    public int[] rotate(int pattern[])
    // rotates int array pattern by one
    {
        int newPattern[pattern.cap()];

        pattern[pattern.cap()-1] => newPattern[0];

        for(0 => int i; i < (pattern.cap()-1); i++)
        {
            pattern[i] => newPattern[i+1];
        }
        return newPattern;
    }
    public int[] rotate(int pattern[], int move)
    // rotates int array pattern by move positions
    {
        int newPattern[pattern.cap()];

        repeat(move)
        {
            rotate(pattern) @=> newPattern;
            newPattern @=> pattern;
        }
        return pattern;
    }
    public int counter(int pattern[])
    // retunrs the number of non zero positions in int array
    {
        0 => int notesOn;

        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0)
            {
                1 +=> notesOn;
            }
        }
        return notesOn;
    }
    public int counter(float pattern[])
    // returns the number of non zero positions in float array
    {
        0 => int notesOn;

        for(0 => int i; i < pattern.cap(); i++)
        {
            if(pattern[i] != 0)
            {
                1 +=> notesOn;
            }
        }
        return notesOn;
    }
    public int[] densify(int pattern[], float parameter)
    //densify or degrade an array with a float parameter as percentage
    {
        int toReturn[pattern.cap()];
        pattern.cap() => float size;

        if(parameter >= 0 && parameter <= 1)
        {
            Std.ftoi(size * parameter) => int toAdd;

            if(counter(pattern) == toAdd) pattern @=> toReturn;

            else
            {
                if(counter(pattern) > toAdd)
                {
                    counter(pattern) - toAdd => int c;

                    while(c > 0)
                    {
                        for(0 => int i; i < pattern.cap(); i++)
                        {
                            if(pattern[i] != 0 && maybe)
                            {
                                0 => pattern[i];
                                1 -=> c;
                            }
                            if(c == 0) break;
                        }
                    }
                    pattern @=> toReturn;
                }
                if(counter(pattern) < toAdd)
                {
                    toAdd - counter(pattern) => int c;

                    while(c > 0)
                    {
                        for(0 => int i; i < pattern.cap(); i++)
                        {
                            if(pattern[i] == 0 && maybe)
                            {
                                1 => pattern[i];
                                1 -=> c;
                            }
                            if(c == 0) break;
                        }
                    }
                    pattern @=> toReturn;
                }
            }
        }
        else
        {
            <<< "Parameter must be a number between 0 and 1">>>;
        }
        return toReturn;
    }
    public int[] palindrome(int pattern[])
    // returns the same patern and the reversed appended
    {
        int toReturn[(pattern.cap()*2)];
        (pattern.cap()*2) -1 => int countDown;

        for(0 => int i; i < pattern.cap(); i++)
        {
            pattern[i] => toReturn[i];
            pattern[i] => toReturn[countDown];
            1 -=> countDown;
        }
        return toReturn;
    }
    public int[] arpegiate(int pattern[], int times)
    {
        int toReturn[pattern.size()*times];
        
        48 => int octave;
        0 => int counter;
        0 => int auxC;
        0 => int tempVar; 
        
        for(0 => int i; i < pattern.size(); i++)
        {
            for(0 => int j; j < times; j++)
            {
                (pattern[counter] + 12 * auxC) + octave => toReturn[tempVar];
                counter + 1 => counter;
                if(counter == pattern.size()){
                    0 => counter;
                    auxC + 1 => auxC;
                }
                tempVar + 1 => tempVar;
            }
        }
        return toReturn;
    }
    public int[] concat(int toConcat[][]){
        int toReturn[0];
        for(0 => int i; i < toConcat.size(); i++){
            for(0 => int j; j < toConcat[i].size(); j++){
                toReturn << toConcat[i][j];
            }
        }
        return toReturn;
    }
    public void grain(SndBuf buf, float duration , int position, float pitch, int randompos, float randpitch)
    { 
        buf => Envelope e => outlet;
        
        2 => e.gain;
        int samples;
        buf.samples() => samples;
        44100*position/1000 => position;
        44100*randompos/1000 => randompos;
        
        duration*Std.rand2f(0.45,0.5)::ms => e.duration;
        float freq;
        
        while(true){
            Std.rand2f(pitch-randpitch,pitch+randpitch) => buf.rate;
            Std.rand2(position-randompos,position+randompos) => buf.pos;
            e.keyOn();
            (duration*0.5)::ms => now;
            e.keyOff();
            (duration*0.5)::ms => now;
        }
    }
    public void play(SndBuf buffer)
    {
        buffer => Envelope envelope => outlet;
        while(true)
        {
            envelope.keyOn();
            0 => buffer.pos;
            buffer.samples()::samp => now;
        }
    }
    public void play(SndBuf buffer, float start)
    {
        if(start >= 0 && start <= 1){
            buffer => Envelope envelope => outlet;
            (start*buffer.samples())$int => int Start;
            while(true)
            {
                envelope.keyOn();
                Start => buffer.pos;
                (buffer.samples()-Start)::samp => now;
            }
        } else{
            <<< "Start must be a number between 0 and 1" >>>;
        }
    }
    public void play(SndBuf buffer, float start, float end)
    {
        if(start >= 0 && start <= 1 && end >= 0 && end <= 1){
          if(start < end){
            buffer => Envelope envelope => outlet;
            (start*buffer.samples())$int => int Start;
            (end*buffer.samples())$int => int temp;
            temp-Start => int End;
            while(true)
            {
                envelope.keyOn();
                Start => buffer.pos;
                End::samp => now;
            }
          }
        } else{
            <<< "Start and End must be numbers between 0 and 1" >>>;
        }
    }
    public MidiMsg msgMidi(int command, int channel, int byte1, int byte2)
    {
        MidiMsg msg;
        ((command & 0xf) << 4) | ((channel - 1) & 0xf) => msg.data1;
        command | channel => command;
        byte1 & 0x7f  => msg.data2;
        byte2 & 0x7f => msg.data3;
        return msg;  
    }
    public void play(MidiOut mout, int note[],int div, int channel)
    {
            while(true)
            {
                for(0 => int i; i < note.cap(); i++)
                {
                    if (note[i] != 0)
                    {
                        mout.send(msgMidi(0x9,channel,note[i],127));
                        Dur(STATIC.TEMPO,div)/2 => now;
                        mout.send(msgMidi(0x8,channel,note[i],0));
                        Dur(STATIC.TEMPO,div)/2 => now;
                    }
                    if (note[i] == 0)
                    {
                        Dur(STATIC.TEMPO,div) => now;
                    }
                }
            }
    }

    public void play(SndBuf buffer, int sample[], int mode)
    {
        buffer => Envelope envelope => outlet;

        if(mode == 0){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] == 1)
                    {
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                    if (sample[i] == 0)
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                }
            }
        }
        if(mode == 1){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO/2,Division)/sample.cap() => now;
                    }
                    else
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO/2,Division)/sample.cap() => now;
                    }

                }
            }
        }
        if(mode == 2){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }
                    else
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }

                }
            }
        }
        if(mode == 3){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                    else
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }

                }
            }
        }
    }

    public void play(SndBuf buffer, int sample[]){
        play(buffer, sample,0);
    }
    public void play(FMSynth fm, int sample[], int mode)
    {
        fm => outlet;

        if(mode == 0){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        fm.gain(1);
                        fm.noteOn();
                        Buffer.osc.dest( hostname, port );
                        "/" + tool.mtos(sample[i]) => string tag;
                        Buffer.osc.start( tag );
                        1 => Buffer.osc.add;
                        Buffer.osc.send();
                        Std.mtof(sample[i]) => fm.freq;
                        Dur(STATIC.TEMPO,Division)/2 => now;
                        fm.noteOff();
                        Buffer.osc.dest( hostname, port );
                        Buffer.osc.start( tag );
                        0 => Buffer.osc.add;
                        Buffer.osc.send();
                        Dur(STATIC.TEMPO,Division)/2 => now;
                    }
                    if (sample[i] == 0)
                    {
                        //envelope.keyOff();
                        fm.gain(0);
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                }
            }
        }
        if(mode == 1){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        fm.noteOn();
                        Buffer.osc.dest( hostname, port );
                        "/" + tool.mtos(sample[i]) => string tag;
                        Buffer.osc.start( tag );
                        1 => Buffer.osc.add;
                        Buffer.osc.send();
                        Std.mtof(sample[i]) => fm.freq;
                        Dur(STATIC.TEMPO/2,Division)/sample.cap()/2 => now;
                        fm.noteOff();
                        Buffer.osc.dest( hostname, port );
                        Buffer.osc.start( tag );
                        0 => Buffer.osc.add;
                        Buffer.osc.send();
                        Dur(STATIC.TEMPO/2,Division)/sample.cap()/2 => now;
                    }
                    if (sample[i] == 0)
                    {
                        fm.noteOff();
                        Dur(STATIC.TEMPO/2,Division)/sample.cap() => now;
                    }
                }
            }
        }
        if(mode == 2){

            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        fm.noteOn();
                        Std.mtof(sample[i]) => fm.freq;
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }
                    if (sample[i] == 0)
                    {
                        fm.noteOff();
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }
                }
            }
        }
        if(mode == 3){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        fm.noteOn();
                        Std.mtof(sample[i]) => fm.freq;
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                    else
                    {
                        fm.noteOff();
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                }
            }
        }
    }
    public void play(FMSynth fm, int trigger[]){
        play(fm, trigger,0);
    }
    public void play(Osc osc, int sample[], int mode)
    {
        osc => ADSR env => outlet;
        env.set(10::ms, 8::ms, 0.5, 5::ms);
        //osc.gain(0);

        if(mode == 0){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] == 0)
                    {
                        env.keyOff();
                        Dur(STATIC.TEMPO,Division) => now;
                    } else {
                        0.85 => osc.gain;
                        env.keyOn();
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO,Division)/2 => now;
                        env.keyOff();
                        Dur(STATIC.TEMPO,Division)/2 => now;
                    }
                }
            }
        }
        if(mode == 1){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        env.keyOn();
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO/2,Division)/sample.cap()/2 => now;
                        env.keyOff();
                        Dur(STATIC.TEMPO/2,Division)/sample.cap()/2 => now;
                    }
                    if (sample[i] == 0)
                    {
                        env.keyOff();
                        Dur(STATIC.TEMPO/2,Division)/sample.cap() => now;
                    }
                }
            }
        }
        if(mode == 2){

            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        env.keyOn();
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }
                    if (sample[i] == 0)
                    {
                        env.keyOff();
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }
                }
            }
        }
        if(mode == 3){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        env.keyOn();
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                    else
                    {
                        env.keyOff();
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                }
            }
        }
    }
    public void play(Osc osc, int sample[]){
        play(osc, sample,0);
    }
    public void play(StkInstrument osc, int sample[], int mode)
    {
      /*BlowBotl; BandedWG; Wurley; TubeBell; Bowed;
      Rhodey; PercFlut; BlowHole; HevyMetl; ModalBar;
      Flute; Mandolin; Saxofony; Moog; Sitar;
      StifKarp; BeeThree; FMVoices;*/
        osc => Envelope envelope => outlet;

        if(mode == 0){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        envelope.keyOn();
                        1.0 => osc.noteOn;
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                    if (sample[i] == 0)
                    {
                        envelope.keyOff();
                        0.0 => osc.noteOff;
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                }
            }
        }
        if(mode == 1){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        envelope.keyOn();
                        1.0 => osc.noteOn;
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO/2,Division)/sample.cap() => now;
                    }
                    else
                    {
                        envelope.keyOff();
                        0.0 => osc.noteOff;
                        Dur(STATIC.TEMPO/2,Division)/sample.cap() => now;
                    }
                }
            }
        }

        if(mode == 2){

            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        envelope.keyOn();
                        1.0 => osc.noteOn;
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }


                    if (sample[i] == 0)
                    {
                        envelope.keyOff();
                        0.0 => osc.noteOff;
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }
                }
            }
        }
        if(mode == 3){
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != 0)
                    {
                        envelope.keyOn();
                        1.0 => osc.noteOn;
                        Std.mtof(sample[i]) => osc.freq;
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                    else
                    {
                        envelope.keyOff();
                        0.0 => osc.noteOff;
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                }
            }
        }
    }
    public void play(StkInstrument osc, int sample[]){
        play(osc, sample,0);
    }
    public void play(SndBuf buffer, string sample[], int mode)
    {
        buffer => Envelope envelope => outlet;
        if(mode == 0)
        {
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != "~")
                    {
                        file(sample[i]) => buffer.read;
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division) => now;
                    }


                    if (sample[i] == "~")
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                }
            }
        }
        if(mode == 1)
        {
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != "~")
                    {
                        file(sample[i]) => buffer.read;
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division)/sample.cap() => now;
                    }
                    if (sample[i] == "~")
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division)/sample.cap() => now;
                    }
                }
            }
        }
        if(mode == 2)
        {
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != "~")
                    {
                        file(sample[i]) => buffer.read;
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }


                    if (sample[i] == "~")
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division)/STATIC.MEASURE => now;
                    }
                }
            }
        }
        if(mode == 3)
        {
            while(true)
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] != "~")
                    {
                        file(sample[i]) => buffer.read;
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                    else
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division)*STATIC.CYCLES/STATIC.MEASURE => now;
                    }
                }
            }
        }
    }
    public void play(SndBuf buffer, string sample[]){
        play(buffer,sample,0);
    }
    public void playF(SndBuf buffer, int sample[], int mode)
    {
        buffer => Envelope envelope => outlet;
        0 => int count;
        if(mode > 0)
        {
            while(count < (mode-1))
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] == 1)
                    {
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                    if (sample[i] == 0)
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                }
                count + 1 => count;
            }
            if(count == (mode-1)) {
                0 => count;
                play(buffer,rand(sample.cap()));
            }
        }
    }
    public void playF(SndBuf buffer, int sample[]){
        play(buffer,sample,8);
    }
    public void playC(SndBuf buffer, int sample[], int mode)
    {
        buffer => Envelope envelope => outlet;
        0 => int count;
        if(mode > 0)
        {
            while(count < (mode-1))
            {
                for(0 => int i; i < sample.cap(); i++)
                {
                    if (sample[i] == 1)
                    {
                        envelope.keyOn();
                        0 => buffer.pos;
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                    if (sample[i] == 0)
                    {
                        envelope.keyOff();
                        Dur(STATIC.TEMPO,Division) => now;
                    }
                }
                count + 1 => count;
            }
            if(count == (mode-1)) {
                0 => count;
                int temp[sample.cap()];
                play(buffer,temp);
            }
        }
    }
    public void playC(SndBuf buffer, int sample[]){
        play(buffer,sample,8);
    }
    /*public void RB(SndBuf buf, float init, float end){

        Std.system("python samples.py"); //write txt file with samples folder

        FileIO fio;
        fio.open( filename, FileIO.READ );
        if( !fio.good() )
        {
            cherr <= "can't open file: " <= filename <= " for reading..." <= IO.nl();
            me.exit();
        }
        string str;
        while( fio => str )
        {
            chout <= str <= IO.newline();
        }

        spork~play(buf,init,end);
        while(true){
            Math.random2(0,3) => int folder;
            Math.random2(1,6) => int sound;
            string F;
            if(folder == 0) "ab" => F;
            if(folder == 1) "ade" => F;
            if(folder == 2) "ades2" => F;
            if(folder == 3) "arpy" => F;
            file(F,sound) => buf.read;
            (end-init)::second => now;
        }
    }*/
    public void touchOSC(){
      8001 => Buffer.oscIn.port;
      Buffer.oscIn.listenAll();
      while(true){
          Buffer.oscIn => now;
          while ( Buffer.oscIn.recv(Buffer.msg) != 0 )
          {
              if(Buffer.msg.address == "/2/multitoggle/1/1"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[0];
              }
              if(Buffer.msg.address == "/2/multitoggle/1/2"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[1];
              }
              if(Buffer.msg.address == "/2/multitoggle/1/3"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[2];
              }
              if(Buffer.msg.address == "/2/multitoggle/1/4"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[3];
              }
              if(Buffer.msg.address == "/2/multitoggle/1/5"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[4];
              }
              if(Buffer.msg.address == "/2/multitoggle/1/6"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[5];
              }
              if(Buffer.msg.address == "/2/multitoggle/1/7"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[6];
              }
              if(Buffer.msg.address == "/2/multitoggle/1/8"){
                  Buffer.msg.getFloat(0)$int => Buffer.KICK[7];
              }
          }
        }
    }
}
