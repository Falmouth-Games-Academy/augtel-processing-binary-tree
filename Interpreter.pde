public class Interpreter{
  
  // top down - left to right list of chars from morse code.
  /*
  private char[] characters = {
    '*','e', 't', 
    'i', 'a', 'n', 'm', 
    's', 'u', 'r', 'w', 'd', 'k', 'g', 'o', 
    'h', 'v', 'f', '-', 'l', '-', 'p', 'j', 'b', 'x', 'c', 'y', 'z', 'q', '-', '-',
    '5', '4', '-', '3', '-', '-', '-', '2', '&', '-', '+', '-', '-', '-', '-', '-',
    '6', '-', '/', '-', '-', '-', '-', '-', '7', '-', '-', '-', '8', '-', '9', '0'
   };
   */
   
   private char[] characters = {
     '*','E', 'T', 
    'I', 'A', 'N', 'M', 
    'S', 'U', 'R', 'W', 'D', 'K', 'G', 'O', 
    'H', 'V', 'F', '-', 'L', '-', 'P', 'J', 'B', 'X', 'C', 'Y', 'Z', 'Q', '-', '-',
    '5', '4', '-', '3', '-', '-', '-', '2', '&', '-', '+', '-', '-', '-', '-', '-',
    '6', '-', '/', '-', '-', '-', '-', '-', '7', '-', '-', '-', '8', '-', '9', '0'
   
   };
   
  // point of entry for the recursive binary tree. 
  Node root; 
 
  Interpreter(){
    
    this.loadCharacters();
  }
  
  public void draw(){
    this.root.draw();
  }
  
  public void interpretPath(){
    this.root.interpret();
  }
  
  public void displayCurrent(){
    stroke(0, 230, 0, 120);
    text("Current Character: " + Node.getDestination(), 100, 40);
  }
  
  public void insert(char c){
    Node.insert(c);
    root.interpret();
  }
  
  // loop through the array and add the char as nodes (see layout diagram)
  private void loadCharacters(){
  
    int totalChars = characters.length;
    int increment = totalChars + 1;
    int offset = increment / 2; 
  
    int currentChar = 0;
    int horizontalStepCount = 0;
    int verticalStepCount  = 0;
    
    while(currentChar < totalChars){
      
      //calculate index
      int index = offset + (increment * horizontalStepCount);
      
      if (root == null){
        // create root
        root = new Node(null, characters[currentChar], index, 0);
      }else{
          
        // create new node 
        // (don,t forget calculations are done in real numbers and need -1 to bring down to zero)
        this.root.addNode(characters[currentChar], index);
      }
      
      horizontalStepCount++;    //Move things along
      currentChar++;    
      
      // set boundary
      int boundary = totalChars-offset;
      
      // check boundary
      if (index > boundary){
          // RESET
          increment = increment / 2;
          offset = increment / 2; 
          verticalStepCount++;
          horizontalStepCount = 0;
      }    
    }
  }
}