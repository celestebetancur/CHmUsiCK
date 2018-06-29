public class Buffer extends Chubgraph{

    new SndBuf @=> static SndBuf @ d1;
    new SndBuf @=> static SndBuf @ d2;
    new SndBuf @=> static SndBuf @ d3;
    new SndBuf @=> static SndBuf @ d4;
    new SndBuf @=> static SndBuf @ d5;
    new SndBuf @=> static SndBuf @ d6;
    new SndBuf @=> static SndBuf @ d7;
    new SndBuf @=> static SndBuf @ d8;
    new SndBuf @=> static SndBuf @ d9;
    new SndBuf @=> static SndBuf @ d10;
    new SndBuf @=> static SndBuf @ d11;
    new SndBuf @=> static SndBuf @ d12;
    new SndBuf @=> static SndBuf @ d13;
    new SndBuf @=> static SndBuf @ d14;
    new SndBuf @=> static SndBuf @ d15;
    new SndBuf @=> static SndBuf @ d16;
    new OscOut @=> static OscOut @ osc;
    new OscIn @=> static OscIn @ oscIn;
    new OscMsg @=> static OscMsg @ msg;
    static int KICK[];

    d1 => outlet;
    d2 => outlet;
    d3 => outlet;
    d4 => outlet;
    d5 => outlet;
    d6 => outlet;
    d7 => outlet;
    d8 => outlet;
    d9 => outlet;
    d10 => outlet;
    d11 => outlet;
    d12 => outlet;
    d13 => outlet;
    d14 => outlet;
    d15 => outlet;
    d16 => outlet;
}

[0,0,0,0,0,0,0,0] @=> Buffer.KICK;
