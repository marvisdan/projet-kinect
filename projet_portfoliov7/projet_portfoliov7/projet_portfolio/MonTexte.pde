class MonTexte{
String texte1, texte2;
color couleur;
PFont font,font2;
MonTexte(){
 texte2 = "Quitter";
 couleur = color(0);
 font = loadFont("HelveticaNeue-Light-32.vlw");
 font2 = loadFont("HelveticaNeue-Light-16.vlw");

}

void update(String _texte1, String _texte2){
texte1 = _texte1;
texte2 = _texte2;
}


void display(){
  textFont(font, 32);
  fill(255);
  text(texte2,width-250, 60);
  
 
}

}
