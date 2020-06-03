public class STATIC
{
    0 => static int BEATS;
    0 => static int MEASURES;
    0 => static int PHRASES;
    static int STEP;
    static float TEMPO;

    // Moving all static objects to this class
    static int MEASURE;
    static int CYCLES;

    // Testing Drum (code/midi) control
    static int DRUMMIDI[];
    static int DRUM[];
    0 => static int DRUMTOGGLE;

    0 => static int BD;
    0 => static int SK;
    0 => static int HH;
    0 => static int CP;
    0 => static int MR;
    0 => static int CB;
    0 => static int T;
    0 => static int SN;
}

new int[8] @=>  STATIC.DRUMMIDI;
new int[8] @=>  STATIC.DRUM;

-1 => STATIC.BEATS;
8 => STATIC.STEP;
120 => STATIC.TEMPO;
4 => STATIC.MEASURE;
4 => STATIC.CYCLES;
