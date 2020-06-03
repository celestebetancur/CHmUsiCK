1 => int device; //Get right device

MidiIn min;
MidiMsg msg;
min.open( device );

SndBuf buf => Envelope env => dac;
buf.gain(0.8);

1 => int bufToPlay;
1 => int folderToOpen;
0 => int playStatus;
0 => int folderOrFile;

0 => int DrumButtonStatus;
0 => int bdStatus;
0 => int hhStatus;
0 => int skStatus;
0 => int cpStatus;
0 => int mrStatus;
0 => int cbStatus;
0 => int tStatus;
0 => int snStatus;
[0,0,0,0,0,0,0,0] @=> int prevDrumNumber[];


while( true )
{
    min => now;
    while( min.recv(msg) )
    {
      //<<< msg.data1, msg.data2,msg.data3>>>;

      if(DrumButtonStatus == 0){
        if(msg.data1 == 176 && msg.data2 == 16 && msg.data3 == 127){
          1 => folderOrFile;
          <<< "Change Folder: ", folderToOpen >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 16 && msg.data3 == 0){
          0 => folderOrFile;
          <<< "Change File: ", bufToPlay>>>;
        }
        if(folderOrFile == 0){
          if(msg.data1 == 176 && msg.data2 == 12){
            bufToPlay++;
            <<< "Buffer: ", bufToPlay >>>;
            if(bufToPlay >= 1){
              buf.read(me.dir()+"AudiosFull/"+folderToOpen+"/"+bufToPlay+".wav");
            }
          }
          if(msg.data1 == 176 && msg.data2 == 18 && bufToPlay >= -1){
            bufToPlay--;
            <<< "Buffer: ",bufToPlay >>>;
            if(bufToPlay >= 1){
              buf.read(me.dir()+"AudiosFull/"+folderToOpen+"/"+bufToPlay+".wav");
            }
          }
        }
        if(folderOrFile == 1){
          if(msg.data1 == 176 && msg.data2 == 12){
            folderToOpen++;
            <<< "Folder: ",folderToOpen >>>;
            if(folderToOpen >= 1){
              buf.read(me.dir()+"AudiosFull/"+folderToOpen+"/"+bufToPlay+".wav");
            }
          }
          if(msg.data1 == 176 && msg.data2 == 18 && bufToPlay >= -1){
            folderToOpen--;
            <<< "Folder: ",folderToOpen >>>;
            if(folderToOpen >= 1){
              buf.read(me.dir()+"AudiosFull/"+folderToOpen+"/"+bufToPlay+".wav");
            }
          }
        }
        if(msg.data1 == 176 && msg.data2 == 17){
          0 => int playStatus;
          env.keyOff();
        }
        if(msg.data1 == 176 && msg.data2 == 19){
          1 => int playStatus;
          buf.pos(0);
          env.keyOn();
        }
      }


      //Drum midi control
      if(DrumButtonStatus == 0){
        if(msg.data1 == 176 && msg.data2 == 13){
          STATIC.BD => prevDrumNumber[0];
          STATIC.SK => prevDrumNumber[1];
          STATIC.HH => prevDrumNumber[2];
          STATIC.CP => prevDrumNumber[3];
          STATIC.MR => prevDrumNumber[4];
          STATIC.CB => prevDrumNumber[5];
          STATIC.T => prevDrumNumber[6];
          STATIC.SN => prevDrumNumber[7];

          0 => STATIC.BD;
          0 => STATIC.SK;
          0 => STATIC.HH;
          0 => STATIC.CP;
          0 => STATIC.MR;
          0 => STATIC.CB;
          0 => STATIC.T;
          0 => STATIC.SN;

        }
      }

      if(msg.data1 == 153 && msg.data2 == 36 && msg.data3 != 0){
        1 => bdStatus;
        1 => DrumButtonStatus;
        if(STATIC.BD == 0){
          1 => STATIC.BD;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 36){
        0 => bdStatus;
        0 => DrumButtonStatus;
      }
      if(bdStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.BD++;
          <<< STATIC.BD >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.BD >= 0){
          STATIC.BD--;
          <<< STATIC.BD >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.BD;
        }
      }

      if(msg.data1 == 153 && msg.data2 == 38 && msg.data3 != 0){
        1 => skStatus;
        1 => DrumButtonStatus;
        if(STATIC.SK == 0){
          1 => STATIC.SK;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 38){
        0 => skStatus;
        0 => DrumButtonStatus;
      }
      if(skStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.SK++;
          <<< STATIC.SK >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.SK >= 0){
          STATIC.SK--;
          <<< STATIC.SK >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.SK;
        }
      }

      if(msg.data1 == 153 && msg.data2 == 46 && msg.data3 != 0){
        1 => hhStatus;
        1 => DrumButtonStatus;
        if(STATIC.HH == 0){
          1 => STATIC.HH;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 46){
        0 => hhStatus;
        0 => DrumButtonStatus;
      }
      if(hhStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.HH++;
          <<< STATIC.HH >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.HH >= 0){
          STATIC.HH--;
          <<< STATIC.HH >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.HH;
        }
      }

      if(msg.data1 == 153 && msg.data2 == 42 && msg.data3 != 0){
        1 => cpStatus;
        1 => DrumButtonStatus;
        if(STATIC.CP == 0){
          1 => STATIC.CP;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 42){
        0 => cpStatus;
        0 => DrumButtonStatus;
      }
      if(cpStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.CP++;
          <<< STATIC.CP >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.CP >= 0){
          STATIC.CP--;
          <<< STATIC.CP >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.CP;
        }
      }

      if(msg.data1 == 153 && msg.data2 == 50 && msg.data3 != 0){
        1 => mrStatus;
        1 => DrumButtonStatus;
        if(STATIC.MR == 0){
          1 => STATIC.MR;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 50){
        0 => mrStatus;
        0 => DrumButtonStatus;
      }
      if(mrStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.MR++;
          <<< STATIC.MR >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.MR >= 0){
          STATIC.MR--;
          <<< STATIC.MR >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.MR;
        }
      }

      if(msg.data1 == 153 && msg.data2 == 45 && msg.data3 != 0){
        1 => cbStatus;
        1 => DrumButtonStatus;
        if(STATIC.CB == 0){
          1 => STATIC.CB;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 45){
        0 => cbStatus;
        0 => DrumButtonStatus;
      }
      if(cbStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.CB++;
          <<< STATIC.CB >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.CB >= 0){
          STATIC.CB--;
          <<< STATIC.CB >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.CB;
        }
      }

      if(msg.data1 == 153 && msg.data2 == 51 && msg.data3 != 0){
        1 => tStatus;
        1 => DrumButtonStatus;
        if(STATIC.T == 0){
          1 => STATIC.T;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 51){
        0 => tStatus;
        0 => DrumButtonStatus;
      }
      if(tStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.T++;
          <<< STATIC.T >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.T >= 0){
          STATIC.T--;
          <<< STATIC.T >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.T;
        }
      }

      if(msg.data1 == 153 && msg.data2 == 49 && msg.data3 != 0){
        1 => snStatus;
        1 => DrumButtonStatus;
        if(STATIC.SN == 0){
          1 => STATIC.SN;
        }
      }
      if(msg.data1 == 137 && msg.data2 == 49){
        0 => snStatus;
        0 => DrumButtonStatus;
      }
      if(snStatus == 1){
        if(msg.data1 == 176 && msg.data2 == 12){
          STATIC.SN++;
          <<< STATIC.SN >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 18 && STATIC.SN >= 0){
          STATIC.SN--;
          <<< STATIC.SN >>>;
        }
        if(msg.data1 == 176 && msg.data2 == 13){
          0 => STATIC.SN;
        }
      }

      [STATIC.BD,STATIC.SK,STATIC.HH,STATIC.CP,STATIC.MR,STATIC.CB,STATIC.T,STATIC.SN]  @=> STATIC.DRUMMIDI;

    }
  }
