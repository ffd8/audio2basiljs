import ddf.minim.*; 
import ddf.minim.analysis.*;  
Minim minim;   
FFT fft;  
AudioInput in;   
float amp = 15; // used to make signal stronger/weaker 
float ampWave = 10*amp; 
float avgAudio;
float easeAudio; 
float easing = 0.5;
boolean paused = false;

void setup(){
  //fullScreen();
size(800,500);
minim = new Minim(this); // initalize in setup 
in = minim.getLineIn(Minim.STEREO, 512); // audio in + bufferSize 512 or 1024 
fft = new FFT(in.bufferSize(), in.sampleRate());  
fft.logAverages(22, 3); // 3 = 30, 4 = 40, etc.. 
strokeWeight(2);
frameRate(15);
}


void draw(){
fft.forward(in.mix); // IMPORTANT
background(0); 
//backgroundFade(50);  
noFill();  
stroke(255);  
 
beginShape();  
  for (int i = 0; i < in.bufferSize(); i++) {  
    float x = map(i, 0, in.bufferSize(), 0, width); // distribute points  
    float laudio = in.left.get(i)*ampWave; // left audio channel  
    vertex(x, height*.25 + laudio);  
  }  
endShape();  
 
beginShape();  
  for (int i = 0; i < in.bufferSize(); i++) {  
    float x = map(i, 0, in.bufferSize(), 0, width); // distribute points  
    float raudio = in.right.get(i)*ampWave; // left audio channel  
    vertex(x, height*.75+raudio);  
  }  
endShape(); 


for (int i = 0; i < fft.avgSize(); i++) {  
    avgAudio+= abs(fft.getAvg(i)*amp); // duplicate everything for stereo w/ right too! 
}    
avgAudio /= fft.avgSize();  

float targetX = avgAudio; // grabs latest avgAudio 
float dx = targetX - easeAudio; // calculates difference to current easeAudio 
easeAudio += dx * easing;
 
//background(0); 
//backgroundFade(10); 
fill(255); 
 
ellipse(width/2, height/2, avgAudio, avgAudio); // plug avgAudio ANYWHERE! 

textSize(50);
text(nf(easeAudio,3,3), 25, 50);
saveAudio();
}

void saveAudio(){
    String audio[] = new String[1];
    audio[0] = nf(easeAudio,1, 3);
    saveStrings("data/audio.txt", audio);
}

void keyPressed() { 
  if (keyCode == 38) { // up arrow 
    amp += 5; 
    ampWave = amp*10; 
  } else if (keyCode == 40) { // down arrow 
    amp -= 5; 
    if (amp < 5) { 
      amp = 5; 
    } 
    ampWave = amp*10; 
  } 
  if(key == 'p'){
    if(!paused){
      paused = true;
      noLoop();
    }else{
      paused = false;
      loop();
    }
  }
} 