

PFont f;              // A variable to hold onto a font
String[] janeeyre;    // The array to hold all of the text
int counter = 959;   // Where are we in the text (start later b/c Project Gutenberg has licensing info at beginning)

// We will use spaces and punctuation as delimiters
String delimiters = " ,.?!;:[]"+(char)34;

float slow = 1;
float slow2 = .4;
float slow3 = .6;
float slow4 = .8;
float slow4b = .9;
float slow5 = 1.2;
float slow6 = 1.6;
float slow7 = 2;
float slow8 = 2.2;

float r = 255;
float g = 255;
float b = 124;  

//float y;       
//float speed;   
//float gravity = 0.1;

//int opacity = 255;
//int direction = 1;

void setup() {
  size(1500, 800);
  smooth();
  noStroke();
  background(255, 0, 0);

  // Load the font
  f = loadFont( "ACaslonPro-Regular-32.vlw" );

  // Load Jane Eyre into an array of strings
  String url = "http://www.gutenberg.org/files/1260/1260.txt";
  String[] rawtext = loadStrings(url);

  // Join the big array together as one long string
  String everything = join(rawtext, "" );

  // All the lines in Jane Eyre are first joined as one big String and then split up into an array of individual words. 
  // Note the use of splitTokens() since we are using spaces and punctuation marks all as delimiters.  
  janeeyre = splitTokens(everything, delimiters);
  frameRate(slow);
}

void draw() {

  // Pick one word from Jane Eyre
  String theword = janeeyre[counter];

  // Count how many times that word appears in Jane Eyre
  int total = 0;
  for (int i = 0; i < janeeyre.length; i ++ ) {
    if (theword.equals(janeeyre[i])) {
      total ++;
      //      rotate(PI/48);
    }
  }

  fill(r, g, b);
  stroke(r, g, b);
  //  speed = 0;
  //  y = y + speed;
  //  speed = speed + gravity;
  //  speed = speed * -0.95; 

  if (total>1) {
    //    speed = speed * -0.95;  
    tint(r, g, b);
    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
  }
  
  if ( r > 255 )
    {
      r = 255;
    }
    if ( g > 255 )
    {
      g = 100;
    }

    if ( b > 255 )
    {
      b = 80;
    }
    
  textFont(f);


  //set how big the word will be based on total...reversed so that the smallest word is the biggest

  if (total>0 && total<10) {
    textSize(32+total*30);
    //    ellipse(random(300,1000), random(300,600), 32+total*30, 32+total*30);
    frameRate(slow2);
  }

  if (total>11 && total<20) {
    textSize(32+total*18);
    //    ellipse(random(300,1000), random(300,600), 32+total*16, 32+total*16);
    rotate(PI/24);
    frameRate(slow3);
  }

  if (total>21 && total<40) {
    textSize(32+total*8);
    //    ellipse(random(300,1000), random(300,600), 32+total*8, 32+total*8);
    frameRate(slow4);
  }

  if (total>41 && total<60) {
    textSize(32+total*6);
    //    ellipse(random(300,1000), random(300,600), 32+total*6, 32+total*6);
    rotate(-PI/48);
    frameRate(slow4b);
  }

  if (total>61 && total<100) {
    textSize(32+total/1.2);
    //    ellipse(random(300,1000), random(300,600), 32+total, 32+total);
    rotate(-PI/36);
    frameRate(slow4b);
  }
  if (total>101 && total<199) {
    textSize(32+total/6);
    ellipse(random(300, 1000), random(300, 600), 32+total/6, 32+total/6);
  }

  if (total>200 && total<1000) {
    textSize(32+total/14);
    ellipse(random(300, 1000), random(300, 600), 32+total/14, 32+total/14);
        fill(0);
    frameRate(slow5);
  }

  if (total>1001 && total<3000) {
    textSize(32+total/50);
    ellipse(random(300, 1000), random(300, 600), 32+total/50, 32+total/50);
    frameRate(slow5);
  }

  if (total>3001 && total<4000) {
    ellipse(random(300, 1000), random(300, 600), 32+total/150, 32+total/150);
    fill(0);
    textSize(32+total/150);
    rotate(-PI/18);

    frameRate(slow6);
  }

  if (total>4001 && total<5500) {
    ellipse(random(300, 1000), random(300, 600), 28+total/300, 28+total/300);
    fill(0);
    textSize(28+total/300);
    rotate(PI/16);
    frameRate(slow7);
  }

  if (total>5501) {
    ellipse(random(300, 1000), random(300, 600), 28+total/500, 28+total/500);
    fill(0);
    textSize(28+total/500);
    frameRate(slow8);
  }


  //    opacity -=2 * direction;
  //  if ((opacity < 0) || (opacity > 255)) {
  //    direction = -direction;
  //  }

  //make words random tint
//  fill(r, g, b);
//  stroke(0);
//  strokeWeight(10);
  textAlign (CENTER);
  text(theword, random(400, 900), random(200, 600));

//display word count
//  textSize(18);
//  fill(0);
//  textAlign(LEFT);
//  text(total, 20, 480);


  // Move onto the next word
  counter = (counter + 1) % janeeyre.length;
  fadeBackground();
}

void fadeBackground() {
  fill(255, 0, 0, 128);
  stroke(255, 0, 0, 128);
  rect (0, 0, width, height);
}

