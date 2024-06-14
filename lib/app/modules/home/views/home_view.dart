import 'package:final_project_2023/main.dart';
import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  //Mendefinisikan variable objek HomeView untuk mengisi nama,alamat,catatan
  final _formkey = GlobalKey();

  late String _nama;
  late String _alamat;
  late String _catatan;

  @override
  //Membuat Tampilan halamn HomeView
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selamat Datang',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      //Menambahkan widget card untuk membuat tampilan formulir
      body: Card(
        color: Colors.white,
        child: SizedBox(
          width: 500,
          height: 500,
          child: Column(children: <Widget>[
            const Center(
              child: Card(
                color: Colors.grey,
                child: SizedBox(
                  width: 500,
                  height: 70,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Harap mengisi Form Pengambilan Sampah',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //menambahkan text nama
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Nama'),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          _nama = newValue;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Alamat'),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          _alamat = newValue;
                        }
                      },
                    ),
                  ),
                  //Menambahkan text Catatan
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Catatan'),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          _catatan = newValue;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.black,
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20),
                //Menambahkan pop up jika laporan berhasil dikirim
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  Get.snackbar('Berhasil', 'Laporan berhasil dikirim',
                      snackPosition: SnackPosition.BOTTOM);
                },
                //Menambahkan button apabila data telah di isi
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
