import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogDetailPage extends StatelessWidget {
  final Item catalog;

  const CatalogDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              // Aligns in Rows
              "\$${catalog.price}".text.bold.xl3.make(),
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
                  .w20(context)
                  .px16(),
            ],
          ).p16(),
        ),
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      10.heightBox,
                      catalog.name.text.bold.xl4.black.make(),
                      catalog.desc.text.textStyle(context.captionStyle!).make(),
                      10.heightBox,
                      "Vero et sit dolor magna sea lorem eirmod vero. Sit dolores sadipscing consetetur amet consetetur dolor. Erat duo sit gubergren."
                          .text
                          // .textStyle(context.captionStyle!)
                          .medium
                          .make()
                          .p16(),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ]).pOnly(top: 16),
        ));
  }
}
