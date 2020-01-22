import 'package:flutter/material.dart';
import 'package:FluttTrav_Booking/constant/valeurs.dart';
import 'package:FluttTrav_Booking/pages/page_details.dart';
import 'package:FluttTrav_Booking/modeles/modele_ville.dart';
import 'package:FluttTrav_Booking/widgets/infos_ville.dart';

class CarteVille extends StatefulWidget {
  final ModeleVille ville;
  CarteVille(this.ville);

  @override
  _CarteVilleState createState() => _CarteVilleState();
}

class _CarteVilleState extends State<CarteVille> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))..forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void afficherVille(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageDetails(widget.ville)));
  }

  Widget onImageLoading(context, Widget child, ImageChunkEvent progress) {
    if (progress == null) return child;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes : null),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largeurCarte = MediaQuery.of(context).size.width * 0.6;
    return ScaleTransition(
      scale: CurvedAnimation(parent: animationController, curve: Curves.easeInToLinear),
      child: Container(
        margin: EdgeInsets.only(right: 8),
        width: largeurCarte,
        child: InkWell(
          onTap: () => afficherVille(context),
          customBorder: roundedRect16,
          child: Stack(
            children: <Widget>[
              buildCarteInfos(context, largeurCarte),
              buildCarteImage(largeurCarte),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarteInfos(context, cardWidth) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 150,
        width: cardWidth,
        child: Card(
          elevation: 3,
          shape: roundedRect12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${widget.ville.activites} activités',
                  style: titreStyle,
                ),
                SizedBox(height: 8),
                Text(
                  widget.ville.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: soustitreStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCarteImage(cardWidth) {
    return Container(
      width: cardWidth,
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        shape: roundedRect16,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: widget.ville.image,
                  child: Image.network(
                    widget.ville.image,
                    fit: BoxFit.cover,
                    loadingBuilder: onImageLoading,
                  ),
                ),
              ),
              InfosVille(widget.ville),
            ],
          ),
        ),
      ),
    );
  }
}
