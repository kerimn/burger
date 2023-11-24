import 'dart:collection';

import 'package:burger/models/category_product.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<CategoryProduct> _items = [];

  UnmodifiableListView<CategoryProduct> get items =>
      UnmodifiableListView(_items);

  CategoryProduct oneItem(int id) {
    return _items.firstWhere(
      (product) => product.id == id,
      orElse: () => CategoryProduct(
        id: 0,
        name: "",
        img: "",
        price: 0,
      ),
    );
  }

  double get totalPrice {
    return _items.fold<double>(
        0.0, (total, item) => total + (item.price * item.quantity));
  }

  int get totalCount {
    return _items.length;
  }

  void add(CategoryProduct item) {
    var existingItem = _items.firstWhere(
        (existingItem) => existingItem.id == item.id,
        orElse: () => CategoryProduct(
            id: 0, name: '', img: '', price: 0.0, quantity: 0, totalCount: 0));

    if (existingItem.id != 0) {
      existingItem.quantity += 1;
      existingItem.totalCount += 1;
    } else {
      _items.add(item);
    }

    print(_items);
    notifyListeners();
  }

  void remove(CategoryProduct item) {
    var existingItem = _items.firstWhere(
        (existingItem) => existingItem.id == item.id,
        orElse: () => CategoryProduct(
            id: 0, name: '', img: '', price: 0.0, quantity: 0, totalCount: 0));

    if (existingItem.id != 0) {
      existingItem.quantity -= 1;

      if (existingItem.quantity == 0) {
        _items.remove(existingItem);
      }

      existingItem.totalCount -= 1;
    }

    print(_items);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();

    notifyListeners();
  }
}
