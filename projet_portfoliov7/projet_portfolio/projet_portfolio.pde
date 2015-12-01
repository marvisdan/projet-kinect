import SimpleOpenNI.*;

SimpleOpenNI context; // quand j'utilise la kinect
SmartPoint sp;
Btn btn1, btn2,btn3,btn4;
Maconsole console;
MonTexte titre;
PImage [] img;
String message;
int[] userList;



void setup(){
  //fenetre en plein ecran
  size(displayWidth, displayHeight);
  //size(600,500);
  
  context = new SimpleOpenNI(this);
  context.setMirror(true);// effet mirroir
  context.enableDepth();
  context.enableUser();
  
  // instance de classe
  img = new PImage[8];
  
  for( int i = 1; i < 6; i++){
    img[i] = loadImage("image_"+i+".png");
  }
   
  
  sp = new SmartPoint();
  btn1 = new Btn(10,10,50,height-30,1,5);
  btn2 = new Btn(width-40,10,50,height-30,3,5);
  btn3 = new Btn(600,10,200,60,1,5);
  btn4 = new Btn(1100,10,200,60,1,5);
  console = new Maconsole(30,50);
  titre =  new MonTexte();
  
}
void draw()
{ 
  // Le background 
  colorMode(RGB);
  background(55,54,53);
  
  
  context.update(); // mettre avatn le sp.update sinon pas de modif
  userList = context.getUsers();
  
  if(userList.length == 1)
  {
  
      if(context.isTrackingSkeleton(userList[0]))
      {
          int userId = userList[0];
          PVector lefthandVector = new PVector();
          PVector lefthandVector2d = new PVector();
           
         context.getJointPositionSkeleton( userId, SimpleOpenNI.SKEL_LEFT_HAND, lefthandVector);
          context.convertRealWorldToProjective( lefthandVector, lefthandVector2d);
          
        
          sp.update(lefthandVector2d);
          
      }else{
        sp.update();
            }
  }
  
  sp.update();
  //tint(255, 120); // tinté l'opacité des element
  //image(context.depthImage(),0,0);// reinit pour que toutes le formes soit teinté



//afficheImage();
      sp.slider();
     
      sp.bouge();
      
      sp.update();
      sp.display();
      titre.display();
      
      btn1.display();
      btn2.display();
      btn3.display();
      btn4.display();
      titre.display();
      
          // condition des boutons
          if( sp.hitTarget(btn1))
          { // fonction qui renvoie un resultat  vrai ou faux  // donc s'il ya collsion je fais ça...
              
              btn1.isHit(); //
              
      
              
           }else
           {
                  btn1.isNotHit();//
              
           }
            
           
           if( sp.hitTarget(btn2))
          { // fonction qui renvoie un resultat  vrai ou faux  // donc s'il ya collsion je fais ça...
              
              btn2.isHit(); //
            
           }else
           {
              btn2.isNotHit();//
              
              
           }
           
           if( sp.hitTarget(btn3))
          { // fonction qui renvoie un resultat  vrai ou faux  // donc s'il ya collsion je fais ça...
              
              btn3.isHit(); //
              
              
            
           }else
           {
              btn3.isNotHit();//
              
           }
           
           if( sp.hitTarget(btn4))
          { // fonction qui renvoie un resultat  vrai ou faux  // donc s'il ya collsion je fais ça...
              
              btn4.isHit(); //
              
              
            
           }else
           {
              btn4.isNotHit();//
              
           }
           
}

//fonction d'affichage des images

void afficheImage( )
{
   int x=100;
  int position = width/2;
  for ( int i = 1; i < 8 ; i ++ ) 
  { 
    imageMode(CENTER);
    image( img[i], position + x, height/2);
    
    position = position+ x;
  }
  
 }
 
 
 
 
// SimpleOpenNI user events

void onNewUser(SimpleOpenNI curContext,int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  
  context.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext,int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext,int userId)
{
  //println("onVisibleUser - userId: " + userId);
}

