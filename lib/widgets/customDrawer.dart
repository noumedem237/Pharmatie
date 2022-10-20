import 'package:flutter/material.dart';
import 'package:pharma/screens/pharmacie_garde_screen.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  final userIsconnected;
  const CustomDrawer({Key key, this.userIsconnected}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset("assets/image/epharma.png", height: 200.0),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              "E-Pharma",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          ),
          Divider(thickness: 8.0),
          ListTile(
            leading: Icon(Icons.domain_sharp, color: Colors.red),
            title: Text("Pharmacies de garde"),
            onTap: () => pushNewPage(PharmacieGardeScreen(), context),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Paramètres"),
            onTap: () async {
              var pref = await SharedPreferences.getInstance();
              pushNewPage(
                  widget.userIsconnected == null
                      ? SigninPage()
                      : UserAccountScreen(
                          emailUser: pref.getString("e_mailUtilisateur")),
                  context);
            },
          ),
          Divider(),
          AboutListTile(
            applicationIcon:
                Image.asset("assets/image/epharma.png", height: 100.0),
            applicationLegalese:
                "Application d'assistance pharmacetique (L.S.I)\nENSPM - 2021 ",
            applicationVersion: "1.0.0",
            child: Text("A-propos"),
            icon: Icon(Icons.info_outline, color: Colors.blue),
          ),
          Divider(),
        ],
      ),
    );
  }
}
