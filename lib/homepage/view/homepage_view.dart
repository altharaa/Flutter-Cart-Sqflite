import 'package:flutter/material.dart';
import 'package:flutter_cart_sqflite/helper/themes.dart';
import 'package:flutter_cart_sqflite/homepage/controller/homepage_controller.dart';
import 'package:flutter_cart_sqflite/homepage/view/favorite_page_view.dart';
import 'package:flutter_cart_sqflite/model/product.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageController());
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("Makeup"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => FavoritePageview())?.then((value) {
                    controller.checkFavorite();
                  });
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Set the cross axis count to 2
                          mainAxisExtent: height * 0.40,
                          childAspectRatio: 1 / 2,
                          crossAxisSpacing: width * 0.04,
                          mainAxisSpacing: 2,
                        ),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          ProductModel product = controller.data[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: height * 0.01),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.network(product.imageLink ?? '',
                                        fit: BoxFit.cover),
                                    SizedBox(height: height * 0.01),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.015),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(product.name!,
                                                style: moneyMiniText),
                                          ),
                                          SizedBox(height: height * 0.005),
                                          Text("\$ ${product.price!}",
                                              style: moneyMiniText),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: height * 0.04,
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.015,
                                      vertical: height * 0.01,
                                    ),
                                    child: Obx(() {
                                      return ElevatedButton(
                                        onPressed: () {
                                          if (controller
                                                  .isFavorite[index].value ==
                                              false) {
                                            controller.addToFavorite(
                                                imageLink: product.imageLink!,
                                                title: product.name!,
                                                price: product.price!,
                                                id: product.id!);
                                          } else {
                                            controller.deleteFromFavorite(
                                                product.id!);
                                          }
                                          controller.isFavorite[index].toggle();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Icon(
                                            controller.isFavorite[index]
                                                        .value ==
                                                    false
                                                ? Icons.shopping_cart
                                                : Icons.check,
                                            size: 20,
                                            color: secondaryColor),
                                      );
                                    })),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
                ],
              ),
            )));
  }
}
