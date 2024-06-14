import 'package:final_project_2023/app/modules/home/views/home_view.dart';
import 'package:final_project_2023/app/modules/home/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Mendefinisikan variable objek LoginPage untuk mengisi email,password
  final _formkey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  LoginController userController = Get.put(LoginController());

  @override
  //Membuat tampilan halaman Login Page
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //Menampilkan gambar untuk aplikasi
            Image.asset("assets/images/kebersihan.png",
                height: 100, width: 100),
            Text(
              "Selamat Datang di Aplikasi Kebersihan Kota",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Silahkan Masukkan Email dan Kata Sandi Anda dibawah",
              style: const TextStyle(fontSize: 17),
            ),
            //Menampilkan sebuah boxtext untuk email
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.mail, color: Colors.black),
              ),
              onChanged: (newValue) {
                _email = newValue;
              },
            ),
            //Menampilkan sebuah boxtext untuk password
            const SizedBox(height: 26),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
              onChanged: (newValue) {
                _password = newValue;
              },
            ),
            //Menampilkan sebuah boxtext untuk user yang lupa password
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Lupa Password ?",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            //Menambahkan Navigator perpindahan halaman
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.black,
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  if (_email == 'ghani' && _password == 'saya') {
                    // Jika email dan password sesuai, pindah ke halaman HomeView
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  } else {
                    // Jika email dan password tidak sesuai, tampilkan pesan error
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Email atau password tidak valid.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                //Menambahkan button login
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
