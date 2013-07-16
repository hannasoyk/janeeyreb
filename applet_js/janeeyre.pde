

PFont f;              // A variable to hold onto a font
String[] janeeyre;    // The array to hold all of the text
int counter = 1509;   // Where are we in the text (start later b/c Project Gutenberg has licensing info at beginning)

// We will use spaces and punctuation as delimiters
String delimiters = " ,.?!;:[]";

float slow = .5;

float r = 255;
float g = 255;
float b = 124;  

float y;       
float speed;   
float gravity = 0.1;



PImage peony;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
  peony = loadImage ("pinkpeony.jpg");


  // Load the font
  f = loadFont( "Garamond-Italic-32.vlw" );

  // Load Jane Eyre into an array of strings
  String url = "http://www.gutenberg.org/files/1260/1260.txt";
  String[] rawtext = loadStrings(url);

  // Join the big array together as one long string
  String everything = join(rawtext, "" );

  // All the lines in King Lear are first joined as one big String and then split up into an array of individual words. 
  // Note the use of splitTokens() since we are using spaces and punctuation marks all as delimiters.  
  janeeyre = splitTokens(everything, delimiters);
  frameRate(slow);
}

void draw() {
  image (peony, -width/2, 0);
  // Pick one word from Jane Eyre
  String theword = janeeyre[counter];

  // Count how many times that word appears in King Lear
  int total = 0;
  for (int i = 0; i < janeeyre.length; i ++ ) {
    if (theword.equals(janeeyre[i])) {
      total ++;
    }
  }

  // Display the text and total times the word appears
  fill(r, g, b, 128);
  stroke(r, g, b, 128);
  speed = 0;
  y = y + speed;
  speed = speed + gravity;

  if (total>1) {
    speed = speed * -0.95;  
    tint(r, g, b);
    r=random(255);
    g=random(255);
    b=random(255);
  }


  ellipse(200, 200, total/8, total/8);




  textFont(f);


  if (total<20) {
    textSize(20);
  }

  if (total<100) {
    textSize(20+total/4);
  }

  if (total<5000) {
    textSize(32+total/8);
  }


  if (total>5000) {
    textSize(32+total/20);
  }



  fill (255);
  textAlign (CENTER);
  text(theword, width/2, height/2);





  textSize(18);
  fill(180);
  textAlign(LEFT);
  text(total, 20, 480);
  stroke(175);
  fill(175);



  // Move onto the next word
  counter = (counter + 1) % janeeyre.length;
}



