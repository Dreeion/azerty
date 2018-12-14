/***********************************************************/
// Nom du programme : TCDE
// Auteur(s) : Dreion & Daeranil & Hupsy
// Date :12/12/2018
// Version :0.007
///***********************************************************/
// Description du programme :
//===========================
// Un jeu dans l'espace.
/***********************************************************/
 
 
/***********************************************************/
/******************* Entête déclarative ********************/
/***********************************************************/ 



// --- inclusion des librairies utilisées ---


// --- librairie sons ---
import ddf.minim.*;//ù
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// --- déclaration objets ---
int xJoueur;//coordonnée y du joueur
int yJoueur;//coordonnée y du joueur
int vitesse = 15;//vitesse
int yf = 0;//coordonnée y du fond d'écran
int vie;//Vie
PImage joueur;//Skin du joueur
PImage fond;//Fond d'écran
//--- menu ---
PImage jouer;//Bouton "Jouer"
PImage skin;//Bouton "Pilotes"
PImage parametre;//Bouton "Paramètre"
PImage credit;//Boutton "Crédit" 
PImage quitter;//Boutton "Quitter"
PImage update;//
PImage don;//
PImage rarete;//rareté d'un vaisseau 
PImage curseur;//Curseur de la sourie

//--- Ennemis ---
PImage Ennemi1;//5 vies
PImage Ennemi2;//4 vies
PImage Ennemi3;//3 vies
PImage Ennemi4;//2 vies
PImage Ennemi5;//1 vies
PImage Ennemi;
//--- Pilotes --- 
PImage degats;
PImage vies;
PImage maniabilite;
PImage barre;

//--- ---
float fin;
float xEnnemi[]= new float[100];
float yEnnemi[]= new float[100];

float viee[]= new float[100];
float xTir[]= new float[50];
float yTir[]= new float[50];
int j = 10;
int p = 1;
int idCurseur;

 
 
 int idEnnemi = 1;
 int idTir = 1;
 int m;
 int choix = 0;
Minim minim;
AudioSnippet ping;

// --- déclaration variables globales ---

/********************* Fonction SETUP **********************/
// fonction d'initialisation exécutée 1 fois au démarrage
/***********************************************************/

void setup ()
{  

  yTir[1]=-100000;
  // --- initialisation des musiques ---
  minim = new Minim(this);
  ping = minim.loadSnippet("Musique.wav");
  //ping.play();
  
  // --- initialisation fenêtre de base ---
  
  size(500, 1000); // ouvre une fenêtre xpixels  x ypixels
  background(0); // couleur fond fenetre ( noir )
  noCursor();
  // ---- initialisation paramètres graphiques utilisés ---
  

  // --- attributions des variables images ---
  degats = loadImage("data/Images/Menu/button_degats.png");
  vies =loadImage("data/Images/Menu/button_vies.png");
  maniabilite =loadImage("data/Images/Menu/button_vitesse.png");
  barre =loadImage("data/Images/Menu/button (1).png");
  
  fond = loadImage("data/Images/fond/stars.jpg");               //Charger l'image du fond d'écran
  fond.resize(width,height);                               // Taille du fond d'écran 

  joueur = loadImage("data/Images/joueur/joueur"+j+".png");        //Charger l'image du vaisseau du joueur
  joueur.resize(width/8,height/10);                       //Taille du joueur

  Ennemi1 = loadImage("data/Images/Ennemi/Ennemi1.png");       //Charger l'image des ennemis
  Ennemi2 = loadImage("data/Images/Ennemi/Ennemi2.png");       //Charger l'image des ennemis
  Ennemi3 = loadImage("data/Images/Ennemi/Ennemi3.png");       //Charger l'image des ennemis
  Ennemi4 = loadImage("data/Images/Ennemi/Ennemi4.png");       //Charger l'image des ennemis
  Ennemi5 = loadImage("data/Images/Ennemi/Ennemi5.png");       //Charger l'image des ennemis
  Ennemi1.resize(75,75);  
  Ennemi2.resize(75,75);  
  Ennemi3.resize(75,75);  
  Ennemi4.resize(75,75);  
  Ennemi5.resize(75,75);  

  xJoueur=width/2-width/8/2;yJoueur=height-height/10*2;
  nouvelle_Vague();     
}
/********************** Fonction DRAW **********************/
//             fonction exécutée en boucle
/***********************************************************/

void  draw(){
  if (choix==0){
    menu();}
  if (choix==1){
    finVague ();
    fond ();
    ennemis ();
    joueur ();
    tir();
    vie(); 
    debugMod ();
}
  if (choix==2){pilotes();}
  if (choix==3){menu();}
  if (choix==4){menu();}
  if (choix==5){stop();}
  delay (1);
 }
/********************** Fonction STOP **********************/
//          fonction exécutée quand le programme est fermé
/***********************************************************/
void stop () {
  ping.close();
  minim.stop();
  super.stop();
  exit();
}
