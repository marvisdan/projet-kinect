class Btn 
{
PVector location;
int mWidth, mHeight;
int alpha;
int id;
int speed;
// constructeur
Btn(float x, float y, int _mWidth, int _mHeight ,int _id, int _speed) {

  location = new PVector(x, y);
  mWidth = _mWidth;
  mHeight = _mHeight;
  alpha = 0;   
  id = _id;
  speed = _speed;
 }


void display() 
{
  colorMode(RGB);
  //stroke(58,193,98);
  //fill(0, alpha);
  noFill();
  rect(location.x, location.y, mWidth, mHeight);
}

void isHit()
{
  
  if (alpha <255)
  {
    alpha+= speed;
    
    
     
  } else if (alpha >= 255)
    {
      
    println("hit" + random(1));
    console.updateMessage(str(id));
    console.testCombinaison();
    alpha= 0; // pour rendre
    
    }

}



void isNotHit()
{
  if(alpha >1){
   alpha-= speed;
  }
}
}

