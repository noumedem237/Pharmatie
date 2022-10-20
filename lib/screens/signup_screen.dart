import 'package:flutter/material.dart';
import 'package:pharma/api/serviceApi.dart';
import 'package:pharma/widgets/widgets.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailControler = TextEditingController();
    TextEditingController passControler = TextEditingController();
    TextEditingController confpassControler = TextEditingController();
    TextEditingController telControler = TextEditingController();
    TextEditingController nomControler = TextEditingController();
    TextEditingController prenomControler = TextEditingController();
    var setApi = ServiceApi();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Créer un compte",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CustomTextField(
              controller: nomControler,
              prefixIcon: Icon(Icons.person_outline),
              hintText: "Nom",
              isPass: false,
            ),
            CustomTextField(
              controller: prenomControler,
              prefixIcon: Icon(Icons.person_add_alt),
              hintText: "Prénom",
              isPass: false,
            ),
            CustomTextField(
              controller: emailControler,
              prefixIcon: Icon(Icons.mail_outline),
              hintText: "E-mail address",
              isPass: false,
            ),
            CustomTextField(
              controller: passControler,
              prefixIcon: Icon(Icons.vpn_key),
              hintText: "Password",
              isPass: true,
            ),
            CustomTextField(
              controller: confpassControler,
              prefixIcon: Icon(Icons.vpn_key),
              hintText: "Confirm password",
              isPass: true,
            ),
            CustomTextField(
              controller: telControler,
              prefixIcon: Icon(Icons.phone),
              hintText: "Téléphone",
              isPass: false,
            ),
            SizedBox(height: 10.0),
            CustomButton(
              textButton: "Sign Up",
              onPressed: () {
                if (emailControler.text.isEmpty ||
                    confpassControler.text.isEmpty ||
                    passControler.text.isEmpty ||
                    telControler.text.isEmpty)
                  errorDialogueCard(
                      "Erreur ! ", "Entrez tous les champs svp.", context);
                else if (passControler.text != confpassControler.text)
                  errorDialogueCard("Erreur ! ",
                      "Les deux mots de passe sont different.", context);
                else
                  setApi.getInscription(
                      email: emailControler.text,
                      pass: passControler.text,
                      telephone: telControler.text,
                      nom: nomControler.text,
                      prenom: prenomControler.text,
                      context: context);
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
