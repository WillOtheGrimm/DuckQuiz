class Duck {
    //Vector to keep track of position
    PVector position;
    //set duck speed
    float speed = 2;
    //Array to cycle through sprites 
    PImage[][] images;
    // 0: down, 1: up, 2: left, 3: right
    int currentDirection; 
    //To keep track of frame (sprite)
    int currentFrame;
    //I have 12 sprite for each direction 
    int framesPerDirection = 12;

    int animationSpeed = 7; 
    int frameCount = 0;

    Duck(float startX, float startY) {
        position = new PVector(startX, startY);
        images = new PImage[4][framesPerDirection]; // 4 directions
        loadImages();
        currentDirection = 0; // Initial direction (e.g., down)
        currentFrame = 0;
    }

    void loadImages() {
        for (int frame = 0; frame < framesPerDirection; frame++) {
            images[0][frame] = loadImage("Down-" + (frame + 1) + ".png"); // Down
            images[0][frame].resize(46, 46); // Resize image to 32x32
            images[1][frame] = loadImage("Up-" + (frame + 1) + ".png"); // Up
            images[1][frame].resize(46, 46); // Resize image to 32x32
            images[2][frame] = loadImage("Left-" + (frame + 1) + ".png"); // Left
            images[2][frame].resize(46, 46); // Resize image to 32x32
            images[3][frame] = loadImage("Right-" + (frame + 1) + ".png"); // Right
            images[3][frame].resize(46, 46); // Resize image to 32x32
        }
    }

    void move() {
        if (keyPressed) {
            if ((key == 'w' || keyCode == UP) && position.y > 0) {
                position.y -= speed;
                currentDirection = 1; // Up
            }
            if ((key == 's' || keyCode == DOWN) && position.y < height) {
                position.y += speed;
                currentDirection = 0; // Down
            }
            if ((key == 'a' || keyCode == LEFT) && position.x > 0) {
                position.x -= speed;
                currentDirection = 2; // Left
            }
            if ((key == 'd' || keyCode == RIGHT) && position.x < width) {
                position.x += speed;
                currentDirection = 3; // Right
            }
        }
    }

    void display() {
        image(images[currentDirection][currentFrame], position.x - 23, position.y - 23);

        frameCount++;
        if (frameCount % animationSpeed == 0) {
            currentFrame = (currentFrame + 1) % framesPerDirection;
            frameCount = 0;
        }
    }

    void createRipple(ArrayList<WaterRipple> ripples) {
        ripples.add(new WaterRipple(position.x, position.y));
    }
}

