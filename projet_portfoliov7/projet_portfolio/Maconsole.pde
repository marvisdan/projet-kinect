class Maconsole{

String message;
PVector location;
color couleur;
PFont font;


Maconsole(float _x, float _y)
{

location = new PVector( _x, _y);
message = "";
couleur = color(255,255,255);
font =loadFont("ACaslonPro-Bold-32.vlw");
 

}
void testCombinaison(){
/*int compteur= 1;
int images =8;

if(message.equals("1")){ //  methode pour comparer si message ( qui est une chaine de caractere) == 123
compteur = (compteur - 1) % images;
if( compteur <= 1){
  compteur =1;
}
  println("zone activé");
  println("1");
  imageMode(CENTER);
  image( img[compteur], width/2, height/2);
  // utilisation de makeSomeNoise
 // makeSomeNoise("kick.wav");
  println("123");
  //player.play();
  resetMessage();
  println("");
}

else if(message.equals("2")){

compteur = (compteur + 1) % images;
  println("zone activé");
  println("valeur du compteur");
  imageMode(CENTER);
  println(compteur); 
  image( img[compteur], width/2, height/2);
  
}
if(message.equals("321")){

  println("321");
}
 // affiche l'image 1 tout le temps
imageMode(CENTER);
 image( img[compteur], width/2, height/2);// */
}
void resetMessage(){
message = "";
int compteur= 0;
int images =8;
 compteur = (compteur + 1) % images;
 println("valeur du compteur");
  
}

void updateMessage(String _str){
  
String lastCharacter = ""; // init chaine de caractère
if(message.length() > 0 ){ // condition pour savoir si message contient un ou plusieurs caractère
    
    lastCharacter = message.substring( message.length()-1); //substr prends le 1er element,donc s'il ny en a qu'un se sera aussi le dernier 
}
if(lastCharacter.equals( _str)){ // dernier element cliqué
println("derniere zone activée");
} else {
    message = message + _str;
    
}


}
void display(){
 textFont( font, 32);
fill(couleur);
text(message, location.x, location.y);
}



}

