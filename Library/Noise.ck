Gain gate => Pan2 p => dac;

SndBuf buf => NRev rev  => p;
SndBuf buf1 => rev => p; 

me.dir() + "Samples/rave/1.wav" => buf.read;
me.dir() + "Samples/xmas/1.wav" => buf1.read;

1 => rev.mix;

spork~b();
spork~b1();

while(true){
	Math.random2f(-0.5,0.5) => p.pan;
	.05::second => now;
}
	
fun void b()
{
	for(1 => int i; i < buf.samples(); i ++)
	{
		i => buf.pos;
		25::ms => now;
	}
}

fun void b1()
{
	for(1 => int i; i < buf.samples(); i ++)
	{
		i => buf1.pos;
		ms => now;
	}
}