import 'package:flutter/material.dart';
import 'package:pharma/config/config.dart';
import 'package:pharma/models/models.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';

class ProduitCard2 extends StatelessWidget {
  final List produitList;
  final String userIsconnected;

  const ProduitCard2({Key key, this.produitList, this.userIsconnected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: produitList.length == null ? null : produitList.length - 2,
          itemBuilder: (_, i) => InkWell(
              child: Container(
                height: 90.0,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  children: [
                    Container(
                      width: 90.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage(produitList[i + 2].imageProduit)),
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          produitList[i + 2].nomProduit,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          produitList[i + 2].petiteDescription,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        trailing: MaterialButton(
                          color: Palette.online,
                          child: Text(
                            "Detail",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => pushNewPage(
                              DetailProduitPage(
                                isAdmin: (userIsconnected == null ||
                                        userIsconnected == 'user')
                                    ? false
                                    : true,
                                produitModels: ProduitModels(
                                  indexProduit: produitList[i + 2].indexProduit,
                                  imageProduit: produitList[i + 2].imageProduit,
                                  categorieProduit:
                                      produitList[i + 2].categorieProduit,
                                  descriptionComplete:
                                      produitList[i + 2].descriptionComplete,
                                  nomProduit: produitList[i + 2].nomProduit,
                                  petiteDescription:
                                      produitList[i + 2].petiteDescription,
                                  prixProduit: produitList[i + 2].prixProduit,
                                  disponibilite:
                                      produitList[i + 2].disponibilite,
                                ),
                              ),
                              context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => pushNewPage(
                  DetailProduitPage(
                    isAdmin:
                        (userIsconnected == null || userIsconnected == 'user')
                            ? false
                            : true,
                    produitModels: ProduitModels(
                      indexProduit: produitList[i + 2].indexProduit,
                      imageProduit: produitList[i + 2].imageProduit,
                      categorieProduit: produitList[i + 2].categorieProduit,
                      descriptionComplete:
                          produitList[i + 2].descriptionComplete,
                      nomProduit: produitList[i + 2].nomProduit,
                      petiteDescription: produitList[i + 2].petiteDescription,
                      prixProduit: produitList[i + 2].prixProduit,
                      disponibilite: produitList[i + 2].disponibilite,
                    ),
                  ),
                  context))),
    );
  }
}
