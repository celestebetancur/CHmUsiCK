
Notes chords;
Drum drum => dac;
Harmony pad => dac;
FMSynth fmsynth => dac;
Melody melody => dac;
TheCooker thecooker => dac;
Sampler sampler => dac;




// mixer
0.5 => melody.gain;



3 => pad.measure;// es la métrica del comás


// paracambiar un sonido
// 2 => drum.BDSound;
// en el atributo drum coje el array mas pequeño
// para hacer un ritmo hay una clase drum tiene un atributo drum
//spork~ drum.drum([1,0,0],[0,0,1],[1,1,1]); // una opci[in
// también se puede llenar con una función
/* el metodo every me llena automaticamente un array,
el método, rotate gira el  array según las posiciones del segundo argumento,
reverse invierte el array, palindrome lo pega invertido, rand llena un array aleatorio segun
el argumento que reciba, trunk puede cortar desde el principio si es un solo argumento corta del principio
hasta elargumento, si son dos argumentos corta del primero al segundo, densify pone unos aleatorios no tiene argumentos, degrade pone ceros  aleatorio, density recibe un array y un flotante entre 0 y 1 es el porcentaje
*/
spork~ drum.drum(drum.every(4), drum.rotate(drum.every(2),2), drum.every(1));

//spork~ pad.sinOsc(chords.ptos(chords.progression(3),"C"));
// chords es un instancia de notes, y esa clase tiene las escalas progresions acordes ..la parte musical, dentro de esa clase hay un metodo que es ptos progresion to string
spork~ pad.sinOsc(chords.ptos([3,4,0,0],"D"));//ojo esta un numero menos que la m[usica esto es cuarto 5 1]


// si uso el mëtodo ratio recibe dos argumentos
//(4,3) => fmsynth.ratio;
spork~ fmsynth.fmBass([26, 25, 20,0, 55]);


spork~ melody.synth([52,0,0,0]); // sonidos de chuck
2 => melody.controlChange; // me va cambiando sonidos del 0 al 17

spork~ melody.synthOsc([104, 0,0,0, 104]);
1 => melody.controlChangeOsc; // sin, sqr, pulse, saw, tri

spork~ thecooker.sound([55,56,0]);

spork~ sampler.sound([1,0,0,0]);
sampler.file("nombreCarpeta", "nombreSample"); // estan en la carpeta de Dirt uno puede echar samples ahi

1::day => now;
