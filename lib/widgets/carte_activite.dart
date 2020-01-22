import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:FluttTrav_Booking/constant/valeurs.dart';
import 'package:FluttTrav_Booking/modeles/modele_activite.dart';

class CarteActivite extends StatefulWidget {
  final Activite activite;
  CarteActivite(this.activite);

  @override
  _CarteActiviteState createState() => _CarteActiviteState();
}

class _CarteActiviteState extends State<CarteActivite> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  bool check = false;


  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000))..forward();
    animation = new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget onImageLoading(context, Widget child, ImageChunkEvent progress) {
    if (progress == null) return child;
    return Container(
      padding: EdgeInsets.only(left: 32, top: 64),
      child: CircularProgressIndicator(
          value: progress.expectedTotalBytes != null
              ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes
              : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Transform(
        //axis: Axis.vertical,
        transform: Matrix4.translationValues(animation.value * 400, 0.0, 0.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          height: 200,
          child: Stack(
            children: <Widget>[
              //activity info
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Card(
                  elevation: 3,
                  shape: roundedRect16,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width / 3, top: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildInfos(),
                        Text(widget.activite.description),
                        buildVotes(),
                        buildLigneTemps(),
                      ],
                    ),
                  ),
                ),
              ),
              //left image
              Container(
                margin: EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    widget.activite.image,
                    width: size.width / 3,
                    height: 200,
                    fit: BoxFit.cover,
                    loadingBuilder: onImageLoading,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Text(
            widget.activite.nom,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: titreStyle,
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(widget.activite.prix.toString() + ' \€', style: titreStyle),
              Text('Par personne'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildVotes() {
    return Container(
      child: RatingBar(
        initialRating: widget.activite.vote,
        direction: Axis.horizontal,
        itemCount: 5,
        itemSize: 14,
        unratedColor: Colors.black,
        itemPadding: EdgeInsets.only(right: 4.0),
        ignoreGestures: true,
        itemBuilder: (context, index) => Icon(Icons.star, color: Colors.orangeAccent),
        onRatingUpdate: (rating) {},
      ),
    );
  }

  Widget buildLigneTemps() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Card(
            shape: roundedRect12,
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('9:00 am'),
            ),
          ),
          Card(
            shape: roundedRect12,
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('11:30 am'),
            ),
          ),
          Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Checkbox(
                    value: check,
                    onChanged: (bool value) {
                        setState(() {
                        //bloc.ajouterDansPanier();
                        check = value;
                      });
                    },
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
