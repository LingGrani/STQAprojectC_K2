import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:final_project_2023/app/modules/home/views/home_view.dart';

void main() {
  group('HomeView Tests', () {
    setUp(() {
      Get.testMode = true;
    });

    testWidgets('Form Fields Test', (tester) async {
      final homeView = HomeView();
      await tester.pumpWidget(GetMaterialApp(home: homeView));

      final formFields = find.byType(TextField);

      expect(formFields, findsNWidgets(3));
    });

    testWidgets('Texts Test', (tester) async {
      final homeView = HomeView();
      await tester.pumpWidget(GetMaterialApp(home: homeView));

      final textFinder = find.text('Harap mengisi Form Pengambilan Sampah');
      final namaTextFinder = find.text('Nama');
      final alamatTextFinder = find.text('Alamat');
      final catatanTextFinder = find.text('Catatan');

      expect(textFinder, findsOneWidget);
      expect(namaTextFinder, findsOneWidget);
      expect(alamatTextFinder, findsOneWidget);
      expect(catatanTextFinder, findsOneWidget);
    });

    testWidgets('Button Test', (tester) async {
      final homeView = HomeView();
      await tester.pumpWidget(GetMaterialApp(home: homeView));

      final buttonFinder = find.widgetWithText(RawMaterialButton, 'SUBMIT');

      expect(buttonFinder, findsOneWidget);
    });
  });
}
