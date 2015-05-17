/* This class provides methods for drawing a matrix of nodes and creating wave. The nodes are assumed to be connected.
*/ 

class GraphOp{
  Node[][] twoD;  // Graph we're working with
  float[] z;
  float[] theta;
  int n;
  float rH; 
  
  float amplitude=300;  // Amplitude of wave, pixels {FIX}
  
  GraphOp(Node[][] newGraph, int nSize,int rHex){
     twoD=newGraph; 
     n=nSize;
     rH=rHex;
     z=new float[4*n];  // We're addressing all levels; 
     theta=new float[4*n];
  }
  
  // Methods to create wave (NOT GENERIC; ONLY WORKS FOR ONE WAVE; CANNOT USE IT TWICE)
  public void initialize(){  // Map each level to a point of a circle
     int j=0;
     theta[0]=0;
     for(int i=1;i<6+4*(n-2);i+=2){
       theta[i]=((.5*rH)+(1.5*rH*j)); // .. .. .. .. .. ..
       theta[i+1]=((j+1)*(1.5*rH)); 
       j++;
     }   
     theta[4*n-1]=(theta[4*n-2]+(.5*rH));  // Anomally(corner case) requiring (PI/(n*rH)) to be done separately
     for(int i=1;i<theta.length;i++){
       theta[i]=theta[i]*(PI/(n*rH)); // .. .. .. .. .. ..
     }   
  }
  
  public void calcZ(float phi){  // Computes z-coords of each level -> z[]
    for(int i=0;i<z.length;i++){
      z[i]=amplitude*sin(phi+theta[i]);   // ADD PHI AFTER INITIALIZATION 
    }
  }
  
  public void setZCoords(Node[][] ar, float[] cords, float zOffset){  // zOffsets enables multiple waves to be animated
     for(int i=0;i<4*n;i++){                                          // Otherwise multiple nodes would be mapped to same z-height
       for(int j=0;j<n+1;j++){
        if(ar[i][j]!=null){
           ar[i][j].setZ(cords[i]+zOffset); 
        }
       } 
     }
  }
  
  public float[] getZ(){  // Outputs z-values for given phi
     return z; 
  }
  
  public void setAmplitude(float amp){
    amplitude=amp; 
  }  
  
  // Methods to draw graph
  public void drawTree(){  
    for(int i=0;i<4*n;i++){  // Row:Col
      for(int j=0;j<n+1;j++){
        if((twoD[i][j]!=null)&&(twoD[i][j].Left!=null)&&(twoD[i][j].Right!=null)){
          twoD[i][j].drawN();
          twoD[i][j].drawTo("LR");
        }
      }    
    }
  }
  
} // Ends GraphOP
