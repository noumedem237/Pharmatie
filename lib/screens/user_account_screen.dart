import 'package:flutter/material.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountScreen extends StatelessWidget {
  final String emailUser;
  const UserAccountScreen({Key key, this.emailUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Compte utilisateur",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(emailUser),
              subtitle: Text('**********'),
              trailing: Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
          ),
          Divider(thickness: 20.0),
          Card(
            color: Colors.red,
            child: ListTile(
              title: Text("Déconnexion", style: TextStyle(color: Colors.white)),
              trailing: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onTap: () => getDeconnexion(context),
            ),
          ),
        ],
      ),
    );
  }

  getDeconnexion(var context) async {
    var pref = await SharedPreferences.getInstance();
    pref.remove('idUtilisateur');
    pref.remove('e_mailUtilisateur');
    pref.remove('grade');
    pushNewPageRemoveUntil(HomeScreen(userIsconnected: null), context);
  }
}
