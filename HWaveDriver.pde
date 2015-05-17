//import peasy.*;
//PeasyCam cam;

int diamondSize=15;
Node[][] tree1;
Node[][] tree2;
GraphOp op1;
GraphOp op2;
float theta = 0; // Variable for controlling wave
float delTheta = .01; // Rate of change of variable (radians); controls frequency

void setup(){
  size(600,600,OPENGL);
  lights(); 
  camera(2300,4200,2200,0,2500,0,0,0,-1);
  //cam = new PeasyCam(this,100);  
  
  
  NodeManager manager1=new NodeManager(diamondSize,100);  // Number of levels/Hex length
  manager1.seed(0,0,0);
  manager1.createTree();
  tree1=manager1.getCoords(); 
  
  NodeManager manager2=new NodeManager(diamondSize,100);  // Number of levels/Hex length
  manager2.seed(0,0,100);
  manager2.createTree();
  tree2=manager2.getCoords();
  
  op1 = new GraphOp(tree1,diamondSize,100);
  op1.initialize();
  op2 = new GraphOp(tree2,diamondSize,100);
  op2.initialize();
}

void draw(){
  background(0);
  drawAxes();
  
  
  op1.calcZ(theta);  // Calculate z coords
  op1.setZCoords(tree1,op1.getZ(),0);  // Set tree's z choords
  op1.drawTree();  // Draw tree 
  
  /*
  op2.calcZ(theta);  // Calculate z coords
  op2.setZCoords(tree2,op2.getZ(),100);  // Set tree's z choords
  op2.drawTree();  // Draw tree
  */
  theta+=delTheta;
}


//======================================================
// Axes
//======================================================
void drawAxes(){
 textSize(15);
 strokeWeight(2);
 
 stroke(250,0,0);  // Red z-axis
 line(0,0,0,0,0,80);
 pushMatrix();
 text("Z",0,0,80);
 popMatrix();
 
 stroke(0,250,0);  // Green x-axis
 line(0,0,0,80,0,0);
 pushMatrix();
 text("X",80,0,0);
 popMatrix();
 
 stroke(0,0,250);  // Blue y-axis
 line(0,0,0,0,80,0);
 pushMatrix();
 text("Y",0,80,0);
 popMatrix();
 noStroke();
}

/* Q.What is the goal? 
   A. Emulate Reuben Margolin's "Nebula". Understand it mathematically. Code it. Build it. 
   
   Q.What did I learn?
   A. First, it is crucial to define the scope/behavior of the program. In this case, I needed
      to know exactly what I wanted the model to do. I needed to understand what it was suppose to 
      do. The point of coding was to see how it'll look. I needed to derive a mathematical description 
      (in this case, geometric formulas) of the behavior. The things said below for coding applies to 
      the mathematical analysis of the behavior; you break it down and try to derive mathematical descriptions
      for which coding may be simple. 
      
      When trying to construct a model with code, break down the model into smaller systems if possible. 
      Understand how the smaller systems work together to produce the desired behavior. Divy up behavior
      into smaller and smaller tasks, making sure that, for each partition, you have a clear idea of what 
      the subsystem will do. (Thus the compromise of breaking a complex behavior into codable 
      behavior is (1) increased specificity and (2) number of sub-systems to consider increases). 
      
      Once you break the behavior down to a manageable level, you consider the implementation of each
      subsystem. Variables, Data structure, Code efficiency, Organization. You need to consider the implementation
      of these subsystems across ALL subsystems. In this case: subroutines to generate hex grid (gennbN(),setnbNCoords())
      Before I coded this in processing, I tried to consider alternative languages. I found processing to be 
      flexible at the time. 
      
*/
