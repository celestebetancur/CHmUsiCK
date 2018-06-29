adc.chan(0)  => ABSaturator sat => JCRev rev => dac;

40 => sat.drive;
5 => sat.dcOffset;
0.1 => rev.mix;

day => now;