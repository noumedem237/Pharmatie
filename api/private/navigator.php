<?php
require_once('include.php');

// classe gestion des services de l'api
class Navigator
{
    public function getApi($service, $apiKey)
    {
        $bdd = connexionDb();
        $api  = new API();

        if ($apiKey != '4130aec791cae492188d3c22f27cbfb9')
            echo $api->errorApiKey();
        else 
            if (empty($service))
            echo $api->errorService();
        else
            switch ($service) {
                case 'ping':
                    echo $api->ping();
                    break;
                case 'inscription':
                    echo $api->inscription($bdd);
                    break;
                case 'connexion':
                    echo $api->connexion($bdd);
                    break;
                case 'disponibilite':
                    echo $api->setDisponibilitePharmacie($bdd);
                    break;
                default:
                    echo $api->serviceInconnu();
                    break;
            }
    }
}

?>