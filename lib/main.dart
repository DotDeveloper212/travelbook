import 'package:flutter/material.dart';
import 'constant/cart_bloc.dart';
import 'package:provider/provider.dart';
import 'package:FluttTrav_Booking/pages/page_home.dart';

void main() => runApp(TravBook());

class TravBook extends StatelessWidget {
  // This widget is the root of your application.
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluttTrav Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(titre: 'FluttTrav Booking'),
    );
  }*/

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
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PanierPage(),
                      ),
                    );
                  },
                  child: new Stack(
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      new Positioned(
                          child: new Stack(
                        children: <Widget>[
                          new Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[700]),
                          new Positioned(
                              top: 3.0,
                              right: 7,
                              child: new Center(
                                child: new Text(
                                  '$totalCount',
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      )),
                    ],
                  ),
                )),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return GestureDetector(
              onTap: () {
                
              },
              child: Container(
                height: 200,
                width: 200,
              ));
        }),
      ),
    );
  }

}*/