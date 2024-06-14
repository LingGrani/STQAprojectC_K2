import 'package:final_project_2023/app/modules/home/views/login_page.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

const apiKey = "AIzaSyDeuo2eZlJ3idfuVUWHzAvCJHefUFHSNOE";
const projectId = "finalproject-6f07f";

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kebersihan Kota",
      initialRoute: AppPages.INITIAL,
      //Menampilkan pilihan halaman LoginPage
      home: LoginPage(),
    ),
  );
}
