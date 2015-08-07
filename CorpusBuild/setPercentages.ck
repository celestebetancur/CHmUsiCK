CorpusBuild cb;

int Kick[cb.STEPS];
int Snare[cb.STEPS];
int HiHat[cb.STEPS];

Kick.clear();
Snare.clear();
HiHat.clear();

FileIO kickTxt;
FileIO snareTxt;
FileIO hhTxt;

kickTxt.open(me.dir() + "Kick.txt",FileIO.READ);

int num;

while(kickTxt => num)
{
    num <= Std.atoi(IO.newline());
    Kick << num;
}
kickTxt.close();

snareTxt.open(me.dir() + "Snare.txt",FileIO.READ);

while(snareTxt => num)
{
    num <= Std.atoi(IO.newline());
    Snare << num;
}
snareTxt.close();

hhTxt.open(me.dir() + "HH.txt",FileIO.READ);

while(hhTxt => num)
{
    num <= Std.atoi(IO.newline());
    HiHat << num;
}
hhTxt.close();

second => now;
calculePercentage(Kick) @=> float KICK[];
calculePercentage(Snare) @=> float SNARE[];
calculePercentage(HiHat) @=> float HIHAT[];
second => now;

Array.CORPUSKICK.clear();
Array.CORPUSSNARE.clear();
Array.CORPUSHIHAT.clear();

for(0 => int i; i < KICK.cap(); i++)
{
    Array.CORPUSKICK << cb.percentChange(KICK[i]);
    Array.CORPUSSNARE << cb.percentChange(SNARE[i]);
    Array.CORPUSHIHAT << cb.percentChange(HIHAT[i]);
}

public float[] calculePercentage(int toCalculate[])
{
    float decisionArray[0];
    
    for(0 => int i; i < toCalculate.cap(); i++)
    {
        toCalculate[i] => float num;
        (num / Secuences.TOTAL) => float toAppend;
        decisionArray << toAppend;
    }
    return decisionArray;
}

 



