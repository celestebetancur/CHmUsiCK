Chmusick tempo;

Gain gate => dac;
Drum drum => gate;

TheCooker cook => gate;

gate.gain(5.5);
tempo.tempo(100);

spork~drum.drumF([1,0,0,0],[0,1]);
spork~cook.sound([60,62,0,64,0,67]);

day => now;