class SmartPoint
{
int positionX = width/2;
int positionY= height/2;
int maxValue;
int closestValue;
PVector currentLocation;
PVector lastLocation;
PVector location;
String  legende0= "Place à Amsterdam";
String  legende1= "Métro";
String  legende2= "Soirée UPEM";
String  legende3= "Place publique";
String textfooter1 ="2015-Portfolio Interactive";
String textfooter2 = "Made with love by Marvis DAN";

color couleur = color(0);
PFont fontLegende = loadFont("HelveticaNeue-Light-24.vlw");

      
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
        lastLocation.y = lastLocation.y *1.25;
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
        fill(203,5,75);
        ellipse(lastLocation.x,lastLocation.y,10,10); 
        
      }

      void slider()// fonction d'affichage des images
      {            
        
                imageMode(CENTER);
                image( img[1], positionX  , positionY);
                image( img[2], positionX +1500  , positionY);
                image( img[4], positionX +3000  , positionY);
                image( img[5], positionX+4500  , positionY);
                
                // Aside coté gauche de l'écran
                colorMode(RGB);
                stroke(255);
                fill(0);
                rect(-10, -10, 430, height);
                image( logo[1], 170, 50); // affichage du logo
                image(text, 200, 400);// texte de description
                textFont(fontLegende, 24);
                fill(255);
                text(textfooter1,50, height-50);
                textFont(fontLegende, 24);
                fill(255);
                text(textfooter2,width-350, height-50);

      }
      void bouge(){ // fonction qui permet de faire bouger les images à l'aide des zones de bouton,
                 
      // affichage des fleche blanches
      image( repere[1], 480  , height/2);
      image( repere[2], width-70  , height/2);
      
                
                
            if ((  lastLocation.x >= 0 && lastLocation.x <= 530) && (  lastLocation.y >= 10 && lastLocation.y <= (height- 30)))
            { 
            positionX = positionX +50;
            //image( repere[1], 50  , 5000);
            image( repere[4], 480, height/2);// affichage fleche rouge gauche
            
            }
         else if((lastLocation.x >= (width- 60) && lastLocation.x <= (width+500)) && (  lastLocation.y >= 10 && lastLocation.y <= (height- 30)))
            { 
              positionX = positionX - 50;
              //image( repere[2], width-70  , 5000);
              image( repere[3], width-70  , height/2); // affichage fleche rouge droite
            }
            
          else if( positionX <= -4500 || positionX >= 50) // condition pour revenir à l'image du début
           {
             positionX= width/2 + 200;
           
           }
            
      }
      void positionLegend() // fonction pour afficher les légendes des images
    {
      if( positionX <= 1500  && positionX >= 0)
      {
        
         textFont(fontLegende, 24);
         fill(255);
         text(legende0,(width/2+150), 720);
      
      }
      if( positionX <= 0  && positionX >= -1500)
      {
        
         textFont(fontLegende, 24);
         fill(255);
         text(legende1,(width/2+150), 720);
      
      }
      else if( positionX <= -1500 && positionX >= -3000)
      {
        
         textFont(fontLegende, 24);
         fill(255);
         text(legende2,(width/2+150), 720);
      
      }
      else if( positionX <= -3000 && positionX >= -4500)
      {
        
         textFont(fontLegende, 24);
         fill(255);
         text(legende3,(width/2+150), 720);
      
      }
    
    }
        
    
}

    
    


