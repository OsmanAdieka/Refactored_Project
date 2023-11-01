// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:io';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Controller/profile_ImagePicker_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          /*IconButton(
            icon: Icon(FeatherIcons.instagram),
            onPressed: () {
              // Open Instagram in a WebView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InstagramWebView(),
                ),
              );
            },
          ),*/
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => controller.pickImage(),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.imagePath.value.isNotEmpty
                          ? FileImage(File(controller.imagePath.value))
                          : null,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Text(
                'Your information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Osman Adika Rais',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Birthday',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '01 Jan 2000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildInfoColumn('Email', 'dika123@gmail.com'),
              buildInfoColumn('Phone', '0812-0404-431'),
              buildInfoColumn('Location', 'Malang, Indonesia'),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget buildInfoColumn(String title, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.info,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




