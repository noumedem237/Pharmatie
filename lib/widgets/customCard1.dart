import 'package:flutter/material.dart';
import 'package:pharma/config/config.dart';
import 'package:pharma/models/models.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';

class CustomCard1 extends StatelessWidget {
  final List produitList;
  final String userIsconnected;
  const CustomCard1({Key key, this.produitList, this.userIsconnected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: produitList.length,
        itemBuilder: (_, i) => InkWell(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                elevation: 3.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 190.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(produitList[i].imageProduit)),
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                    SizedBox(
                      width: 190.0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Palette.online,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(produitList[i].nomProduit,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () => pushNewPage(
                DetailProduitPage(
                  isAdmin:
                      (userIsconnected == null || userIsconnected == 'user')
                          ? false
                          : true,
                  produitModels: ProduitModels(
                      indexProduit: produitList[i].indexProduit,
                      imageProduit: produitList[i].imageProduit,
                      categorieProduit: produitList[i].categorieProduit,
                      descriptionComplete: produitList[i].descriptionComplete,
                      nomProduit: produitList[i].nomProduit,
                      petiteDescription: produitList[i].petiteDescription,
                      prixProduit: produitList[i].prixProduit,
                      disponibilite: produitList[i].disponibilite),
                ),
                context)),
      ),
    );
  }
}
