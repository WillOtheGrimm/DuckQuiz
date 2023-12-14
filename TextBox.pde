class TextBox {
    int x, y, w, h;
    String text = "";
    boolean isActive = false;

    //For all the textbox data (x,y,width and height)
    TextBox(int x, int y, int w, int h) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    //For the Display of the name registration box and making sure it is selected 
    void display() {
        fill(isActive ? 255 : 200);
        rect(x, y, w, h);

        // Set clipping area to the bounds of the text box
        clip(x, y, w, h);

        // Draw the text and make it type from the right (also added some space from the righ (-10))
        fill(0);
        textAlign(RIGHT, CENTER);
        text(text, x, y, w - 10, h); 

        // Reset clipping and text alignment
        noClip();
        textAlign(LEFT);
    }
    //To add character to the textbox
    void addChar(char c) {
        if (isActive) {
            text += c;
        }
    }
    //To allow removal of character (I made too many typo)
    void backspace() {
        if (isActive && text.length() > 0) {
            text = text.substring(0, text.length() - 1);
        }
    }
    //To check if the textbox is being selected
    void setActive(boolean active) {
        isActive = active;
    }
    //This is to get the text (for the result page)
    String getText() {
        return text;
    }
}