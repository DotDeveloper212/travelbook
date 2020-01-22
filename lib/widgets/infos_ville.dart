import 'package:flutter/material.dart';
import 'package:FluttTrav_Booking/modeles/modele_ville.dart';

class InfosVille extends StatelessWidget {

  final ModeleVille city;
  InfosVille(this.city);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.black45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(city.nom, style: TextStyle(fontSize: 24, color: Colors.white)),
          Row(
            children: <Widget>[
              Icon(Icons.flight_takeoff, color: Colors.white, size: 14),
              SizedBox(width: 8),
              Text(city.pays, style: TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
