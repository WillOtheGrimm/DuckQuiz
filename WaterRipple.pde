class WaterRipple {
    PVector position;
    float size;
    int lifespan;

    WaterRipple(float x, float y) {
        position = new PVector(x, y);
        size = 0;
        lifespan = 255; // You can adjust this value for lifespan
    }

    //To set the size / speed of the ripple
    void update() {
        size += 0.5; 
        lifespan -= 2; 
    }

    //to kill the ripples
    boolean isDead() {
        return lifespan <= 0;
    }
    //To display the ripples
    void display() {
        noFill();
        stroke(255, lifespan);
        ellipse(position.x, position.y, size, size);
    }
}


