# CHmUsiCK
========

_______________
## Musical Simple Interface

CHmUsick 0.0.2 (beta version)
---------------

Install chuck, clone this repo, copy any of the examples in the file called LiveCode.ck and run Library.ck.

---------------------
### Install ChucK and miniAudicle in Linux (Jack 2)

wget http://audicle.cs.princeton.edu/mini/release/files/miniAudicle-1.3.5.2.tgz;
tar zxvf miniAudicle-1.3.5.2.tgz;
sudo apt-get install make gcc g++ bison flex libasound2-dev libsndfile1-dev libqt4-dev libqscintilla2-dev libjack-jackd2-dev;
cd miniAudicle-1.3.5.2/; 
cd src; 
make linux-jack;
mv miniAudicle ~/

-------------
### For command line users
In a terminal

```$ chuck --loop Library.ck```

Edit the file called LiveCode.ck and save changes
