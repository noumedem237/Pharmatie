import 'package:flutter/material.dart';
import 'package:pharma/api/serviceApi.dart';
import 'package:pharma/data/data.dart';
import 'package:pharma/models/models.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String userIsconnected;
  const HomeScreen({Key key, this.userIsconnected}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProduitModels> _produitList;
  var serviceApi = ServiceApi();
  @override
  void initState() {
    getListProduit(produitList);
    serviceApi.getPing(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(userIsconnected: widget.userIsconnected),
      backgroundColor: Colors.white70.withOpacity(1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "E-Pharma",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(widget.userIsconnected == null
                  ? Icons.person_add_alt
                  : Icons.person),
              onPressed: () async {
                var pref = await SharedPreferences.getInstance();
                pushNewPage(
                    widget.userIsconnected == null
                        ? SigninPage()
                        : UserAccountScreen(
                            emailUser: pref.getString("e_mailUtilisateur")),
                    context);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CustomSearchButton(
                produitList: _produitList,
                userIsconnected: widget.userIsconnected),
            SizedBox(height: 15.0),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderCategorie(textCategrie: "Produits Populaire"),
                  CustomCard1(
                      produitList: _produitList,
                      userIsconnected: widget.userIsconnected),
                  SizedBox(height: 15.0),
                  HeaderCategorie(textCategrie: "Tous les Produits"),
                  ProduitCard2(
                      produitList: _produitList,
                      userIsconnected: widget.userIsconnected),
                  //display ici les produit venant du serveur
                  // ProduitCard2(
                  //     produitList: [], userIsconnected: widget.userIsconnected)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getListProduit(var produitList) {
    _produitList = produitList;
  }
}
