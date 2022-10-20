import 'package:flutter/material.dart';
import 'package:pharma/api/serviceApi.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailControler = TextEditingController();
    TextEditingController passControler = TextEditingController();
    var setApi = ServiceApi();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Connexion",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
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
            SizedBox(height: 10.0),
            CustomButton(
                textButton: "Sign In",
                onPressed: () {
                  if (emailControler.text.isEmpty || passControler.text.isEmpty)
                    errorDialogueCard("Erreur",
                        "Entrez un e-mail address et password svp.", context);
                  else
                    setApi.getLogin(
                        email: emailControler.text,
                        pass: passControler.text,
                        context: context);
                }),
            SizedBox(height: 10.0),
            TextButton(
              child: Row(
                children: <Widget>[
                  Text("Avez vouz un compte ?           ",
                      style: TextStyle(color: Colors.black)),
                  Text(" Register",
                      style: TextStyle(color: Colors.red, fontSize: 15))
                ],
              ),
              onPressed: () => pushNewPage(SignupPage(), context),
            )
          ],
        ),
      ),
    );
  }
}
