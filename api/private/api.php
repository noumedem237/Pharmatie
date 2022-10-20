<?php

class API
{
    public function ping()
    {
        $message =   array('message' => "Online", 'error' => '0');

        return  json_encode(array($message), JSON_UNESCAPED_UNICODE);
    }
    //Service inscription utilisateur
    public function inscription($bdd)
    {
        $email = $_POST["email"];
        $password = md5($_POST["password"]);
        $grade = $_POST["grade"];
        $nom = $_POST["nom"];
        $prenom = $_POST["prenom"];
        $telephone = $_POST["telephone"];

        $requet1 = 'INSERT INTO `utilisateur`(`idUtilisateur`, 
        `e_mailUtilisateur`, `password`, `grade`) 
        VALUES ("","' . $email . '","' . $password . '","' . $grade . '")';
        $prepare1 = $bdd->prepare($requet1);
        $ins = $prepare1->execute();
        if ($ins === false) {
            $message = array('message' => 'E-mail déjà utiliser .', 'error' => '1');
        } else {
            $requet2 = 'SELECT `idUtilisateur`, `e_mailUtilisateur`,
            `grade` FROM `utilisateur` WHERE `e_mailUtilisateur` ="' . $email . '" AND
            `password` = "' . $password . '"';

            $select = $bdd->prepare($requet2);
            $select->execute();
            $responce = $select->fetchAll(PDO::FETCH_ASSOC);

            if ($grade == 'admin') {
                $requte3 = 'INSERT INTO `administrateur`(`idUtilisateur`,
                 `nomAdministrateur`, `prenomAdministrateur`) VALUES ("' . $responce[0]['idUtilisateur'] . '"
                 ,"' . $nom . '","' . $prenom . '")';
            } else {
                $requte3 = 'INSERT INTO `utilisateurmobile`(`idUtilisateur`, 
            `nomUtilisateurMobile`, `prenomUtilisateurMobile`, `numTel`) 
            VALUES ("' . $responce[0]['idUtilisateur'] . '",
            "' . $nom . '","' . $prenom . '","' . $telephone . '")';
            }

            $preinsertUser = $bdd->prepare($requte3);
            $preinsertUser->execute();

            $message =   array('message' => "Inscription effectué", 'error' => '0');
        }

        return  json_encode(array($message), JSON_UNESCAPED_UNICODE);
    }
    // service connexion utilisateur
    public function connexion($bdd)
    {
        $email = $_POST['email'];
        $password = md5($_POST['password']);

        $connexion = 'SELECT `idUtilisateur`, `e_mailUtilisateur`,
        `grade` FROM `utilisateur` WHERE `e_mailUtilisateur` ="' . $email . '" AND
        `password` = "' . $password . '"';

        $getConnexion = $bdd->prepare($connexion);
        $getConnexion->execute();

        $responce = $getConnexion->fetchAll(PDO::FETCH_ASSOC);
        if (empty($responce)) {
            $message = array('message' => "E-mail ou mot de passe incorrect.", "error" => '1');
        } else {
            $message = array(
                'message' => "Connexion effectué", 'idUtilisateur' => $responce[0]['idUtilisateur'],
                'e_mailUtilisateur' => $responce[0]['e_mailUtilisateur'],
                'grade' => $responce[0]['grade'],
                'error' => '0'
            );
        }
        return json_encode(array($message), JSON_UNESCAPED_UNICODE);
    }

    // service modification disponibilite d'un produit
    public function setDisponibilitePharmacie($bdd)
    {
        $indexProuit = $_POST['indexProduit'];
        $getDispo1 = $_POST['disponibilitePharma1'];
        $getDispo2 = $_POST['disponibilitePharma2'];
        $getDispo3 = $_POST['disponibilitePharma3'];
        $requSet = 'UPDATE `produitpharmaceutique` SET `disponibiliteProduitPhar1`="' . $getDispo1 . '",
        `disponibiliteProduitPhar2`="' . $getDispo2 . '",
        `disponibiliteProduitPhar3`= "' . $getDispo3 . '" 
        WHERE `idProduitPharmaceutique` = "' . $indexProuit . '"';
        $prepare = $bdd->prepare($requSet);
        $getSet = $prepare->execute();
        if ($getSet === false) {
            $message = array('message' => 'Une erreur inconnue s\'est produit 2.', 'error' => '1');
        } else {
            $message =   array('message' => "Effectué", 'error' => '0');
        }

        return  json_encode(array($message), JSON_UNESCAPED_UNICODE);
    }

    //GESTION DES ERREURS DE L'API 
    public function serviceInconnu()
    {
        return json_encode(array(["message" => "serviceInconnu", "error" => "1"]));
    }

    public function errorApiKey()
    {
        return json_encode(array(["message" => "errorApiKey", "error" => "1"]));
    }

    public function errorService()
    {
        return json_encode(array(["message" => "errorService", "error" => "1"]));
    }
}
