import 'package:flutter/material.dart';
import 'package:FluttTrav_Booking/constant/valeurs.dart';
import 'package:FluttTrav_Booking/modeles/modele_ville.dart';
import 'package:FluttTrav_Booking/modeles/modele_icone.dart';
import 'package:FluttTrav_Booking/widgets/carte_ville.dart';
import 'package:FluttTrav_Booking/widgets/contenu_titre.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.titre}) : super(key: key);
  final String titre;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: AppBar().preferredSize.height * 1.5),
              Text('Où est votre prochaine destination ?', style: headerStyle),
              SizedBox(height: 32),
              buildLigneIcones(),
              ContenuTitre('Top destinations'),
              buildListeVilles(),
              ContenuTitre('Hotels exclusives'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Chercher')),
          BottomNavigationBarItem(icon: Icon(Icons.flight), title: Text('Vol')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    );
  }

  Widget buildLigneIcones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List<Widget>.generate(
        icones.length,
        (int index) {
          return ChoiceChip(
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icones[index].icon,
                color: _value == index ? Colors.blue : Colors.black,
              ),
            ),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }

  Widget buildListeVilles() {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: villes.length,
        itemBuilder: (BuildContext context, int index) {
          return CarteVille(villes[index]);
        },
      ),
    );
  }
}
