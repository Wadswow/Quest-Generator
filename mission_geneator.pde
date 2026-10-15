PImage quest;
ArrayList<PImage> pictures;
PImage currentImage;
PFont font;
StringList header;
String head;

void setup() {
  size(645, 612);
  imageLoader();
  font = loadFont("VinerHandITC-48.vlw");
  textFont(font);
  setupHeader();
  head = header.get(int(random(header.size())));
  currentImage = pictures.get(int(random(pictures.size())));
}

void draw() {
  background(255);
  image(quest, 0, 0);
  fill(230, 210, 170);
  image(currentImage, 10, 153, 420, 204);
  rect(10, 360, 420, 140);
  rect(10, 505, 420, 100);
  float boxX = 10;
  float boxY = 0;
  float padding = 20;
  float availableW = 420 - padding * 2;
  float availableH = 153 - padding * 2;
  float size = 200;
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(size);
  while (size > 1 &&
         (textWidth(head) > availableW ||
          textAscent() + textDescent() > availableH)) {
    size--;
    textSize(size);
  }
  // Draw the word in the center of the rectangle
  text(head, boxX + 420/2, boxY + 153/2);
}

void setupHeader() {
  header = new StringList();
  header.append("HELP");
  header.append("REQUEST");
  header.append("DANGER");
  header.append("NEEDED");
}

void imageLoader(){
  quest = loadImage("Quest_Paper.jpg");
  pictures = new ArrayList<PImage>();
  pictures.add(loadImage("snake.jpg"));
  pictures.add(loadImage("hood.jpg"));
}
