#targetengine "loop";
#includepath "~/Documents/;%USERPROFILE%Documents";
#include "basiljs/bundle/basil.js";

// ** have the stop.jsx script ready to stop the looping!
var audioIn = 0;
var myTextFrame, myLayer, myRect;

function setup() {
	myLayer = b.layer("audio");
	b.clear(myLayer);

  b.textSize(100);
	b.textAlign(Justification.CENTER_JUSTIFIED, VerticalJustification.CENTER_ALIGN);
  myTextFrame = b.text("SOUND", 0, 0, b.width, b.height);

	b.fill(0);
	myRect = b.rect(0, 0, 50, 50);
	myRect.fillColor = b.color(0);
}

function draw() {
	audioIn = b.loadString("audio.txt");
	//b.println("audioIn: "+audioIn);

	var audioSize = b.constrain(b.map(audioIn, 0, 100, 10, 100), 10, 100);
  b.typo(myTextFrame, "pointSize", audioSize);

	var audioWidth = b.constrain(b.map(audioIn, 0, 100, 1, b.width), 1, b.width);
	b.itemWidth(myRect, audioWidth);
}

b.loop(15);