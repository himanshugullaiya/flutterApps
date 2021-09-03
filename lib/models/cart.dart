import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog; //private var  //marked late
  //collection of Ids - store Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalogGetter => _catalog;

  //set Catalog
  set catalogSetter(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get ids of all items in the cart
  List<Item> get items =>
      _itemIds.map((id) => catalogGetter.getByID(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
