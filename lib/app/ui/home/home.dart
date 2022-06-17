import 'package:dotapp/app/controllers/botnav_c.dart';
import 'package:dotapp/app/ui/gallery/gallery.dart';
import 'package:dotapp/app/ui/place/place.dart';
import 'package:dotapp/app/ui/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final List<Widget> pagesList = [
    PlacePage(),
    GalleryPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigationController botNavController =
        Get.put(BottomNavigationController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: botNavController.selectedIdex.value,
          children: pagesList,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.green[100],
          unselectedItemColor: Colors.green[300],
          onTap: (index) {
            botNavController.tappedIndex(index);
          },
          currentIndex: botNavController.selectedIdex.value,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: NavList,
        ),
      ),
    );
  }

  //list Bottom Navigation
  List<BottomNavigationBarItem> get NavList {
    return const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.map,
          size: 32,
        ),
        label: 'PLACE',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.book,
          size: 32,
        ),
        label: 'GALLERY',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          size: 32,
        ),
        label: 'USER',
      ),
    ];
  }
}
