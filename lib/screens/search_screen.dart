import 'package:flutter/material.dart';
import 'package:pharma/config/config.dart';
import 'package:pharma/data/data.dart';
import 'package:pharma/models/models.dart';
import 'package:pharma/screens/screens.dart';
import 'package:pharma/widgets/widgets.dart';

class SearchProduct extends SearchDelegate<ProduitModels> {
  final userIsconnected;

  SearchProduct(this.userIsconnected);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close, color: Colors.black))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final _produitList = query.isEmpty
        ? produitList
        : produitList
            .where(
                (element) => element.nomProduit.startsWith(query.toUpperCase()))
            .toList();
    return _produitList.isNotEmpty
        ? ListView.builder(
            itemCount: _produitList.length,
            itemBuilder: (_, _index) {
              return InkWell(
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
                                  image: AssetImage(
                                      _produitList[_index].imageProduit)),
                              borderRadius: BorderRadius.circular(12.0)),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              _produitList[_index].nomProduit,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              _produitList[_index].petiteDescription,
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
                                          indexProduit:
                                              _produitList[_index].indexProduit,
                                          imageProduit:
                                              _produitList[_index].imageProduit,
                                          categorieProduit: _produitList[_index]
                                              .categorieProduit,
                                          descriptionComplete:
                                              _produitList[_index]
                                                  .descriptionComplete,
                                          nomProduit:
                                              _produitList[_index].nomProduit,
                                          petiteDescription:
                                              _produitList[_index]
                                                  .petiteDescription,
                                          prixProduit:
                                              _produitList[_index].prixProduit,
                                          disponibilite: _produitList[_index]
                                              .disponibilite)),
                                  context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => pushNewPage(
                      DetailProduitPage(
                          isAdmin: (userIsconnected == null ||
                                  userIsconnected == 'user')
                              ? false
                              : true,
                          produitModels: ProduitModels(
                              indexProduit: _produitList[_index].indexProduit,
                              imageProduit: _produitList[_index].imageProduit,
                              categorieProduit:
                                  _produitList[_index].categorieProduit,
                              descriptionComplete:
                                  _produitList[_index].descriptionComplete,
                              nomProduit: _produitList[_index].nomProduit,
                              petiteDescription:
                                  _produitList[_index].petiteDescription,
                              prixProduit: _produitList[_index].prixProduit,
                              disponibilite:
                                  _produitList[_index].disponibilite)),
                      context));
            })
        : Center(child: Text("Nom produit non disponible"));
  }
}
