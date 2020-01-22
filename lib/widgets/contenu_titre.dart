import 'package:flutter/material.dart';

class ContenuTitre extends StatelessWidget {
  final String titre;
  ContenuTitre(this.titre);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(titre, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {},
            customBorder: StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Voir tout',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
