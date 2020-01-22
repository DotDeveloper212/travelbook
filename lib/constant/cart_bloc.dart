import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {
  Map<int, int> _panier = {};

  Map<int, int> get panier => _panier;

  void ajouterDansPanier(index) {
    if (_panier.containsKey(index)) {
      _panier[index] += 1;
    } else {
      _panier[index] = 1;
    }
    notifyListeners();
  }

  void reinitialiser(index) {
    if (_panier.containsKey(index)) {
      _panier.remove(index);
      notifyListeners();
    }
  }
}