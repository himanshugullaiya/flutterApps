import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/Item_widget.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(productsData);
    CatalogModel.items = List.from(productsData)
        .map<Item>((mappedItem) => Item.fromMap(mappedItem))
        .toList();
    print(CatalogModel.items);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                SizedBox(
                  height: 20,
                ),
                (CatalogModel.items
                        .isNotEmpty) //if condition to check whether Catalog.items is not empty
                    ? CatalogList().expand()
                    : Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ));
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap:
            true, //we are using a list in a column so we must give whole space required
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel
              .items[index]; //in your code u should use item isntad of catalog
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(catalogImage: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.black.make(),
            catalog.desc.text.textStyle(context.captionStyle!).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                // Aligns in Rows
                "\$${catalog.price}".text.bold.lg.make(),
                ElevatedButton(
                        onPressed: () {
                          print(catalog.name);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkBlueColor),
                          shape: MaterialStateProperty.all(
                              // RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10))
                              StadiumBorder()),
                        ),
                        child: "Buy".text.make())
                    .px16(),
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().py8();
  }
}

class CatalogImage extends StatelessWidget {
  final String catalogImage;
  const CatalogImage({Key? key, required this.catalogImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalogImage)
        .box
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBlueColor).make(),
        "Trending Products".text.xl2.color(Vx.black).make(),
      ],
    );
  }
}
