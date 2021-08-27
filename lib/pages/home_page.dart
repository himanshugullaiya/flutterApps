import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/homeWidgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/homeWidgets/catalog_list.dart';
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
    await Future.delayed(Duration(seconds: 2));
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).buttonColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(CupertinoIcons.cart),

          // backgroundColor : context.cardColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m24,
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
                    : CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
