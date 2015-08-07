CorpusBuild cb;
FileIO read;

8 => int STEP;

int array[0];

read.open(me.dir() + "KSHHDataBase.txt",FileIO.READ);
int num;

while(read => num)
{
    num <= Std.atoi(IO.newline());
    array << num;
}
read.close();

int drum[0][0];
int DrumFull[0][0][0];

int kick[0];
int snare[0];
int hh[0];

0 => int i; // General counter to get the full lenght of database.

for(i; i < array.cap(); i++)
{
    if(array[i] != 0 && array[i] != 1)
    {
        <<<"wrong entry at: "+ i + " character">>>;
        break;
    }
}

0 => i;

(3*STEP) => int limit;

for(0 => int counter;counter < (array.cap()/limit); counter++)
{    
    while(i < (limit*(counter+1)))
    {
        if((limit*counter) <= i && i < ((limit*counter)+STEP))
        {
            kick << array[i];
            //<<<"k "+array[i]+" "+i>>>;
            i++;
        }
        if((limit*counter)+STEP <= i && i < ((limit*counter)+(STEP*2)))
        {
            snare << array[i];
            //<<<"s "+array[i]+" "+i>>>;
            i++;
        }
        if(((limit*counter)+(STEP*2)) <= i && i < ((limit*counter)+(STEP*3)))
        {
            hh << array[i];
            //<<<"h "+array[i]+" "+i>>>;
            i++;
        }
        [kick,snare,hh] @=> drum;
        DrumFull << drum;
    }
    cb.kick(kick);
    cb.snare(snare);
    cb.HH(hh);
    
    kick.clear();
    snare.clear();
    hh.clear();
}

Secuences s;
s.totalSecuences();

public class Secuences
{
    static int TOTAL;
    
    public void totalSecuences()
    {
        DrumFull.cap() / (3*STEP) => TOTAL;
    }
}