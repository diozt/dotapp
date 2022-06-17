import 'dart:ui';

import 'package:dotapp/app/controllers/gallery_control.dart';
import 'package:dotapp/app/data/models/gallery_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class GalleryPage extends StatelessWidget {
  final c = Get.find<GalleryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => c.isLoading.isTrue
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                title: Text("Gallery"),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      // form search
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(14.0),
                          isDense: true,
                          hintText: 'Search..',
                          hintStyle: const TextStyle(
                            color: Colors.grey, // <-- Change this
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount: c.dataGallery.data.length,
                          itemBuilder: (BuildContext ctx, index) {
                            Datum content = c.dataGallery.data[index];
                            return TextButton(
                              onPressed: () async {
                                await showDialog(
                                    context: context,
                                    builder: (_) => Dialog(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 300,
                                                height: 300,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            content.image),
                                                        fit: BoxFit.cover)),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                content.caption,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        ));
                              },
                              child: FadeInImage(
                                placeholder: const AssetImage(
                                    'assets/image_placeholder.png'),
                                image: NetworkImage(content.thumbnail),
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
