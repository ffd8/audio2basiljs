--------------------------------------------
experimental audio_in » indesign via basiljs
--------------------------------------------
v.01 cc teddavis.org 2016

install
------------------------
you can either run the audio2basiljs code from processing or [download the app](https://github.com/ffd8/audio2basiljs/releases/download/0.01/audio2basiljs.zip) in the releases tab.

instructions
------------------------
1. open the audio_in.idml file and save it to the same folder before running
2. open audio2basiljs application (must be in same folder!)
3. open both '1_audio_in.jsx' + '2_stop.jsx' scripts
4. run '1_audio_in.jsx'
5. run '2_stop.jsx' when you are done! this really stops the script

keys (audio2basiljs app)
------------------------
* UP / DOWN - adjusts audio input sensitivity
* P - pause/unpause audio input

how/what?
------------------------
audio2basiljs listens to your audio input and saves the average audio value to a text file called 'audio.txt' inside of the /data folder located next to it. the basiljs script reads this document 15x a second and gives you the audio as a variable to play with.