void setup() {
    size(512, 512);
    background(#6c8493);
}

void draw() {
    fill(0);
    
    TitlePage();
    
    
    
}




void TitlePage() {
    
    // textSize(30);
    // text("Duck Quiz",  512 / 2, 86);
    //Set text alignment to center and font size
    textAlign(CENTER);
    textSize(32);
    
    //Display "Duck Quiz" at the top
    text("Duck Quiz", width / 2, 100);
    
    //Set smaller text size for instructions and query
    textSize(20);
    
    //Display instructions
    text("Press space in area to select answer", width / 2, 200);
    
    //Display query
    text("Are you a teacher or student?", width / 2, 230);
    
    //Set text alignment for options
    textAlign(LEFT);
    text("Teacher", 50, 350);
    
    textAlign(RIGHT);
    text("Student", width - 50, 350);
    
    // How to Play Section
    textAlign(RIGHT);
    textSize(16); // Smaller text for "How to Play?"
    text("How to play?", width - 10, 30); // Positioned near the top-right corner
    



    //Rectangles for Teacher and Student
    noStroke(); // No border for the ovals
    fill(200);
    shapeMode(CENTER);    


//----------------------------------------------------------------------------------
    // Teacher Button
    //change color if hovering
    if(mouseX >= 35 && mouseX <= 35 + 100 ) {
        if(mouseY >= 375 && mouseY <= 375 + 50){
        fill(178) ;
        }
    }
    //set color back when away
    else {
        fill(200) ;
    }
    rect(35, 375, 100, 50);
//----------------------------------------------------------------------------------



    //Student Button
    //change color if hovering
    if(mouseX >= 387 && mouseX <= 387 + 100 ) {
        if(mouseY >= 375 && mouseY <= 375 + 50){
        fill(178) ;
        }
    }
    //set color back when away
    else {
        fill(200) ;
    }
    rect(387, 375, 100, 50);
}
//----------------------------------------------------------------------------------

//For info on mouse location
//Skill # 11
void mousePressed() {
    
    println("Mouse X is: " + mouseX);
    println("Mouse Y is: " + mouseY);
    
}