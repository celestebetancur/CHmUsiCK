//
//  Array.ck
//  CHmUsiCK
//
//  Created by Esteban Betancur on 10/12/14.
//  Copyright (c) 2014 Esteban Betancur. All rights reserved.
//

public class Array
{
    static int Drum[][][];
    static int CORPUSKICK[];
    static int CORPUSSNARE[];
    static int CORPUSHIHAT[];
}

[[[1,0,1,0,1,0,1,0],[0,0,0,0,1,0,0,0],[0,1,0,1,0,1,0,1]]] @=> Array.Drum;
[0] @=> Array.CORPUSKICK;
[0] @=> Array.CORPUSSNARE;
[0] @=> Array.CORPUSHIHAT;