import 'package:flutter/material.dart';
import 'package:pharma/data/data.dart';

class PharmacieGardeScreen extends StatefulWidget {
  const PharmacieGardeScreen({Key key}) : super(key: key);

  @override
  _PharmacieGardeScreenState createState() => _PharmacieGardeScreenState();
}

class _PharmacieGardeScreenState extends State<PharmacieGardeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Pharmacies de garde",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text:
                        "Tour de garde des pharmacies d'Officielle dans la ville de Maroua ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              SizedBox(height: 15.0),
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        "PERIODES",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        "PHARMACIES DE GARDE",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  for (var u = 0; u < calandierGarde.length; u++)
                    TableRow(children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text(calandierGarde[u]["date"]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0;
                              i < calandierGarde[u]['pharmacies'].length;
                              i++)
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: Text(calandierGarde[u]['pharmacies'][i]),
                            ),
                        ],
                      )
                    ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
