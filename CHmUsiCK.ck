//
// Chmusick.ck
// CHmUsiCK
// Created in 2014 by Esteban Betancur
//
// Medellín - Colombia
//

public class Chmusick extends Chubgraph
//every class that uses CHmUsiCK members must extend this class
{        
    Gain Master => Dyno Processor => outlet;
    
    120 => static float TEMPO; // Change this to the BPM you want to CHmUsiCK!
    convert(TEMPO) => static dur DTEMPO;
    
    4 => int OverallDivision;
    
    4 => static int CYCLES;
    4 => static int MEASURE; 
    
    5001 => static int PORT;
    "127.0.0.1" => string HOST;
    
    1 => static float MASTER;
    
    MASTER => Master.gain;
    
    public string host(string Host) {
        Host => HOST;
        return HOST;
    }
    public string host() {
        return HOST;
    }
    public static int port(int Port) {
        Port => PORT;
        return PORT;
    }
    public static int port() {
        return PORT;
    }
    public static float tempo(float t)
    {
        t => TEMPO;
        return TEMPO;
    }
    public float tempoD(dur t)
    {
        convertD(t) => TEMPO;
        return TEMPO;
    }
    public static float tempo()
    {
        return TEMPO;
    }
    public int overallDivision(int div)
    {
        div  => OverallDivision;
        return OverallDivision;
    }
    public int overallDivision()
    {
        return OverallDivision;
    }
    public static int measure(int m)
    {
        m => MEASURE;
        return MEASURE;
    }
    public static int measure()
    {
        return MEASURE;
    }
    public static int cycles(int c)
    {
        c => CYCLES;
        return CYCLES;
    }
    public static int cycles()
    {
        return CYCLES;
    }
    public static float master(float Mgain)
    {
        Mgain => MASTER;
        return MASTER;
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
    public dur fadeIn(dur d)
    {
        0 => Master.gain;
        
        while(Master.gain() <= 1)
        {
            Master.gain() + 0.01 => Master.gain;
            (d/100) => now;
        }
        return d;
    }
    public dur fadeOut(dur d)
    {
        Master.gain() => Master.gain;
        (Master.gain()*100) => float div;
        
        while(Master.gain() >= 0)
        {
            Master.gain() - 0.01 => Master.gain;
            (d/div) => now;
        }
        0 => Master.gain;
        return d;
    }
    public float accelerate(float limit)
    {
        if(TEMPO < limit)
        {
            while(TEMPO < limit)
            {
                TEMPO + 0.1 => TEMPO;
                convert(TEMPO) => now;
            }
        }
        else
        { 
            while(TEMPO > limit)
            {
                TEMPO - 0.1 => TEMPO;
                convert(TEMPO) => now;
            }
        }
        return limit;
    }
    public int[] melodies(int pos)
    {
        return MelodyArray.Melodies[pos];
    }
	public float[] stress(int capacity, int positions[])
	// randomly fills an array with 0 to 1 float
	{
		float toReturn[capacity];

		for(0 => int i; i < toReturn.cap(); i++)
		{
			0.4 => toReturn[i];
		}
		for(0 => int i; i < positions.cap(); i++)
		{
			1.0 => toReturn[positions[i]];
		}
		return toReturn;
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
    public int[] density(int pattern[], float parameter)
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
//------------- time convertion functions ----------------//
    private dur convert(float beat)
	// ftod - beat(float) convertion to dur
	{
        Std.fabs(beat) => beat;
        
        60/beat => float tempo;
        return tempo::second;
    }
    private float convertD(dur beat)
    {
        ((60::second/beat)$float) => float tempo;
        return tempo;
    }
    private dur Dur(dur beat, int div)
    {
        Std.abs(div) => div;
        
        (div / 4.0) => float factor;
        (beat / factor) => dur tempo;
        return tempo;
    }
}