class MonTexte{
String texte1, texte2;
color couleur;
PFont font;
MonTexte(){
 texte1 = "Menu";
 texte2 = "Quitter";
 couleur = color(0);
 font = loadFont("HelveticaNeue-Light-12.vlw");
 

}

void update(String _texte1, String _texte2){
texte1 = _texte1;
texte2 = _texte2;
}


void display(){
  textFont(font, 12);
  fill(255);
  text(texte1,670, 40);
  
  textFont(font, 12);
  fill(255);
  text(texte2,1180, 40);


}

}
