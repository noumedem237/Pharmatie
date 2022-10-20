import 'package:flutter/material.dart';
import 'package:pharma/api/serviceApi.dart';
import 'package:pharma/config/config.dart';
import 'package:pharma/models/models.dart';
import 'package:pharma/widgets/widgets.dart';
import 'package:photo_view/photo_view.dart';

class DetailProduitPage extends StatefulWidget {
  final ProduitModels produitModels;
  final bool isAdmin;

  const DetailProduitPage({
    Key key,
    this.produitModels,
    this.isAdmin = false,
  }) : super(key: key);

  @override
  _DetailProduitPageState createState() => _DetailProduitPageState();
}

class _DetailProduitPageState extends State<DetailProduitPage> {
  Widget containerDispo = Container(
      alignment: Alignment.center,
      height: 30.0,
      margin: EdgeInsets.all(3.0),
      color: Colors.green,
      child: Text('dispo', style: TextStyle(color: Colors.white)));

  Widget containerNonDispo = Container(
      alignment: Alignment.center,
      height: 30.0,
      margin: EdgeInsets.all(3.0),
      color: Colors.red,
      child: Text('non dispo', style: TextStyle(color: Colors.white)));
  var _dispo;
  @override
  void initState() {
    _dispo = widget.produitModels.disponibilite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var serviceApi = ServiceApi();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Détails",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          SizedBox(height: 20.0),
          InkWell(
              child: Container(
                height: 280.0,
                child: FittedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      widget.produitModels.imageProduit,
                    ),
                  ),
                ),
              ),
              onTap: () {
                pushNewPage(
                    Scaffold(
                      appBar: AppBar(
                        elevation: 0.0,
                        title: Text(
                          widget.produitModels.nomProduit,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      body: PhotoView(
                        imageProvider:
                            AssetImage(widget.produitModels.imageProduit),
                      ),
                    ),
                    context);
              }),
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      widget.produitModels.nomProduit,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.produitModels.petiteDescription),
                    trailing: CircleAvatar(
                      backgroundColor: Palette.online,
                      child: Icon(
                        Icons.yard,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Prix : " + widget.produitModels.prixProduit,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Description : \n",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.produitModels.descriptionComplete),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(child: Text('PHARMACIES')),
                          SizedBox(width: 20.0),
                          Expanded(child: Text('DISPONIBILITÉE')),
                          SizedBox(width: 10.0),
                          if (widget.isAdmin)
                            Expanded(child: Text('ACTION'))
                          else
                            SizedBox()
                        ]),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(child: Text('PHARMACIE MAROUA')),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: _dispo[0]['disponibiliteProduitPhar1'] == 0
                                  ? containerNonDispo
                                  : containerDispo,
                            ),
                            SizedBox(width: 10.0),
                            if (widget.isAdmin)
                              Expanded(
                                child: _dispo[0]['disponibiliteProduitPhar1'] ==
                                        0
                                    ? MaterialButton(
                                        onPressed: () async {
                                          setState(() {
                                            _dispo[0][
                                                'disponibiliteProduitPhar1'] = 1;
                                            serviceApi.setDisponibilite(
                                              context: context,
                                              indexProduit: widget
                                                  .produitModels.indexProduit,
                                              phar1: _dispo[0]
                                                  ['disponibiliteProduitPhar1'],
                                              phar2: _dispo[0]
                                                  ['disponibiliteProduitPhar2'],
                                              phar3: _dispo[0]
                                                  ['disponibiliteProduitPhar3'],
                                            );
                                          });
                                        },
                                        color: Palette.primaryColor,
                                        child: Text('SET IT',
                                            style:
                                                TextStyle(color: Colors.white)))
                                    : MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _dispo[0][
                                                'disponibiliteProduitPhar1'] = 0;
                                            serviceApi.setDisponibilite(
                                              context: context,
                                              indexProduit: widget
                                                  .produitModels.indexProduit,
                                              phar1: _dispo[0]
                                                  ['disponibiliteProduitPhar1'],
                                              phar2: _dispo[0]
                                                  ['disponibiliteProduitPhar2'],
                                              phar3: _dispo[0]
                                                  ['disponibiliteProduitPhar3'],
                                            );
                                          });
                                        },
                                        color: Colors.red,
                                        child: Text('UNSET IT',
                                            style: TextStyle(
                                                color: Colors.white))),
                              )
                            else
                              SizedBox(),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text('PHARMACIE DOMAYO')),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: _dispo[0]['disponibiliteProduitPhar2'] == 0
                                  ? containerNonDispo
                                  : containerDispo,
                            ),
                            SizedBox(width: 10.0),
                            if (widget.isAdmin)
                              Expanded(
                                child: _dispo[0]['disponibiliteProduitPhar2'] ==
                                        0
                                    ? MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            serviceApi.setDisponibilite(
                                              context: context,
                                              indexProduit: widget
                                                  .produitModels.indexProduit,
                                              phar1: _dispo[0]
                                                  ['disponibiliteProduitPhar1'],
                                              phar2: _dispo[0]
                                                  ['disponibiliteProduitPhar2'],
                                              phar3: _dispo[0]
                                                  ['disponibiliteProduitPhar3'],
                                            );
                                            _dispo[0][
                                                'disponibiliteProduitPhar2'] = 1;
                                          });
                                        },
                                        color: Palette.primaryColor,
                                        child: Text('SET IT',
                                            style:
                                                TextStyle(color: Colors.white)))
                                    : MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _dispo[0][
                                                'disponibiliteProduitPhar2'] = 0;
                                            serviceApi.setDisponibilite(
                                              context: context,
                                              indexProduit: widget
                                                  .produitModels.indexProduit,
                                              phar1: _dispo[0]
                                                  ['disponibiliteProduitPhar1'],
                                              phar2: _dispo[0]
                                                  ['disponibiliteProduitPhar2'],
                                              phar3: _dispo[0]
                                                  ['disponibiliteProduitPhar3'],
                                            );
                                          });
                                        },
                                        color: Colors.red,
                                        child: Text('UNSET IT',
                                            style: TextStyle(
                                                color: Colors.white))),
                              )
                            else
                              SizedBox(),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text('PHARMACIE SAHEL')),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: _dispo[0]['disponibiliteProduitPhar3'] == 0
                                  ? containerNonDispo
                                  : containerDispo,
                            ),
                            SizedBox(width: 10.0),
                            if (widget.isAdmin)
                              Expanded(
                                child: _dispo[0]['disponibiliteProduitPhar3'] ==
                                        0
                                    ? MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _dispo[0][
                                                'disponibiliteProduitPhar3'] = 1;
                                            serviceApi.setDisponibilite(
                                              context: context,
                                              indexProduit: widget
                                                  .produitModels.indexProduit,
                                              phar1: _dispo[0]
                                                  ['disponibiliteProduitPhar1'],
                                              phar2: _dispo[0]
                                                  ['disponibiliteProduitPhar2'],
                                              phar3: _dispo[0]
                                                  ['disponibiliteProduitPhar3'],
                                            );
                                          });
                                        },
                                        color: Palette.primaryColor,
                                        child: Text('SET IT',
                                            style:
                                                TextStyle(color: Colors.white)))
                                    : MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _dispo[0][
                                                'disponibiliteProduitPhar3'] = 0;
                                            serviceApi.setDisponibilite(
                                              indexProduit: widget
                                                  .produitModels.indexProduit,
                                              context: context,
                                              phar1: _dispo[0]
                                                  ['disponibiliteProduitPhar1'],
                                              phar2: _dispo[0]
                                                  ['disponibiliteProduitPhar2'],
                                              phar3: _dispo[0]
                                                  ['disponibiliteProduitPhar3'],
                                            );
                                          });
                                        },
                                        color: Colors.red,
                                        child: Text('UNSET IT',
                                            style: TextStyle(
                                                color: Colors.white))),
                              )
                            else
                              SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
