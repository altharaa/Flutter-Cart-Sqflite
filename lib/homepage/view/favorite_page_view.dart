import 'package:flutter/material.dart';
import 'package:flutter_cart_sqflite/helper/themes.dart';
import 'package:flutter_cart_sqflite/homepage/controller/favorite_page_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePageview extends StatelessWidget {
  const FavoritePageview({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    final controller = Get.put(FavoritePageController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: height * 0.2,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivery Address', style: ts12SemiboldBlack),
                          Text(
                            'Home',
                            style: ts20SemiboldBlack,
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: primaryColor),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.003),
                        child: Text(
                          'Change',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.015),
                  Container(
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
                    ),
                    padding: EdgeInsets.all(width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Note',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                        ),
                        SizedBox(width: width * 0.01),
                        Icon(
                          Icons.edit_note_sharp,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.makeup.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          elevation: 2.0,
                          child: ListTile(
                            title: Text('${controller.makeup[index]["title"]}'),
                            subtitle: Text('\$ ${controller.makeup[index]["price"]}'),
                            leading: Image.network("${controller.makeup[index]["imageLink"]}"),
                            trailing: IconButton(
                              onPressed: () {
                                controller.deleteFromFavorite(
                                  controller.makeup[index]["id"]!,
                                  index,
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            
          ],
        ),
      ),
    );
  }
}
