class SmartPoint
{
int position = width/2;
int positionY= height/2;
int maxValue;
int closestValue;
PVector currentLocation;
PVector lastLocation;
PVector location;
      
    SmartPoint()
    {
      location = new PVector();
      maxValue = 1000;
      lastLocation = new PVector(0,0);
      currentLocation = new PVector();
    }
    
    // update pour la kinect et le squelette
    void update( PVector v){
      lastLocation.set(v);
                          
    }
    
    void update()
    {
      //location.x = mouseX;
      //location.y = mouseY;
      
           /////avec la kinect//////////
        
        //recuperer la valeur la plus petite, car la plus proche de la kinect et l'attribuer au smartpoint
        closestValue = maxValue;
        int[] depthValues = context.depthMap();
        int mapWidth = context.depthWidth();
        int mapHeight = context.depthHeight();
        for(int y=0; y<mapHeight; y++ ){
          for(int x =0; x<mapWidth ; x++){
              int i = x+ y *mapWidth;
              int currentDepthValue = depthValues[i];// actualiser la valeur de closestvalue a partir de currentvalue
                if(currentDepthValue > 0 && currentDepthValue < closestValue){ 
                  closestValue= currentDepthValue;
                  currentLocation.x = x; // actualisation de la position du point le plus proche de la kinect
                  currentLocation.y = y;
                }
          }
        }
        lastLocation.x = (lastLocation.x + currentLocation.x)/2;
        
        lastLocation.y = ( lastLocation.y+ currentLocation.y)/2;
        lastLocation.x = lastLocation.x *1.5;
      }
       boolean hitTarget(Btn btn)
       {  // on utilise
         
                 if((lastLocation.x>btn.location.x && lastLocation.x < btn.location.x + btn.mWidth) && ( lastLocation.y >btn.location.y && lastLocation.y < btn.location.y + btn.mHeight)){
                return true;
                 }else 
                  {
                  return false;
                  }
       }
      void display()
      {
        
        noStroke();
        fill(255,0,0);
        ellipse(lastLocation.x,lastLocation.y,20,20); 
        
      }
      
      
  
  
      
      void slider()
      {             
                imageMode(CENTER);
                image( img[1], position  , positionY);
                image( img[2], position +1500  , positionY);
                image( img[4], position +3000  , positionY);
                image( img[5], position +4500  , positionY);
                
                
    
      }
      void bouge(){
      
            if ((  lastLocation.x >= 10 && lastLocation.x <= 60) && (  lastLocation.y >= 10 && lastLocation.y <= (height- 30)))
            { 
            position = position +50;
            }
         else if((lastLocation.x >= (width- 60) && lastLocation.x <= (width +500)) && (  lastLocation.y >= 10 && lastLocation.y <= (height- 30)))
            { 
              position = position - 50;
            }
            
           else if(( lastLocation.x >= 600 && lastLocation.x <= 800) && (  lastLocation.y >= 10 && lastLocation.y <= 70) && positionY == height/2)
           {
             smooth();
             positionY = positionY- 1500;// position du menu
  
             
            
             
           }
           
           else if(( lastLocation.x >=1100  && lastLocation.x <= 1300) && (  lastLocation.y >= 10 && lastLocation.y <= 70) && positionY == height/2)
           {
             //positionY = positionY+ 500;
             exit(); 
             //refresh();
          
  
             
            
             
           }
           
           
      }
      
       void refresh()
      {         
                background(0);
                imageMode(CENTER);
                image( img[1], width/2  , height/2);
                image( img[2], width/2 +1500  , height/2);
                image( img[4], width/2 +3000  , height/2);
                image( img[5], width/2 +4500  , height/2);
                
                 redraw();
                
    
      }
        
    }
    

    
    


