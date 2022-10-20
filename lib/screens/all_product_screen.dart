import 'package:flutter/material.dart';
import 'package:pharma/widgets/widgets.dart';

class AllProduct extends StatefulWidget {
  final produitList;
  final userIsconnected;
  const AllProduct({Key key, this.produitList, this.userIsconnected})
      : super(key: key);

  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    return ProduitCard2(
        produitList: widget.produitList,
        userIsconnected: widget.userIsconnected);
  }
}
