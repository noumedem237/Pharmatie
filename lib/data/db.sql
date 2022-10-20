CREATE TABLE utilisateur(
   idUtilisateur INT(11) NOT NULL AUTO_INCREMENT,
   e_mailUtilisateur VARCHAR(250) NOT NULL,
   grade VARCHAR(85) NOT NULL,
   PRIMARY KEY(idUtilisateur)
);

CREATE TABLE administrateur(
   idUtilisateur INT(11) NOT NULL AUTO_INCREMENT,
   nomAdministrateur VARCHAR(250) NOT NULL,
   prenomAdministrateur VARCHAR(250) NOT NULL,
   PRIMARY KEY(idUtilisateur),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur)
);

CREATE TABLE ProduitPharmaceutique(
   idProduitPharmaceutique INT,
   petiteProduitPharmaceutique VARCHAR(250) NOT NULL,
   desCompleteProduitPharceutique VARCHAR(250) NOT NULL,
   prixProduitPharmaceutique VARCHAR(250) NOT NULL,
   categorieProduitPharmaceutique VARCHAR(70) NOT NULL,
   imageProduitPharmaceutique VARCHAR(250) NOT NULL,
   disponibiliteProduitPhar1 VARCHAR(50) NOT NULL,
   disponibiliteProduitPhar2 VARCHAR(50) NOT NULL,
   disponibiliteProduitPhar3 VARCHAR(50) NOT NULL,
   idUtilisateur INT NOT NULL,
   PRIMARY KEY(idProduitPharmaceutique));

CREATE TABLE pharmacie(
   idPharmacie INT(11) NOT NULL AUTO_INCREMENT,
   nomPharmacie VARCHAR(250) NOT NULL,
   codePostalPharmacie VARCHAR(50),
   idProduitPharmaceutique INT NOT NULL,
   disponibiliteProduit VARCHAR(50) NOT NULL,
   PRIMARY KEY(idPharmacie),
   FOREIGN KEY(idProduitPharmaceutique, disponibiliteProduit) REFERENCES ProduitPharmaceutique(idProduitPharmaceutique, disponibiliteProduit)
);

CREATE TABLE utilisateurMobile(
   idUtilisateur INT(11) NOT NULL AUTO_INCREMENT,
   nomUtilisateurMobile VARCHAR(250) NOT NULL,
   prenomUtilisateurMobile VARCHAR(250) NOT NULL,
   numTel INT NOT NULL,
   idProduitPharmaceutique INT,
   disponibiliteProduit VARCHAR(50),
   PRIMARY KEY(idUtilisateur),
   UNIQUE(idProduitPharmaceutique, disponibiliteProduit),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur)
);
