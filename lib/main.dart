import 'package:flutter/material.dart';
import 'constant/cart_bloc.dart';
import 'package:provider/provider.dart';
import 'package:FluttTrav_Booking/pages/page_home.dart';

void main() => runApp(TravBook());

class TravBook extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
        create: (context) => CartBloc(),
        child: MaterialApp(
          title: 'Flutter Shopping Cart Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(titre: 'FluttTrav Booking'),
        ));
  }
}