import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceApi {
  
  static Uri urlApi() {
    return Uri.parse("http://192.168.5.1/epharma/public/index.php");
  }

  static String keyApi() {
    return "4130aec791cae492188d3c22f27cbfb9";
  }

  // Methode inscription utilisateur dans la base de bonnées
  // et connexion de l'utilisateur.
  getInscription(
      {String email,
      String pass,
      String telephone,
      String nom,
      String prenom,
      var context}) async {
    simpleDialogueCardSansTitle("Traitement en cour ...", context);
    var data = await http.post(ServiceApi.urlApi(), body: {
      "service": 'inscription',
      "key": ServiceApi.keyApi(),
      "email": email,
      "password": pass,
      "grade": "user",
      "nom": nom,
      "prenom": prenom,
      "telephone": telephone,
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      if (response[0]['error'] == '0') {
        getLogin(email: email, pass: pass, context: context);
      } else {
        Navigator.pop(context);
        errorDialogueCard("Erreur !!!", "${response[0]['message']}", context);
      }
    } else if (data.statusCode < 200) {
      Navigator.pop(context);
      errorDialogueCard("Connexion", "Time out !", context);
    }
  }

  //Methode conexion utilisateur a E-pharma
  getLogin({String email, String pass, var context}) async {
    SharedPreferences pref;
    simpleDialogueCardSansTitle("Connexion en cour ...", context);
    var data = await http.post(ServiceApi.urlApi(), body: {
      "service": 'connexion',
      "key": ServiceApi.keyApi(),
      "email": email,
      "password": pass
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      if (response[0]['error'] == '0') {
        pref = await SharedPreferences.getInstance();
        pref.setString('idUtilisateur', "${response[0]['idUtilisateur']}");
        pref.setString(
            'e_mailUtilisateur', "${response[0]['e_mailUtilisateur']}");
        pref.setString('grade', "${response[0]['grade']}");
        pushNewPageRemoveUntil(
            HomeScreen(userIsconnected: pref.getString('grade')), context);
        errorDialogueCard("Connexion", "Connexion effectué!", context);
      } else {
        Navigator.pop(context);
        errorDialogueCard("Erreur !!!", "${response[0]['message']}", context);
      }
    } else if (data.statusCode < 200) {
      Navigator.pop(context);
      errorDialogueCard("Connexion", "Time out !", context);
    }
  }

  setDisponibilite({phar1, phar2, phar3, var context, var indexProduit}) async {
    print('indexProduit $indexProduit');
    print('phar1 $phar1');
    print('phar2 $phar2');
    print('phar3 $phar3');
    simpleDialogueCardSansTitle("Mise à jours en cour ...", context);
    var data = await http.post(ServiceApi.urlApi(), body: {
      "service": 'disponibilite',
      "key": ServiceApi.keyApi(),
      "indexProduit": "$indexProduit",
      "disponibilitePharma1": "$phar1",
      "disponibilitePharma2": "$phar2",
      "disponibilitePharma3": "$phar3",
    });
    if (data.statusCode == 200) {
      Navigator.pop(context);
      var response = jsonDecode(data.body);
      if (response[0]['error'] == '0') {
        errorDialogueCard("Connexion", "${response[0]['message']}", context);
      } else {
        Navigator.pop(context);
        errorDialogueCard("Erreur !!!", "${response[0]['message']}", context);
      }
    } else if (data.statusCode < 200) {
      Navigator.pop(context);
      errorDialogueCard("Connexion", "Time out !", context);
    }
  }

//Methode verification connexion internet
  getPing(var context) async {
    var data;
    try {
      data = await http.post(ServiceApi.urlApi(), body: {
        "service": 'ping',
        "key": ServiceApi.keyApi(),
      });
      if (data.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.green, content: Text('Online')),
        );
      }
    } on SocketException {
      SnackBar(backgroundColor: Colors.red, content: Text('Offline'));
    }
  }
}
