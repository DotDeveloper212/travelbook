import 'package:flutter/material.dart';
import 'package:FluttTrav_Booking/constant/cart_bloc.dart';
import 'package:provider/provider.dart';

class PanierPage extends StatelessWidget {
  PanierPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.panier;
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          int giftIndex = cart.keys.toList()[index];
          int count = cart[giftIndex];
          return ListTile(
            leading: Container(
              height: 70,
              width: 70,
            ),
            title: Text('Element no $count'),
            trailing: RaisedButton(
              child: Text('Effacer'),
              color: Theme.of(context).buttonColor,
              elevation: 1.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                bloc.reinitialiser(giftIndex);
              },
            ),
          );
        },
      ),
    );
  }
}