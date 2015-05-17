class Node{
  
float nodeSize = 10;  // Size of Node
float edgeWeight = 2; // Size of wire
color nodeColor = color(180); 
color edgeColor =  color(250); 

int level;       // Indexes nBox[]
float x,y,z; 
Node Left;       // If not branch, then L=R
Node Right; 
boolean isbNode; // Is node a branch?
boolean isLeaf;  // Is node a leaf?


Node(float xInit, float yInit, float zInit, boolean isB, boolean isL){
  x=xInit; 
  y=yInit;
  z=zInit;
  isbNode = isB;
  isLeaf = isL; 
  level = 0;
} 

void setX(float xNum){x=xNum;}
void setY(float yNum){y=yNum;}
void setZ(float zNum){z=zNum;}
void setL(Node lNode){Left=lNode;}
void setR(Node rNode){Right=rNode;}
void setIsBNode(boolean bNode){isbNode = bNode;}
void setIsLeaf(boolean leaf){isLeaf = leaf;}
void setNLvl(int lvl){level=lvl;}

void drawN(){ // Render node
  fill(nodeColor);
  stroke(edgeColor);
  translate(x,y,z);
  box(nodeSize);
  translate(-x,-y,-z); // Restore Coords
}

void drawTo(String cmd){ // Render line to L/R node pos
  strokeWeight(edgeWeight); 
  stroke(edgeColor); 
  if(cmd=="L"){
    line(this.x,this.y,this.z,Left.x,Left.y,Left.z); 
  }
  else if(cmd=="R"){
    line(this.x,this.y,this.z,Right.x,Right.y,Right.z); 
  }
  else if(cmd=="LR"){
    line(this.x,this.y,this.z,Left.x,Left.y,Left.z); 
    line(this.x,this.y,this.z,Right.x,Right.y,Right.z); 
  }
}

} // Ends Class
