import 'package:dotapp/app/controllers/place_controller.dart';
import 'package:dotapp/app/data/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlacePage extends StatelessWidget {
  final c = Get.find<PlaceController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Header header = c.dataPlace.data.header;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text("PLACE"),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  header.subtitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                          height: 120,
                          width: size.width,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('data'),
                                      // row terus sebelah kiri container, digawe kondisi misal length image == null sing dishow slider lk ogak berarti sing dishow widget image e
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 12,
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
