import 'package:flutter/material.dart';
import 'package:pharma/screens/screens.dart';

class CustomSearchButton extends StatelessWidget {
  final userIsconnected;
  final produitList;
  const CustomSearchButton({Key key, this.userIsconnected, this.produitList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 50.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            children: [
              SizedBox(width: 10.0),
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10.0),
              Text(
                "Search",
                style: TextStyle(fontSize: 19.0, color: Colors.grey),
              ),
            ],
          ),
        ),
        onTap: () => showSearch(
            context: context, delegate: SearchProduct(userIsconnected)));
  }
}
