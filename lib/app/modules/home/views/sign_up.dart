import 'package:final_project_2023/app/modules/home/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//Membuat class register dengan widget statefull
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override

  //Membuat tampilan halaman Register
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registrasi",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(16)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Silahkan Registrasi di bawah",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 30),
          const Text(
            "Masukkan data anda ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          //Menampilkan boxtext untuk Nama Lengkap
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Nama Lengkap",
                prefixIcon: Icon(Icons.person, color: Colors.black)),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //Menamplkan boxtext untuk email aktif
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Email aktif",
                prefixIcon: Icon(Icons.mail, color: Colors.black)),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //Menampilkan boxtext untuk password
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.mail, color: Colors.black)),
          ),
          //Membuat text yang berbentuk attention
          const Text(
            "Please Remember Your Password !!!",
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 60),
          Container(
            width: 500,
            child: SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                    fillColor: Colors.blue,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    //Menambahkan Navigator untuk perpindahan halaman
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text("Daftar",
                        style: TextStyle(color: Colors.white, fontSize: 18)))),
          ),
          const SizedBox(height: 5),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
