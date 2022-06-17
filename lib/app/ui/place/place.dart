import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotapp/app/controllers/place_controller.dart';
import 'package:dotapp/app/data/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlacePage extends StatelessWidget {
  final c = Get.find<PlaceController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                title: Text("PLACE"),
                centerTitle: true,
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        c.dataPlace.data.header.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        c.dataPlace.data.header.subtitle,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: c.dataPlace.data.content.length,
                        itemBuilder: (BuildContext context, int index) {
                          Content conten = c.dataPlace.data.content[index];
                          return InkWell(
                            onTap: () {},
                            child: Container(
                                width: size.width,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      child: conten.image != null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        conten.image),
                                                    fit: BoxFit.cover),
                                              ),
                                            )
                                          : CarouselSlider(
                                              items: List.generate(
                                                  conten.media.length, (idx) {
                                                return Builder(
                                                  builder:
                                                      (BuildContext context) {
                                                    return AnimatedContainer(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      duration: const Duration(
                                                          milliseconds: 1000),
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                conten.media[
                                                                    idx]),
                                                            fit: BoxFit
                                                                .fitHeight),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }).toList(),
                                              options: CarouselOptions(
                                                autoPlay: true,
                                                viewportFraction: 1.3,
                                                initialPage: 0,
                                                enableInfiniteScroll: true,
                                                enlargeCenterPage: true,
                                                pageSnapping: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                              ),
                                            ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          conten.title,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          conten.content,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
