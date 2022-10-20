import 'package:flutter/material.dart';

class HeaderCategorie extends StatelessWidget {
  const HeaderCategorie({Key key, this.textCategrie, this.onPressed})
      : super(key: key);
  final String textCategrie;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textCategrie,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Tous Voir",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      ),
      onTap: onPressed,
    );
  }
}
