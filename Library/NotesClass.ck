//
//  HarmonyClass.ck
//  CHmUsiCK
//
//  Created by Celeste Betancur on 18/10/14.
//


public class Notes
{
    public string[] allNotes()
    {
        ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"] @=> string allNotes[];
        return allNotes;
    }
    private string[][] AllNotes()
    {
        [["C","c","do","Do","DO"],["C#","c#","do#","Do#","DO#","Db","db","reb","Reb","REb"],
         ["D","d","re","Re","RE"],["D#","d#","re#","Re#","RE#","Eb","eb","mib","Mib","MIb"],
         ["E","e","mi","Mi","MI"],["F","f","fa","Fa","FA"],
         ["F#","f#","fa#","Fa#","FA#","Gb","gb","Solb","solb","SOLb"],["G","g","Sol","sol","SOL"],
         ["G#","g#","Sol#","sol#","SOL#","Ab","ab","lab","Lab","LAb"],["A","a","la","La","LA"],
         ["A#","a#","la#","La#","LA#","Bb","bb","sib","Sib","SIb"],["B","b","si","Si","SI"]] @=> string AllNotes[][];
        return AllNotes;
    }
    public string randomNote()
    {
        allNotes() @=> string all[];
        return all[Math.random2(0,(all.cap()-1))];
    }
    public string ftos(float freq) // frecuency to string notation
    {
        return mtos((Std.ftom(freq)$int));
    }
    public float stof(string note, int octave) // string notation to frecuency
    {
        octave * 12 => int factor;
        return Std.mtof(stom(note) + factor);
    }
    public int stom(string notes) //string notation to midi note
    {
        for(0 => int i; i < AllNotes().cap(); i++ )
        {
            for(0 => int ii; ii < AllNotes()[i].cap(); ii++ )
            {
                if(AllNotes()[i][ii] == notes)
                {
                    return i;
                }
            }
        }
        return -1;
    }
    public int stom(string notes, int octave)
    {
        stom(notes) + (octave*12) => int converted;
        return converted;
    }
    public string mtos(int notes) // midi note to string notation
    {
        if(notes < 12)
        {
            return AllNotes()[notes][0];
        }
        if(notes >= 12)
        {
            notes % 12 => int pos;
            return AllNotes()[pos][0];
        }
        return "";
    }
    public float[] mtofArray(int notes[])
    {
        float converted[0];

        for(0 => int i; i < notes.cap(); i++ )
        {
            converted << Std.mtof(notes[i]);
        }
        return converted;
    }
    public int[] stodArray(string Key, string notes[]) //string to degree
    {
        int converted[0];

        for(0 => int i; i < notes.cap(); i++ )
        {
            for(0 => int ii; ii < key(Key).cap(); ii++ )
            {
                if(notes[i] == key(Key)[ii])
                {
                    converted << ii;
                }
            }
        }
        return converted;
    }
    public int[] stomArray(string notes[])
    {
        int converted[0];

        for(0 => int i; i < notes.cap(); i++ )
        {
            converted << stom(notes[i]);
        }
        return converted;
    }
    public string[] mtosArray(int notes[])
    {
        string converted[0];

        for(0 => int i; i < notes.cap(); i++ )
        {
            converted << mtos(notes[i]);
        }
        return converted;
    }
    public int[] voicing(string note)
    {
        int chords[];

        if(note == "A" || note == "a" || note == "la" || note == "La")
        {
            [61,69,64,68,81,73,86,93,83,80,85,88,0] @=> chords;
        }
        if(note == "A#" || note == "a#" || note == "la#" || note == "La#" || note == "Bb" || note == "bb" || note == "sib" || note == "Sib")
        {
            [62,70,65,69,82,74,87,94,84,81,86,89,0] @=> chords;
        }
        if(note == "B" || note == "b" || note == "si" || note == "Si")
        {
            [63,71,66,70,83,75,88,95,85,82,87,90,0] @=> chords;
        }
        if(note == "C" || note == "c" || note == "do" || note == "Do")
        {
            [60,67,64,71,74,72,76,79,81,96,86,95,0] @=> chords;
        }
        if(note == "C#" || note == "c#" || note == "do#" || note == "Do#" || note == "Db" || note == "db" || note == "reb" || note == "Reb")
        {
            [61,68,65,72,75,73,77,80,82,97,87,96,0] @=> chords; 
        }
        if(note == "D" || note == "d" || note == "re" || note == "Re")
        {
            [62,69,66,73,76,74,78,81,83,98,88,97,0] @=> chords;
        }
        if(note == "D#" || note == "d#" || note == "re#" || note == "Re#" || note == "Eb" || note == "eb" || note == "mib" || note == "Mib")
        {
            [63,70,67,62,75,86,72,79,87,86,89,94,0] @=> chords;
        }
        if(note == "E" || note == "e" || note == "mi" || note == "Mi")
        {
            [64,71,68,63,76,87,73,80,88,87,90,95,0] @=> chords;
        }
        if(note == "F" || note == "f" || note == "fa" || note == "Fa")
        {
            [65,72,69,64,77,88,74,81,89,88,91,96,0] @=> chords;
        }
       if(note == "F#" || note == "f#" || note == "fa#" || note == "Fa#" || note == "Gb" || note == "gb" || note == "solb" || note == "Solb")
        {
            [66,73,70,65,78,89,75,82,90,89,92,97,0] @=> chords;
        }
        if(note == "G" || note == "g" || note == "sol" || note == "Sol")
        {
            [67,71,62,66,86,79,74,83,78,81,76,95,0] @=> chords;
        }
        if(note == "G#" || note == "g#" || note == "sol#" || note == "Sol#" || note == "Ab" || note == "ab" || note == "lab" || note == "Lab")
        {
            [68,72,63,67,87,80,75,84,79,82,77,96,0] @=> chords;
        }
        if(note == "A7" || note == "a7" || note == "la7" || note == "La7")
        {
            [61,69,64,67,81,73,86,93,83,80,89,94,0] @=> chords;
        }
        if(note == "A#7" || note == "a#7" || note == "la#7" || note == "La#7" || note == "Bb7" || note == "bb7" || note == "sib7" || note == "Sib7")
        {
            [62,70,65,68,82,74,87,94,84,81,90,95,0] @=> chords;
        }
        if(note == "B7" || note == "b7" || note == "si7" || note == "Si7")
        {
            [63,71,66,69,83,75,88,95,85,82,91,96,0] @=> chords;
        }
        if(note == "C7" || note == "c7" || note == "do7" || note == "Do7")
        {
            [60,67,64,70,74,72,76,79,81,97,86,95,0] @=> chords;
        }
        if(note == "C#7" || note == "c#7" || note == "do#7" || note == "Do#7" || note == "Db7" || note == "db7" || note == "reb7" || note == "Reb7")
        {
            [61,68,65,71,75,73,77,80,82,98,87,96,0] @=> chords;
        }
        if(note == "D7" || note == "d7" || note == "re7" || note == "Re7")
        {
            [62,69,66,72,76,74,78,81,83,99,88,97,0] @=> chords;
        }
        if(note == "D#7" || note == "d#7" || note == "re#7" || note == "Re#7" || note == "Eb7" || note == "eb7" || note == "mib7" || note == "Mib7")
        {
            [63,70,67,61,75,85,72,79,87,85,89,94,0] @=> chords;
        }
        if(note == "E7" || note == "e7" || note == "mi7" || note == "Mi7")
        {
            [64,71,68,62,76,86,73,80,88,86,90,95,0] @=> chords;
        }
        if(note == "F7" || note == "f7" || note == "fa7" || note == "Fa7")
        {
            [65,72,69,63,77,87,74,81,89,87,91,96,0] @=> chords;
        }
        if(note == "F#7" || note == "f#7" || note == "fa#7" || note == "Fa#7" || note == "Gb7" || note == "gb7" || note == "solb7" || note == "Solb7")
        {
            [66,73,70,64,78,88,75,82,90,88,92,97,0] @=> chords;
        }
        if(note == "G7" || note == "g7" || note == "sol7" || note == "Sol7")
        {
            [67,71,62,65,86,79,74,83,77,81,76,95,0] @=> chords;
        }
        if(note == "G#7" || note == "g#7" || note == "sol#7" || note == "Sol#7" || note == "Ab7" || note == "ab7" || note == "lab7" || note == "Lab7")
        {
            [68,72,63,66,87,80,75,84,78,82,77,96,0] @=> chords;
        }
        if(note == "Am" || note == "am" || note == "lam" || note == "Lam")
        {
            [60,69,64,67,81,72,76,93,83,79,84,88,0] @=> chords;
        }
        if(note == "A#m" || note == "a#m" || note == "la#m" || note == "La#m" || note == "Bbm" || note == "bbm" || note == "sibm" || note == "Sibm")
        {
            [61,70,65,68,82,73,75,94,84,80,85,89,0] @=> chords;
        }
        if(note == "Bm" || note == "bm" || note == "sim" || note == "Sim")
        {
            [62,71,66,69,83,74,76,95,85,81,86,90,0] @=> chords;
        }
        if(note == "Cm" || note == "cm" || note == "dom" || note == "Dom")
        {
            [60,67,63,70,74,72,75,79,80,96,86,94,0] @=> chords;
        }
        if(note == "C#m" || note == "c#m" || note == "do#m" || note == "Do#m" || note == "Dbm" || note == "dbm" || note == "rebm" || note == "Rebm")
        {
            [61,68,64,71,75,73,77,80,81,97,87,95,0] @=> chords;
        }
        if(note == "Dm" || note == "dm" || note == "rem" || note == "Rem")
        {
            [62,69,65,72,76,74,77,81,82,98,89,93,0] @=> chords;
        }
        if(note == "D#m" || note == "d#m" || note == "re#m" || note == "Re#m" || note == "Ebm" || note == "ebm" || note == "mibm" || note == "Mibm")
        {
            [64,70,66,73,77,75,78,82,83,99,90,94,0] @=> chords;
        }
        if(note == "Em" || note == "em" || note == "mim" || note == "Mim")
        {
            [64,71,67,62,76,86,72,79,88,86,90,95,0] @=> chords;
        }
        if(note == "Fm" || note == "fm" || note == "fam" || note == "Fam")
        {
            [65,72,68,63,77,87,73,80,89,87,91,96,0] @=> chords;
        }
        if(note == "F#m" || note == "f#m" || note == "fa#m" || note == "Fa#m" || note == "Gbm" || note == "gbm" || note == "solbm" || note == "Solbm")
        {
            [66,73,69,64,78,88,74,81,90,88,92,97,0] @=> chords;
        }
        if(note == "Gm" || note == "gm" || note == "solm" || note == "Solm")
        {
            [67,70,62,65,86,79,74,82,77,81,75,94,0] @=> chords;
        }
        if(note == "G#m" || note == "g#m" || note == "sol#m" || note == "Sol#m" || note == "Abm" || note == "abm" || note == "labm" || note == "Labm")
        {
            [68,71,63,66,87,80,75,83,78,82,76,95,0] @=> chords;
        }
        return chords;
    }
    public string[] key(string key)
    {
        string scale[];

        if(key == "C" || key == "c" || key == "do" || key == "Do")
        {
            ["C","Dm","Em","F","G7","Am"] @=> scale;
        }
        if(key == "C#" || key == "c#" || key == "do#" || key == "Do#" || key == "Db" || key == "db" || key == "reb" || key == "Reb")
        {
            ["C#","D#m","Fm","F#","G#7","A#m"] @=> scale;
        }
        if(key == "D" || key == "d" || key == "re" || key == "Re")
        {
            ["D","Em","F#m","G","A7","Bm"] @=> scale;
        }
        if(key == "D#" || key == "d#" || key == "re#" || key == "Re#" || key == "Eb" || key == "eb" || key == "mib" || key == "Mib")
        {
            ["Eb","Fm","Gm","Ab","Bb7","Cm"] @=> scale;
        }
        if(key == "E" || key == "e" || key == "mi" || key == "Mi")
        {
            ["E","F#m","G#m","A","B7","C#m"] @=> scale;
        }
        if(key == "F" || key == "f" || key == "fa" || key == "Fa")
        {
            ["F","Gm","Am","Bb","C7","Dm"] @=> scale;
        }
        if(key == "F#" || key == "f#" || key == "fa#" || key == "Fa#" || key == "Gb" || key == "gb" || key == "solb" || key == "Solb")
        {
            ["F#","G#m","A#m","B","C#7","D#m"] @=> scale;
        }
        if(key == "G" || key == "g" || key == "sol" || key == "Sol")
        {
            ["G","Am","Bm","C","D7","Em"] @=> scale;
        }
        if(key == "G#m" || key == "g#m" || key == "sol#m" || key == "Sol#m" || key == "Abm" || key == "abm" || key == "labm" || key == "Labm")
        {
            ["G#","A#m","Cm","C#","D#7","Fm"] @=> scale;
        }
        if(key == "A" || key == "a" || key == "la" || key == "La")
        {
            ["A","Bm","C#m","D","E#","F#m"] @=> scale;
        }
        if(key == "A#" || key == "a#" || key == "la#" || key == "La#" || key == "Bb" || key == "bb" || key == "sib" || key == "Sib")
        {
            ["Bb","Cm","Dm","Eb","F7","Gm"] @=> scale;
        }
        if(key == "B" || key == "b" || key == "si" || key == "Si")
        {
            ["B","C#m","D#m","E","F#7","G#m"] @=> scale;
        }
        return scale;
    }

    public int[] chord(string note)
    {
        int chords[];

        if(note == "A" || note == "a" || note == "la" || note == "La")
        {
            [9,13,16] @=> chords;
            return chords;
        }
        if(note == "A#" || note == "a#" || note == "la#" || note == "La#" || note == "Bb" || note == "bb" || note == "sib" || note == "Sib")
        {
            [10,14,17] @=> chords;
            return chords;
        }
        if(note == "B" || note == "b" || note == "si" || note == "Si")
        {
            [11,15,18] @=> chords;
            return chords;
        }
        if(note == "C" || note == "c" || note == "do" || note == "Do")
        {
            [0,4,7] @=> chords;
            return chords;
        }
        if(note == "C#" || note == "c#" || note == "do#" || note == "Do#" || note == "Db" || note == "db" || note == "reb" || note == "Reb")
        {
            [1,5,8] @=> chords;
            return chords;
        }
        if(note == "D" || note == "d" || note == "re" || note == "Re")
        {
            [2,6,9] @=> chords;
            return chords;
        }
        if(note == "D#" || note == "d#" || note == "re#" || note == "Re#" || note == "Eb" || note == "eb" || note == "mib" || note == "Mib")
        {
            [3,7,10] @=> chords;
            return chords;
        }
        if(note == "E" || note == "e" || note == "mi" || note == "Mi")
        {
            [4,8,11] @=> chords;
            return chords;
        }
        if(note == "F" || note == "f" || note == "fa" || note == "Fa")
        {
            [5,9,12] @=> chords;
            return chords;
        }
       if(note == "F#" || note == "f#" || note == "fa#" || note == "Fa#" || note == "Gb" || note == "gb" || note == "solb" || note == "Solb")
        {
            [6,10,13] @=> chords;
            return chords;
        }
        if(note == "G" || note == "g" || note == "sol" || note == "Sol")
        {
            [7,11,14] @=> chords;
            return chords;
        }
        if(note == "G#" || note == "g#" || note == "sol#" || note == "Sol#" || note == "Ab" || note == "ab" || note == "lab" || note == "Lab")
        {
            [8,12,15] @=> chords;
            return chords;
        }
        if(note == "A7" || note == "a7" || note == "la7" || note == "La7")
        {
            [9,13,16,19] @=> chords;
            return chords;
        }
        if(note == "A#7" || note == "a#7" || note == "la#7" || note == "La#7" || note == "Bb7" || note == "bb7" || note == "sib7" || note == "Sib7")
        {
            [10,14,17,20] @=> chords;
            return chords;
        }
        if(note == "B7" || note == "b7" || note == "si7" || note == "Si7")
        {
            [11,15,18,21] @=> chords;
            return chords;
        }
        if(note == "C7" || note == "c7" || note == "do7" || note == "Do7")
        {
            [0,4,7,10] @=> chords;
            return chords;
        }
        if(note == "C#7" || note == "c#7" || note == "do#7" || note == "Do#7" || note == "Db7" || note == "db7" || note == "reb7" || note == "Reb7")
        {
            [1,5,8,11] @=> chords;
            return chords;
        }
        if(note == "D7" || note == "d7" || note == "re7" || note == "Re7")
        {
            [2,6,9,12] @=> chords;
            return chords;
        }
        if(note == "D#7" || note == "d#7" || note == "re#7" || note == "Re#7" || note == "Eb7" || note == "eb7" || note == "mib7" || note == "Mib7")
        {
            [3,7,10,13] @=> chords;
            return chords;
        }
        if(note == "E7" || note == "e7" || note == "mi7" || note == "Mi7")
        {
            [4,8,11,14] @=> chords;
            return chords;
        }
        if(note == "F7" || note == "f7" || note == "fa7" || note == "Fa7")
        {
            [5,9,12,15] @=> chords;
            return chords;
        }
        if(note == "F#7" || note == "f#7" || note == "fa#7" || note == "Fa#7" || note == "Gb7" || note == "gb7" || note == "solb7" || note == "Solb7")
        {
            [6,10,13,16] @=> chords;
            return chords;
        }
        if(note == "G7" || note == "g7" || note == "sol7" || note == "Sol7")
        {
            [7,11,14,17] @=> chords;
            return chords;
        }
        if(note == "G#7" || note == "g#7" || note == "sol#7" || note == "Sol#7" || note == "Ab7" || note == "ab7" || note == "lab7" || note == "Lab7")
        {
            [8,12,15,18] @=> chords;
            return chords;
        }
        if(note == "Am" || note == "am" || note == "lam" || note == "Lam")
        {
            [9,12,16] @=> chords;
            return chords;
        }
        if(note == "A#m" || note == "a#m" || note == "la#m" || note == "La#m" || note == "Bbm" || note == "bbm" || note == "sibm" || note == "Sibm")
        {
            [10,13,17] @=> chords;
            return chords;
        }
        if(note == "Bm" || note == "bm" || note == "sim" || note == "Sim")
        {
            [11,14,17] @=> chords;
            return chords;
        }
        if(note == "Cm" || note == "cm" || note == "dom" || note == "Dom")
        {
            [0,3,7] @=> chords;
            return chords;
        }
        if(note == "C#m" || note == "c#m" || note == "do#m" || note == "Do#m" || note == "Dbm" || note == "dbm" || note == "rebm" || note == "Rebm")
        {
            [1,4,8] @=> chords;
            return chords;
        }
        if(note == "Dm" || note == "dm" || note == "rem" || note == "Rem")
        {
            [2,5,9] @=> chords;
            return chords;
        }
        if(note == "D#m" || note == "d#m" || note == "re#m" || note == "Re#m" || note == "Ebm" || note == "ebm" || note == "mibm" || note == "Mibm")
        {
            [3,6,10] @=> chords;
            return chords;
        }
        if(note == "Em" || note == "em" || note == "mim" || note == "Mim")
        {
            [4,7,11] @=> chords;
            return chords;
        }
        if(note == "Fm" || note == "fm" || note == "fam" || note == "Fam")
        {
            [5,8,12] @=> chords;
            return chords;
        }
        if(note == "F#m" || note == "f#m" || note == "fa#m" || note == "Fa#m" || note == "Gbm" || note == "gbm" || note == "solbm" || note == "Solbm")
        {
            [6,9,13] @=> chords;
            return chords;
        }
        if(note == "Gm" || note == "gm" || note == "solm" || note == "Solm")
        {
            [7,10,14] @=> chords;
            return chords;
        }
        if(note == "G#m" || note == "g#m" || note == "sol#m" || note == "Sol#m" || note == "Abm" || note == "abm" || note == "labm" || note == "Labm")
        {
            [8,11,15] @=> chords;
            return chords;
        }
        if(note == "Am7" || note == "am7" || note == "lam7" || note == "Lam7")
        {
            [9,12,16,19] @=> chords;
            return chords;
        }
        if(note == "A#m7" || note == "a#m7" || note == "la#m7" || note == "La#m7" || note == "Bbm7" || note == "bbm7" || note == "sibm7" || note == "Sibm7")
        {
            [10,13,17,20] @=> chords;
            return chords;
        }
        if(note == "Bm7" || note == "bm7" || note == "sim7" || note == "Sim7")
        {
            [11,14,18,21] @=> chords;
            return chords;
        }
        if(note == "Cm7" || note == "cm7" || note == "dom7" || note == "Dom7")
        {
            [0,3,7,10] @=> chords;
            return chords;
        }
        if(note == "C#m7" || note == "c#m7" || note == "do#m7" || note == "Do#m7" || note == "Dbm7" || note == "dbm7" || note == "rebm7" || note == "Rebm7")
        {
            [1,4,8,11] @=> chords;
            return chords;
        }
        if(note == "Dm7" || note == "dm7" || note == "rem7" || note == "Rem7")
        {
            [2,5,9,12] @=> chords;
            return chords;
        }
        if(note == "D#m7" || note == "d#m7" || note == "re#m7" || note == "Re#m7" || note == "Ebm7" || note == "ebm7" || note == "mibm7" || note == "Mibm7")
        {
            [3,6,10,13] @=> chords;
            return chords;
        }
        if(note == "Em7" || note == "em7" || note == "mim7" || note == "Mim7")
        {
            [4,7,11,14] @=> chords;
            return chords;
        }
        if(note == "Fm7" || note == "fm7" || note == "fam7" || note == "Fam7")
        {
            [5,8,12,15] @=> chords;
            return chords;
        }
       if(note == "F#m7" || note == "f#m7" || note == "fa#m7" || note == "Fa#m7" || note == "Gbm7" || note == "gbm7" || note == "solbm7" || note == "Solbm7")
        {
            [6,9,13,16] @=> chords;
            return chords;
        }
        if(note == "Gm7" || note == "gm7" || note == "solm7" || note == "Solm7")
        {
            [7,10,14,17] @=> chords;
            return chords;
        }
        if(note == "G#m7" || note == "g#m7" || note == "sol#m7" || note == "Sol#m7" || note == "Abm7" || note == "abm7" || note == "labm7" || note == "Labm7")
        {
            [8,11,15,18] @=> chords;
            return chords;
        }
        if(note == "Amaj7" || note == "amaj7" || note == "lamaj7" || note == "Lamaj7")
        {
            [9,13,16,20] @=> chords;
            return chords;
        }
        if(note == "A#maj7" || note == "a#maj7" || note == "la#maj7" || note == "La#maj7" || note == "Bbmaj7" || note == "bbmaj7" || note == "sibmaj7" || note == "Sibmaj7")
        {
            [10,14,17,21] @=> chords;
            return chords;
        }
        if(note == "Bmaj7" || note == "bmaj7" || note == "simaj7" || note == "Simaj7")
        {
            [11,15,18,22] @=> chords;
            return chords;
        }
        if(note == "Cmaj7" || note == "cmaj7" || note == "domaj7" || note == "Domaj7")
        {
            [0,4,7,11] @=> chords;
            return chords;
        }
        if(note == "C#maj7" || note == "c#maj7" || note == "do#maj7" || note == "Do#maj7" || note == "Dbmaj7" || note == "dbmaj7" || note == "rebmaj7" || note == "Rebmaj7")
        {
            [1,5,8,12] @=> chords;
            return chords;
        }
        if(note == "Dmaj7" || note == "dmaj7" || note == "remaj7" || note == "Remaj7")
        {
            [2,6,9,13] @=> chords;
            return chords;
        }
        if(note == "D#maj7" || note == "d#maj7" || note == "re#maj7" || note == "Re#maj7" || note == "Ebmaj7" || note == "ebmaj7" || note == "mibmaj7" || note == "Mibmaj7")
        {
            [3,7,10,14] @=> chords;
            return chords;
        }
        if(note == "Emaj7" || note == "emaj7" || note == "mimaj7" || note == "Mimaj7")
        {
            [4,8,11,15] @=> chords;
            return chords;
        }
        if(note == "Fmaj7" || note == "fmaj7" || note == "famaj7" || note == "Famaj7")
        {
            [5,9,12,16] @=> chords;
            return chords;
        }
       if(note == "F#maj7" || note == "f#maj7" || note == "fa#maj7" || note == "Fa#maj7" || note == "Gbmaj7" || note == "gbmaj7" || note == "solbmaj7" || note == "Solbmaj7")
        {
            [6,10,13,17] @=> chords;
            return chords;
        }
        if(note == "Gmaj7" || note == "gmaj7" || note == "solmaj7" || note == "Solmaj7")
        {
            [7,11,14,18] @=> chords;
            return chords;
        }
        if(note == "G#maj7" || note == "g#maj7" || note == "sol#maj7" || note == "Sol#maj7" || note == "Abmaj7" || note == "abmaj7" || note == "labmaj7" || note == "Labmaj7")
        {
            [8,12,15,19] @=> chords;
            return chords;
        }
        else{
          [0,0,0,0] @=> chords;
          return chords;
        }
        return chords;
    }

    public int[] modes (int input)
    {
        int notes[];
        if(input >= 1 && input <= 15){
        if( input == 1 )
        {
            [0, 2, 4, 5, 7, 9, 11] @=> notes; //major scale
            return notes;
        }
        if( input == 2 )
        {
            [0, 2, 3, 5, 7, 9, 10] @=> notes; //dorian
            return notes;
        }
        if( input == 3 )
        {
            [0, 1, 3, 5, 7, 8, 10] @=> notes; //phrygian
            return notes;
        }
        if( input == 4 )
        {
            [0, 2, 4, 6, 7, 9, 11] @=> notes; //lydian
            return notes;
        }
        if( input == 5 )
        {
            [0, 2, 4, 5, 7, 8, 10] @=> notes; //mixolydian
            return notes;
        }
        if( input == 6 )
        {
            [0, 2, 3, 5, 7, 8, 10] @=> notes; //aeolyan - minor
            return notes;
        }
        if( input == 7 )
        {
            [0, 1, 3, 5, 6, 8, 10] @=> notes; //locryan
            return notes;
        }
        if( input == 8 )
        {
            [0, 2, 4, 7, 9] @=> notes; //major pentatonic
            return notes;
        }
        if( input == 9 )
        {
            [0, 2, 3, 5, 7, 8, 11] @=> notes; //harmonic minor
            return notes;
        }
        if( input == 10 )
        {
            [0, 2, 3, 5, 7, 9, 11] @=> notes; //ascending melodic minor
            return notes;
        }
        if( input == 11 )
        {
            [0, 1, 4, 5, 7, 8, 10] @=> notes; //phrygian dominant-jewish
            return notes;
        }
        if( input == 12 )
        {
            [0, 2, 3, 6, 7, 8, 11] @=> notes; //hungarian-gypsy
            return notes;
        }
        if( input == 13 )
        {
            [0, 1, 4, 5, 7, 8, 11] @=> notes; //arabic
            return notes;
        }
        if( input == 13 )
        {
            [0, 2, 4, 6, 8, 10] @=> notes; //whole tone
            return notes;
        }
        if( input == 14 )
        {
            [0, 2, 3, 5, 6, 8, 9, 11] @=> notes; //diminished
            return notes;
        }
        if( input == 15 )
        {
            [0, 2, 4, 6, 7, 9, 10] @=> notes;//pseudo indian lydian
            return notes;
        }
        else {
          <<< "Not a mode in this library" >>>;
          return notes;
        }
      }
      return [0];
    }

    public string[] ptos(int prog[], string Key) // convert progression to string
    {
        string converted[0];
        key(Key) @=> string  reference[];

        for(0 => int i; i < prog.cap(); i++)
        {
             converted << reference[prog[i]];
        }
        return converted;
    }
    public int[] randomProgression()
    {
        return progression(Math.random2(1,12));
    }
    public int[] progression(int input)
    {
        int prog[];

        if(input == 1)
        {
            [5,5,2,2] @=> prog;
            return prog;
        }
        if(input == 2)
        {
            [5,5,4,4] @=> prog;
            return prog;
        }
        if(input == 3)
        {
            [5,3,4,2] @=> prog;
            return prog;
        }
        if(input == 4)
        {
            [0,0,4,4] @=> prog;
            return prog;
        }
        if(input == 5)
        {
            [0,0,3,3] @=> prog;
            return prog;
        }
        if(input == 6)
        {
            [0,0,5,5] @=> prog;
            return prog;
        }
        if(input == 7)
        {
            [0,4,5,3] @=> prog;
            return prog;
        }
        if(input == 8)
        {
            [0,4,3,4] @=> prog;
            return prog;
        }
        if(input == 9)
        {
            [5,3,0,4] @=> prog;
            return prog;
        }
        if(input == 10)
        {
            [5,4,3,4] @=> prog;
            return prog;
        }
        if(input == 11)
        {
            [3,3,4,4] @=> prog;
            return prog;
        }
        if(input == 12)
        {
            [1,4,0,5] @=> prog;
            return prog;
        }
        return prog;
    }
}
