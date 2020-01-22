import 'package:flutter/material.dart';
import 'package:FluttTrav_Booking/constant/valeurs.dart';
import 'package:FluttTrav_Booking/modeles/modele_activite.dart';
import 'package:FluttTrav_Booking/modeles/modele_ville.dart';
import 'package:FluttTrav_Booking/widgets/carte_activite.dart';
import 'package:FluttTrav_Booking/pages/page_panier.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:FluttTrav_Booking/constant/cart_bloc.dart';

class PageDetails extends StatefulWidget {
  final ModeleVille modeleVille;
  PageDetails(this.modeleVille);
  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  ScrollController scrollController = ScrollController();
  Size taille;
  double opacite = 0.0;

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  scrollListener() {}

  @override
  Widget build(BuildContext context) {
    taille = MediaQuery.of(context).size;

    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, isScrolled) => [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 2.5,
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: buildImageVille(),
                ),
              )
            ],
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: activites.length,
                    itemBuilder: (context, index) =>
                    CarteActivite(activites[index]),
                  ),
                ),
              ],
            ),
            //buildCityInfo(),
          ),
          buildAppbar(context,totalCount),
        ],
      ),
    );
  }

  Widget buildAppbar(BuildContext context,int totalCount) {
    return Material(
      color: Colors.black.withOpacity(0.2),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Spacer(),
            IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PanierPage(),
                    ),
                  );
                }),
            /*Positioned(
                child: new Stack(
                children: <Widget>[
                  new Icon(Icons.brightness_1,size: 20.0, color: Colors.red[700]),
                  new Positioned(
                    top: 3.0,
                    right: 7,
                    child: new Center(
                      child: new Text('$totalCount',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500),
                      ),
                    )
                  )
                ]
                )
            )*/
          ],
        ),
      ),
    );
  }

  Container buildImageVille() {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: widget.modeleVille.image,
              child: Image.network(
                widget.modeleVille.image,
                fit: BoxFit.cover,
              ),
            ),
            buildInfosVille(),
          ],
        ),
      ),
    );
  }

  Widget buildInfosVille() {
    return Positioned(
      bottom: 24,
      left: 16,
      child: Container(
        decoration: ShapeDecoration(
          shape: roundedRect16,
          color: Colors.black45,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.modeleVille.nom, style: titreVilleStyle),
            Row(
              children: <Widget>[
                Icon(Icons.flight_takeoff, color: Colors.white),
                SizedBox(width: 8),
                Text(widget.modeleVille.pays,
                    style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
