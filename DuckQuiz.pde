// Default difficulty level
int difficulty = 0; 
// 0 for title screen, and number for the question number
int currentQuestion = 0;
//This is for the duck coordinate
int duckX, duckY;



int buttonX, buttonY, buttonWidth, buttonHeight, answerTextY, rightButtonX;
int answerTextSize = 20;
int answerBoxWidth = 120;
int answerBoxHeight = 50;




int score = 0;

void setup() {
    size(512, 512);
    background(#6c8493);

    // Initialize button dimensions and positions
    buttonWidth = 120;
    buttonHeight = 50;
    buttonX = width / 2 - buttonWidth / 2; // Centered on screen
    buttonY = 340; // Adjust this in each question if needed
    rightButtonX = width / 2 + 30; // Adjust this as needed

}

void draw() {
    fill(0);
    duckX = mouseX;
    duckY = mouseY;
    
    switch (currentQuestion) {
        case 0:
            TitlePage();
            break;
        case 1:
            question1();
            break;
        case 2:
            question2();
            break;
        case 3: 
            question3();
            break;
        case 4: 
            question4();



    }
    
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
    if (duckX >= 35 && duckX <= 35 + 100) {
        if (duckY >= 375 && duckY <= 375 + 50) {
            fill(178);
        }
    }
    //set color back when away
    else {
        fill(200);
    }
    rect(35, 375, 100, 50);
    
    //----------------------------------------------------------------------------------
    
    
    
    //Student Button
    //change color if hovering
    if (duckX >= 387 && duckX <= 387 + 100) {
        if (duckY >= 375 && duckY <= 375 + 50) {
            fill(178);
        }
    }
    //set color back when away
    else {
        fill(200);
    }
    rect(387, 375, 100, 50);
}
//----------------------------------------------------------------------------------



void question1() {
    background(#6c8493); // Redraw background

    // Display question
    textAlign(CENTER);
    textSize(24); // Increased text size for the question
    text("What is the syntax of this shape?", width / 2, 100);

    // Draw circle
    fill(64); // Dark grey for the circle
    ellipse(width / 2, 175, 50, 50); // Centered circle

    // Adjust the y-coordinates for the answers and buttons
    answerTextY = 250; // Position for answer text, adjust as needed
    buttonY = 300; // Position for buttons, adjust as needed

    // Answer Options Text
    textSize(answerTextSize);
    fill(255); // White text for answers

    // Calculate positions for left and right text and buttons
    int leftTextX = width / 4;
    int rightTextX = 3 * width / 4;

    // Left answer text
    textAlign(CENTER);
    text("rect(x, y, width, height);", leftTextX, answerTextY);

    // Right answer text
    text("ellipse(x, y, width, height);", rightTextX, answerTextY);

    // Rectangles for Answer Options
    // Left button
    buttonX = leftTextX - buttonWidth / 2; // Adjust button X position
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); // Draw the left button

    // Right button
    rightButtonX = rightTextX - buttonWidth / 2; // Adjust button X position
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); // Draw the right button
}







void question2() {
    background(#6c8493); // Redraw background

    // Display question
    textAlign(CENTER);
    textSize(24); // Text size for the question
    text("What programming language does Processing use?", width / 2, 100);

    // Adjust the y-coordinates for the answers and buttons
    answerTextY = 220; // Y-coordinate for answer text
    buttonY = 260; // Raise the button Y position for this question

    // Answer Options Text
    textSize(answerTextSize); // Use the common text size for answers
    fill(255); // White text for answers

    // Left answer text - Java
    text("Java", width / 2 - 100, answerTextY);

    // Right answer text - C++
    text("C++", width / 2 + 100, answerTextY);

    // Left button - Java
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); // Draw the left button

    // Right button - C++
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); // Draw the right button
}




void question3() {
    background(#6c8493); // Redraw background

    // Display question
    textAlign(CENTER);
    textSize(24); // Text size for the question
    text("Which one of these is a noise() function?", width / 2, 50);

    // Set the stroke color for the graphs
    stroke(0); // Black color for the graphs

    // Draw the Noise Graph
    float yNoise;
    for (int x = 0; x < width; x++) {
        yNoise = noise(x * 0.01) * (height / 4); // Scale the noise value
        line(x, 100, x, 100 + yNoise); // Position and draw the noise graph
    }

    // Button below the Noise Graph
    buttonY = height / 2 + 20; // Adjust button Y position for the noise graph
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); // Noise button

    // Draw the Random Graph
    float yRandom;
    for (int x = 0; x < width; x++) {
        yRandom = random(height / 4); // Random value scaled
        line(x, height / 2 + 120, x, height / 2 + 120 + yRandom); // Position and draw the random graph
    }

    // Button below the Random Graph
    buttonY = height - 80; // Adjust button Y position for the random graph
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); // Random button
}


void question4 () {







    
}




//Skill # 11
void mousePressed() {

    //For info on mouse location
    println("Mouse X is: " + mouseX);
    println("Mouse Y is: " + duckY);
    println("Difficulty is: " + difficulty);
    println("We are on question: " + currentQuestion);



    // Check if on the title screen
    if (currentQuestion == 0) {
        // Teacher button
        if (duckX >= 35 && duckX <= 135 && duckY >= 375 && duckY <= 425) {
            difficulty = 2;
            currentQuestion = 1; // Go to question 1
        }
        // Student button
        if (duckX >= 387 && duckX <= 487 && duckY >= 375 && duckY <= 425) {
            difficulty = 1;
            currentQuestion = 1; // Go to question 1
        }
    }


    // Check if on question 1 and handle button clicks
    if (currentQuestion == 1) {
        // Left button (e.g., "rect")
        if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
            // Handle click logic for left button
            currentQuestion = 2; // Go to next question
        }
        // Right button (e.g., "ellipse")
        if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
            currentQuestion = 2; // Go to next question
        }
    }





    //Check if on question 2 and handle button clicks
    
    if(currentQuestion == 2) {
        if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        currentQuestion = 3;
        }

    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        currentQuestion = 3;
    }


    }





}