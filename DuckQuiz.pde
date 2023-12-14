// Default difficulty level
int difficulty = 0; 
// 0 for title screen, and number for the question number
int currentQuestion = 0;
//This is for the duck coordinate
float duckX, duckY;
//These are for the many butttons used in each question and to know 
int buttonX, buttonY, buttonWidth, buttonHeight, answerTextY, rightButtonX;
int answerTextSize = 20;
//To keep track of a the player's score
int score = 0;
//To keep track of the name registration
TextBox nameInput;
String playerName = ""; 
//For the duck / movement 
Duck duck;
float xSpeed = 0;
float ySpeed = 0;
//For the ripples
ArrayList<WaterRipple> ripples = new ArrayList<WaterRipple>();

void setup() {
    size(512, 512);
    background(#2dd3f7);
    //This is to register the name imput
    nameInput = new TextBox(100, 260, 300, 30); 
    
    //To make the Duck start in the middle of the canvas
    duck = new Duck(width / 2, height / 2); 
    duck.position = new PVector(width / 2, height / 2);
    duck.position.x += xSpeed;
    duck.position.y += ySpeed;
    
    //To make sure duck stay within boundary
    duck.position.x = constrain(duck.position.x, 0, width);
    duck.position.y = constrain(duck.position.y, 0, height);
    
    // Initialize button dimensions and positions for the initial title screen
    buttonWidth = 120;
    buttonHeight = 50;
    buttonX = width / 2 - buttonWidth / 2; 
    buttonY = 340; 
    rightButtonX = width / 2 + 30; 
    
}

void draw() {
    fill(0);
    //duckX = mouseX;
    //duckY = mouseY;
    
    //To keep track of duck's coord and movement (speed vertical and horizontal)
    duck.position.x += xSpeed;
    duck.position.y += ySpeed;
    duck.position.x = constrain(duck.position.x, 0, width);
    duck.position.y = constrain(duck.position.y, 0, height);
    duckX = duck.position.x;
    duckY = duck.position.y;
    
    
    
    
    //Switch case to go between questions / screens 
    switch(currentQuestion) {
        case - 1 : 
            howToPlay();
            break;
        case 0:
            background(#2dd3f7);    
            TitlePage();
            break;
        case 1:
            question1();
            break;
        case 2:
            question2();
            break;
        case 3 : 
            question3();
            break;
        case 4 : 
            question4();
            break;
        case 5 : 
            question5();
            break;
        case 6 : 
            question6();
            break;
        case 7 : 
            question7();
            break;
        case 8 : 
            question8();
            break;
        case 9 : 
            question9();
            break;
        case 10 : 
            question10();
            break;
        case 11 : 
            question11();
            break;
        case 12 : 
            question12();
            break;
        case 13 : 
            question13();
            break;
        case 14 : 
            question14();
            break;
        case 15 : 
            question15();
            break;
        case 16 : 
            question16();
            break;
        case 17 : 
            question17();
            break;
        case 18 : 
            question18();
            break;
        case 19 : 
            question19();
            break;
        case 20 : 
            question20();
            break;
        case 21 : 
            result();
            break;
        case 22 : 
            restartQuiz();
    }
    
    
    
    //this is to make it so that a ripple appear every 30 frames
    if (frameCount % 30 == 0) { 
        duck.createRipple(ripples);
    }
    
    // Update and display ripples
    for (int i = ripples.size() - 1; i >= 0; i--) {
        WaterRipple ripple = ripples.get(i);
        ripple.update();
        ripple.display();
        //remove ripple after period of time (when is dead)
        if (ripple.isDead()) {
            ripples.remove(i);
        }
    }
    
    //To make duck appear and move (refer to duck class)
    duck.move();
    duck.display();
    
}



//Function for the Title Screen
void TitlePage() {
    
    //To redraw the background
    background(#2dd3f7); 
    
    textAlign(CENTER);
    textSize(32);
    text("Duck Quiz", width / 2, 100);
    
    textSize(20);
    text("Press space in area to select answer", width / 2, 200);
    text("Are you a teacher or student?", width / 2, 230);
    
    // Teacher and Student buttons text
    textAlign(LEFT);
    text("Teacher", 50, 350);
    textAlign(RIGHT);
    text("Student", width - 50, 350);
    
    // Rectangles for Teacher and Student
    fill(200);
    rectMode(CORNER); 
    // Position for Teacher button
    rect(35, 375, 100, 50); 
    // Position for Student button
    rect(width - 135, 375, 100, 50); 
    
    // How to Play Section
    fill(0);
    textAlign(RIGHT);
    textSize(16);
    text("How to play?", width - 10, 30);
    
    // Change color if hovering over the How to Play button
    if (duckX >= width - 60 - 15 && duckX <= width - 60 + 15 && duckY >= 50 - 15 && duckY <= 50 + 15) {
        // Darker grey when hovering
        fill(178); 
    } else {
        // Light grey normally
        fill(200); 
    }
    // Draw the button
    ellipse(width - 60, 50, 30, 30); 
    
    // Draw the question mark on the button
    fill(0); // Black color for text
    textSize(20); // Text size for question mark
    textAlign(CENTER, CENTER);
    text("?", width - 60, 48); // Positioning the question mark
    
    
    
    
    //Rectangles for Teacher and Student
    noStroke();
    fill(200);
    shapeMode(CENTER);    
    
    // Teacher Button
    // Change color if hovering over the button
    if (duckX >= 35 && duckX <= 35 + 100) {
        if (duckY >= 375 && duckY <= 375 + 50) {
            fill(178);
        }
    }
    //set color back when away
    else {
        fill(200);
    }
    //Draw the button
    rect(35, 375, 100, 50);
    
    
    
    //Student Button
    // Change color if hovering over the button
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
    
    //To display what is being typed
    nameInput.display();
    //To set the name to what the input was
    playerName = nameInput.text;
}
//______________________________________________________________________________________________________________________________________________________________________________





void howToPlay() {
    background(#2dd3f7);
    fill(200); // Grey background
    rectMode(CENTER);
    rect(width / 2, height / 2, 350, 250); // Adjust size as needed
    
    // Text for the instructions
    fill(0); 
    textAlign(CENTER, CENTER);
    textSize(20);
    //It was by that point that i learned about the \n to make it go to the next line (learned something new!)
    text("To move duck around use WASD\nor Arrow Key. Once on your\nselected answer press 'Space'\nto enter your choice.", width / 2, height / 2 - 40);
    
    // Back button with an arrow
    //Also I finally understood how to use the conventional operator 
    // Change color when hovering else remain 
    fill(mouseX >= 50 - 20 && mouseX <= 50 + 20 && mouseY >= 50 - 20 && mouseY <= 50 + 20 ? 150 : 178); 
    // Draw the button
    ellipse(50, 50, 40, 40); 
    
    // Arrow pointing left
    fill(0); 
    textSize(20);
    text("<", 50, 47); 
}


void question1() {
    // Redraw background
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is the syntax of this shape?", width / 2, 100);
    
    // Draw circle
    fill(64); 
    ellipse(width / 2, 175, 50, 50);
    
    // Set to change the buttons coord
    answerTextY = 250; 
    buttonY = 300; 
    
    
    textSize(answerTextSize);
    fill(255); 
    
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
    buttonX = leftTextX - buttonWidth / 2; 
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    
    
    // Right button
    rightButtonX = rightTextX - buttonWidth / 2; 
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    
    
    // Display "Question: 1" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 1", width / 2, 20);
}
//______________________________________________________________________________________________________________________________________________________________________________

void question2() {
    // Redraw background
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What programming language does Processing use?", width / 2, 100);
    
    // Set to change the buttons coord
    answerTextY = 220;
    buttonY = 260; 
    
    
    
    textSize(answerTextSize); 
    fill(255); 
    
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
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    
    
    // Right button - C++
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 2" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 2", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question3() {
    // Redraw background
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("Which one of these is a noise() function?", width / 2, 50);
    
    // Set the stroke color for the graphs
    stroke(0); 
    
    
    // Draw the Noise Graph
    float yNoise;
    for (int x = 0; x < width; x++) {
        yNoise = noise(x * 0.01) * (height / 4); 
        line(x, 100, x, 100 + yNoise);
    }
    
    // Noise button
    int noiseButtonY = height / 2 - 30; 
    fill(duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= noiseButtonY && duckY <= noiseButtonY + buttonHeight ? 150 : 200);
    rect(buttonX, noiseButtonY, buttonWidth, buttonHeight);
    fill(0); // Text color
    text("This one", buttonX + buttonWidth / 2, noiseButtonY + buttonHeight / 2);
    
    
    // Draw the Random Graph
    float yRandom;
    for (int x = 0; x < width; x++) {
        yRandom = random(height / 4);
        line(x, height / 2 + 120, x, height / 2 + 120 + yRandom); 
    }
    
    // Random button
    int randomButtonY = height - 50;
    fill(duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= randomButtonY && duckY <= randomButtonY + buttonHeight ? 150 : 200);
    rect(buttonX, randomButtonY, buttonWidth, buttonHeight); 
    fill(0); 
    text("This one", buttonX + buttonWidth / 2, randomButtonY + buttonHeight / 2);
    
    
    // Display "Question: 3" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 3", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question4() {
    // Redraw background
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("How often does the draw() function run?", width / 2, 100);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    // By this point i made a variable for the text size, I missed some of them but I couldn't find them
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer text - Once every frame
    text("Once every frame", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - Once every second
    text("Once every second", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - Once every frame
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - Once every second
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 4" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 4", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question5() {
    // Redraw background
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24);
    text("Have you tried clicking the mouse?", width / 2, 100);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer text - 1
    text("1", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - 5
    text("5", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - 1
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    
    // Right button - 5
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    
    
    // Display "Question: 5" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 5", width / 2, 20);
    
}

//______________________________________________________________________________________________________________________________________________________________________________

void question6() {
    background(#2dd3f7); 
    
    // Display question over two lines.
    textAlign(CENTER);
    textSize(24); 
    text("What is the difference between", width / 2, 60);
    text("a for and a while loop?", width / 2, 85);
    
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer text - A for loop has a start point
    text("A for loop has a start point", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - A while loop has a start point
    text("A while loop has a start point", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - A for loop has a start point
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - A while loop has a start point
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 6" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 6", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question7() {
    background(#2dd3f7); // Redraw background
    
    // Display question over two lines
    textAlign(CENTER);
    textSize(24); 
    text("What's the difference between", width / 2, 50);
    text("parameters and arguments?", width / 2, 75);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 300; 
    
    
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer : Parameters are for class constructors
    text("Parameters are for", buttonX + buttonWidth / 2, answerTextY);
    text("class constructors", buttonX + buttonWidth / 2, answerTextY + 20);
    
    // Right answer text : Parameters are for functions
    text("Parameters are for", rightButtonX + buttonWidth / 2, answerTextY);
    text("functions", rightButtonX + buttonWidth / 2, answerTextY + 20);
    
    // Left button : Parameters are for class constructors
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button : Parameters are for functions
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 7" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 7", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question8() {
    background(#2dd3f7); // Redraw background
    
    // Display question over two lines
    textAlign(CENTER);
    textSize(24);
    text("What is the difference between", width / 2, 50);
    text("a Class and an Object?", width / 2, 75);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 340; 
    
    textSize(18); 
    fill(255); 
    
    // Left answer : A class is the product while the Object is a blueprint
    text("A class is the product", buttonX + buttonWidth / 2, answerTextY);
    text("while the Object", buttonX + buttonWidth / 2, answerTextY + 20);
    text("is a blueprint", buttonX + buttonWidth / 2, answerTextY + 40);
    
    // Right answer : A class is a blueprint while the Object is the product
    text("A class is a blueprint", rightButtonX + buttonWidth / 2, answerTextY);
    text("while the Object", rightButtonX + buttonWidth / 2, answerTextY + 20);
    text("is the product", rightButtonX + buttonWidth / 2, answerTextY + 40);
    
    // Left button : A class is the product while the Object is a blueprint
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button : A class is a blueprint while the Object is the product
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 8" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 8", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question9() {
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("Why use multiple tabs for each class in Processing?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer text - For clarity purpose
    text("For clarity purpose", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - Because I get graded for it :)
    text("Because I get graded for it :)", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - For clarity purpose
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - Because I get graded for it :)
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 9" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 9", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question10() {
    background(#2dd3f7); 
    
    
    textAlign(CENTER);
    textSize(24); 
    text("What's the difference between Array and ArrayList?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 200; 
    buttonY = 300; 
    
    
    textSize(18); 
    fill(255); 
    
    // Left answer text : Array has a defined size and ArrayList grows as you add values
    textAlign(CENTER);
    text("Array has a defined size", buttonX + buttonWidth / 2, answerTextY);
    text("and", buttonX + buttonWidth / 2, answerTextY + 20);
    text("ArrayList grows as you add values", buttonX + buttonWidth / 2, answerTextY + 40);
    
    // Right answer text : Array and ArrayList are the same
    text("Array and ArrayList", rightButtonX + buttonWidth / 2, answerTextY);
    text("are the same", rightButtonX + buttonWidth / 2, answerTextY + 20);
    
    // Left button : Array has a defined size and ArrayList grows as you add values
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    
    // Right button : Array and ArrayList are the same
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight);
    
    // Display "Question: 10" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 10", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question11() {
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is the syntax of an ArrayList?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer text - int[] numbers = new int[];
    text("int[] numbers = new int[];", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - ArrayList<Type>()
    text("ArrayList<Type>()", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - int[] numbers = new int[];
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - ArrayList<Type>()
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 11" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 11", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question12() {
    background(#2dd3f7); 
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is a PVector?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 200; 
    buttonY = 300; 
    
    
    textSize(18); 
    fill(255); 
    
    // Left answer text : An Object that can contain an x and y value
    textAlign(CENTER);
    text("An Object that can contain", buttonX + buttonWidth / 2, answerTextY);
    text("an x and y value", buttonX + buttonWidth / 2, answerTextY + 20);
    
    // Right answer text : An object that can contain multiple values
    text("An object that can contain", rightButtonX + buttonWidth / 2, answerTextY);
    text("multiple values", rightButtonX + buttonWidth / 2, answerTextY + 20);
    
    // Left button - An Object that can contain an x and y value
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - An object that can contain multiple values
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 12" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 12", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question13() {
    background(#2dd3f7); // Redraw background
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is a nested loop?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer text - A loop after another loop
    text("A loop after another loop", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - A loop inside another loop
    text("A loop inside another loop", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - A loop after another loop
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - A loop inside another loop
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 13" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 13", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question14() {
    background(#2dd3f7); // Redraw background
    
    // Display question over two lines
    textAlign(CENTER);
    textSize(24); 
    text("What to use if you need", width / 2, 50);
    text("something to run every frame?", width / 2, 75);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); 
    fill(255); 
    
    // Left answer text - draw()
    text("draw()", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - millis()
    text("millis()", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - draw()
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - millis()
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 14" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 14", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question15() {
    background(#2dd3f7); // Redraw background
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is the difference between int & float?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); // Use the common text size for answers
    fill(255); 
    
    // Left answer text - int has no decimals
    text("int has no decimals", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - float has no decimals
    text("float has no decimals", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - int has no decimals
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - float has no decimals
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 15" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 15", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question16() {
    background(#2dd3f7); // Redraw background
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is a global variable?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 200; 
    buttonY = 300; 
    
    
    textSize(18); 
    fill(255); 
    
    // Left answer text : A variable declared outside of everything
    textAlign(CENTER);
    text("A variable declared", buttonX + buttonWidth / 2, answerTextY);
    text("outside of everything", buttonX + buttonWidth / 2, answerTextY + 20);
    
    // Right answer text : A variable declared in the global class
    text("A variable declared", rightButtonX + buttonWidth / 2, answerTextY);
    text("in the global class", rightButtonX + buttonWidth / 2, answerTextY + 20);
    
    // Left button - A variable declared outside of everything
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - A variable declared in the global class
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 16" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 16", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question17() {
    background(#2dd3f7); // Redraw background
    
    // Display question over two lines
    textAlign(CENTER);
    textSize(24); 
    text("When would you use a global variable", width / 2, 50);
    text("over a local variable?", width / 2, 75);
    
    // Set to change the buttons coord
    answerTextY = 200; 
    buttonY = 300; 
    
    
    textSize(18); 
    fill(255); 
    
    // Left answer text : To not lose my local variable
    textAlign(CENTER);
    text("To not lose my", buttonX + buttonWidth / 2, answerTextY);
    text("local variable", buttonX + buttonWidth / 2, answerTextY + 20);
    
    // Right answer text : To access the variable in multiple locations
    text("To access the variable", rightButtonX + buttonWidth / 2, answerTextY);
    text("in multiple locations", rightButtonX + buttonWidth / 2, answerTextY + 20);
    
    // Left button - To not lose my local variable
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - To access the variable in multiple locations
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 17" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 17", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question18() {
    background(#2dd3f7); // Redraw background
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What does || mean as a logical operator?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); // Use the common text size for answers
    fill(255); 
    
    // Left answer text - Or
    text("Or", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - And
    text("And", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - Or
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - And
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 18" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 18", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question19() {
    background(#2dd3f7); // Redraw background
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is the dist() function?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 200; 
    buttonY = 300; 
    
    
    textSize(18); 
    fill(255); 
    
    // Left answer text : It gets the vector between 2 points
    textAlign(CENTER);
    text("It gets the vector", buttonX + buttonWidth / 2, answerTextY);
    text("between 2 points", buttonX + buttonWidth / 2, answerTextY + 20);
    
    // Right answer text : It calculates the distance between 2 points
    text("It calculates the distance", rightButtonX + buttonWidth / 2, answerTextY);
    text("between 2 points", rightButtonX + buttonWidth / 2, answerTextY + 20);
    
    // Left button - It gets the vector between 2 points
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - It calculates the distance between 2 points
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 19" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 19", width / 2, 20);
}

//______________________________________________________________________________________________________________________________________________________________________________

void question20() {
    background(#2dd3f7); // Redraw background
    
    // Display question
    textAlign(CENTER);
    textSize(24); 
    text("What is the superior bird?", width / 2, 60);
    
    // Set to change the buttons coord
    answerTextY = 220; 
    buttonY = 260; 
    
    
    textSize(answerTextSize); // Use the common text size for answers
    fill(255); 
    
    // Left answer text - Any other bird
    text("Any other bird", buttonX + buttonWidth / 2, answerTextY);
    
    // Right answer text - Ducks!
    text("Ducks!", rightButtonX + buttonWidth / 2, answerTextY);
    
    // Left button - Any other bird
    if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(buttonX, buttonY, buttonWidth, buttonHeight); 
    
    // Right button - Ducks!
    if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
        fill(150); // Darker grey when hovering
    } else {
        fill(200); // Regular grey
    }
    rect(rightButtonX, buttonY, buttonWidth, buttonHeight); 
    
    // Display "Question: 20" at the top center
    fill(0);
    textSize(16);
    textAlign(CENTER);
    text("Question: 20", width / 2, 20);
}



void result() {
    background(#2dd3f7); // Redraw background
    
    // Display result based on difficulty and score
    textSize(32); // Larger text size for the result message
    textAlign(CENTER);
    
    // Display the player's score prominently
    text("Your Score: " + score, width / 2, 100); // Position the score at the top
    
    if (difficulty == 2) { // Teacher
        if (score > 17) {
            text("Congrats " + playerName + ", you have passed the test!", width / 2, height / 2);
            text("Would you like to restart?", width / 2, height / 2 + 40);
        } else {
            text("Sorry, " + playerName + ". Good luck next time.", width / 2, height / 2);
        }
    } else if (difficulty == 1) { // Student
        if (score > 10) {
            text("Good Job " + playerName + ", you got this!", width / 2, height / 2);
        } else {
            text("Nice try, " + playerName + ". Don't feel too bad, you got this!", width / 2, height / 2);
        }
    }
    
    // Draw restart button
    fill(200);
    rectMode(CENTER);
    rect(width / 2, height - 60, 120, 40);
    fill(0);
    text("Restart", width / 2, height - 55);
    
    
}

//______________________________________________________________________________________________________________________________________________________________________________

void restartQuiz() {
    currentQuestion = 0;  // Reset to the title screen
    difficulty = 0;       // Reset difficulty
    score = 0;            // Reset score
    playerName = "";         // Clear the entered name, if you want to reset it as well
    
    background(#2dd3f7);
}

//______________________________________________________________________________________________________________________________________________________________________________

void mousePressed() {
    
    //This was used to troubleshoot a few of the issues i ran into
    // println("Mouse X is: " + mouseX);
    // println("Mouse Y is: " + MouseY);
    // println("Difficulty is: " + difficulty);
    // println("We are on question: " + currentQuestion);
    // println("Your score is: " + score);
    
    
    // Check if on the title screen
    if (currentQuestion == 0) {
        // Teacher button
        if (duckX >= 35 && duckX <= 135 && duckY >= 375 && duckY <= 425) {
            difficulty = 2;
            // Go to question 1
            currentQuestion = 1; 
        }
        // Student button
        if (duckX >= 387 && duckX <= 487 && duckY >= 375 && duckY <= 425) {
            difficulty = 1;
            // Go to question 1
            currentQuestion = 1; 
        }
        // How to play button 
        if (mouseX >= width - 60 - 15 && mouseX <= width - 60 + 15 && mouseY >= 50 - 15 && mouseY <= 50 + 15) {
            // Go to "How to Play" screen
            currentQuestion = -1; 
        }
        
        //Check if we are on HowToPlay
    } else if (currentQuestion == -1) {
        // Check if the click is within the back arrow button
        if (mouseX >= 30 && mouseX <= 70 && mouseY >= 30 && mouseY <= 70) {
            // Change back to title page
            currentQuestion = 0; 
        }
        
        
        //To check if on question 5 (it need a mouse click)
    }   else if (currentQuestion == 5) {
        println(" The answer is 5 ");
        
        
        //To check if we are on result screen
    } else  if (currentQuestion == 21) { 
            // Restart button
            if (mouseX > 256 && mouseX < 256 + 120 && mouseY > 400 && mouseY < 400 + 50) {
                restartQuiz();
            }
    }
    
    
    
    //To check if you have clicked on the text box to allow you to type
    if (mouseX > nameInput.x && mouseX < nameInput.x + nameInput.w &&  mouseY > nameInput.y && mouseY < nameInput.y + nameInput.h) {
        nameInput.setActive(true);
    } else {
        nameInput.setActive(false);
    }
    
    
}

//______________________________________________________________________________________________________________________________________________________________________________

void keyPressed() {
    //To allow typing in the textbox and to allow deleting 
    if (keyCode == BACKSPACE) {
        nameInput.backspace();
    } else if (key != CODED) {
        nameInput.addChar(key);
    }
    
    
    //To select answer with space bar once duck is on the answer
    if (key == ' ') {
        
        
        
        //Check if on titlePage
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
            
            if (mouseX >= width - 60 - 15 && mouseX <= width - 60 + 15 && mouseY >= 50 - 15 && mouseY <= 50 + 15) {
                currentQuestion = -1; // Change to "How to Play" screen
            }
            
            
            //Check if on How to play
        } else if (currentQuestion == -1) {
            // Check if the mouse is within the back arrow button
            if (mouseX >= 30 && mouseX <= 70 && mouseY >= 30 && mouseY <= 70) {
                currentQuestion = 0; // Change back to title page
            }
            
            
            
            
            
            
            //Check if on Question 1
        } else if (currentQuestion == 1) {
            // Left button (rect)
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 2; // Go to question 2
            }
            // Right button (ellipse)
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 2; // Go to question 2
                score = score + 1;
            }
            //--------------------------------------------------------------------------------------------------------------------------------------
            //Check if on question 2
        } else if (currentQuestion == 2) {
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 3;
                score = score + 1;
            }
            
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 3;
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 3
        } else    if (currentQuestion == 3) {
                // Noise button (top button)
                int noiseButtonY = height / 2 - 30; 
                if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= noiseButtonY && duckY <= noiseButtonY + buttonHeight) {
                    currentQuestion = 4; // Go to question 4
                    score = score + 1;
            }
            // Random button (bottom button)
            int randomButtonY = height - 50; 
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= randomButtonY && duckY <= randomButtonY + buttonHeight) {
                currentQuestion = 4; // Go to question 4
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 4
        }   else if (currentQuestion == 4) {
            // Left button
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 5; // Go to question 5
                score = score + 1;
            }
            // Right button
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 5; // Go to question 5
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 5
        }   else if (currentQuestion == 5) {
            println(" The answer is 5 ");
            // Left button
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                // Logic for what happens when the left button in question 5 is clicked
                currentQuestion = 6;
            }
            // Right button
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                // Logic for what happens when the right button in question 5 is clicked
                currentQuestion = 6;
                score = score + 1;
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 6
        } else if (currentQuestion == 6) {
            // Left button - Parameters are for class constructors
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 7; // Go to question 7
                score = score + 1;
            }
            // Right button - Parameters are for functions
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 7; // Go to question 7
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 7
        } else if (currentQuestion == 7) {
            // Left button - Parameters are for class constructors
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 8; // Go to question 8
                score = score + 1;
            }
            // Right button - Parameters are for functions
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 8; // Go to question 8
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 8
        } else if (currentQuestion == 8) {
            // Left button - A class is the product while the Object is a blueprint
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 9; // Go to question 9
            }
            // Right button - A class is a blueprint while the Object is the product
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 9; // Go to question 9
                score = score + 1;
            }
            //--------------------------------------------------------------------------------------------------------------------------------------       
            //Check if on question 9
        } else  if (currentQuestion == 9) {
                // Left button - For clarity purpose
                if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                    currentQuestion = 10; // Go to question 10
                    score = score + 1;
            }
            // Right button - Because I get graded for it :)
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 10; // Go to question 10
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 10
        } else  if (currentQuestion == 10) {
                // Left button - Array has a defined size and ArrayList grows as you add values
                if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                    currentQuestion = 11; // Go to question 11
                    score = score + 1;
            }
            // Right button - Array and ArrayList are the same
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 11; // Go to question 11
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 11
        } else if (currentQuestion == 11) {
            // Left button - int[] numbers = new int[];
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 12; // Go to question 12
            }
            // Right button - ArrayList<Type>()
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 12; // Go to question 12
                score = score + 1;
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 12
        } else if (currentQuestion == 12) {
            // Left button - An Object that can contain an x and y value
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 13; // Go to question 13
                score = score + 1;
            }
            // Right button - An object that can contain multiple values
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 13; // Go to question 13
            }
            //--------------------------------------------------------------------------------------------------------------------------------------       
            //Check if on question 13
        } else if (currentQuestion == 13) {
            // Left button - A loop after another loop
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 14; // Go to question 14
            }
            // Right button - A loop inside another loop
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 14; // Go to question 14
                score = score + 1;
            }
            
            //--------------------------------------------------------------------------------------------------------------------------------------       
            //Check if on question 14
        } else if (currentQuestion == 14) {
            // Left button - draw()
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 15; // Go to question 15
                score = score + 1;
            }
            // Right button - millis()
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 15; // Go to question 15
            }
            //--------------------------------------------------------------------------------------------------------------------------------------       
            //Check if on question 15
        } else if (currentQuestion == 15) {
            // Left button - int has no decimals
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 16; // Go to question 16
                score = score + 1;
            }
            // Right button - float has no decimals
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 16; // Go to question 16
            }
            //--------------------------------------------------------------------------------------------------------------------------------------       
            //Check if on question 16
        } else if (currentQuestion == 16) {
            // Left button - A variable declared outside of everything
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 17; // Go to question 17
                score = score + 1;
            }
            // Right button - A variable declared in the global class
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 17; // Go to question 17
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 17
        } else if (currentQuestion == 17) {
            // Left button - To not lose my local variable
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 18; // Go to question 18
            }
            // Right button - To access the variable in multiple locations
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 18; // Go to question 18
                score = score + 1;
                
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 18
        } else if (currentQuestion == 18) {
            // Left button - Or
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 19; // Go to question 19
            }
            // Right button - And
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 19; // Go to question 19
                score = score + 1;
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 19
        } else if (currentQuestion == 19) {
            // Left button - It gets the vector between 2 points
            if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 20; // Go to question 20
            }
            // Right button - It calculates the distance between 2 points
            if (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                currentQuestion = 20; // Go to question 20
            }
            //--------------------------------------------------------------------------------------------------------------------------------------        
            //Check if on question 20
        } else if (currentQuestion == 20) {
            // Check if either of the buttons is clicked using duckX and duckY
            if ((duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) || 
               (duckX >= rightButtonX && duckX <= rightButtonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight)) {
                currentQuestion = 21; // Transition to the result screen
            }
            //--------------------------------------------------------------------------------------------------------------------------------------
            //Check if on Result Screen
        } else  if (currentQuestion == 21) { // Assuming 21 is the result screen number
                // Restart button
                if (duckX >= buttonX && duckX <= buttonX + buttonWidth && duckY >= buttonY && duckY <= buttonY + buttonHeight) {
                    restartQuiz(); // Restart the quiz
                }
            else if (currentQuestion == 21) { 
                // Restart button
                if (duckX > 256 && duckX < 256 + 120 && 
                    duckY > 400 && duckY < 400 + 50) {
                    restartQuiz();
                }
            }
        }
    }    
}

//Function to stop movement for both vertical and horizontal
void keyReleased() {
    if (key == 'w' || key == 's' || keyCode == UP || keyCode == DOWN) {
        ySpeed = 0; 
    }
    if (key == 'a' || key == 'd' || keyCode == LEFT || keyCode == RIGHT) {
        xSpeed = 0; 
    }
}


//Function to create the ripples
void createRipple(ArrayList<WaterRipple> ripples) {
    ripples.add(new WaterRipple(duckX, duckY));
}



