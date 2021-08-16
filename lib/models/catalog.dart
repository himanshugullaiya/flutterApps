class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Iphone 12 Pro",
        desc: "Apple Iphone",
        price: 999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjNLqFfxREUZswjjeV-BG74pC8jGHly62_w5X-oot49yBXH51Q0DeJAQ74_cfLeD48Cd5IJyg&usqp=CAc"),
    Item(
        id: 2,
        name: "Iphone 1123 Pro",
        desc: "Apple Iphone Here",
        price: 9999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjNLqFfxREUZswjjeV-BG74pC8jGHly62_w5X-oot49yBXH51Q0DeJAQ74_cfLeD48Cd5IJyg&usqp=CAc")
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
