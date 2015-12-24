class MonTexte{
String texte1, texte2;
color couleur;
PFont font,font2;
MonTexte(){
 texte1 = " Interactive portfolio est un interface gestuel et original présentant des photographies autour du thème de la foule. A l’aide d’une caméra Kinect cet interface permet à son  utilisateur de consulter l’ensemble des photographies en  réalisant des mouvements de la main.  ";
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
  textFont(font, 16);
  fill(255);
  text(texte1,50, 40);
  
  textFont(font, 32);
  fill(255);
  text(texte2,1180, 40);
  
 
}

}
