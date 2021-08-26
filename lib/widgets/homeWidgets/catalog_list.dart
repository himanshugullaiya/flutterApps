import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/catalog_detail_page.dart';
import 'package:flutter_catalog/widgets/homeWidgets/catalog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CatalogDetailPage(catalog: catalog))),
              child: CatalogItem(catalog: catalog));
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
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(catalogImage: catalog.image)),
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
