// login_integration_test.dart

import 'package:final_project_2023/app/modules/home/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/app/modules/home/views/home_view.dart';

void main() {
  group('Login Integration Test', () {
    testWidgets('Valid Login', (WidgetTester tester) async {
      // Build Login Page widget
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Enter valid email and password
      await tester.enterText(find.byType(TextField).first, 'alwan');
      await tester.enterText(find.byType(TextField).last, 'saya');

      // Tap Login button
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify that HomeView is displayed
      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets('Invalid Login', (WidgetTester tester) async {
      // Build Login Page widget
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Enter invalid email and password
      await tester.enterText(find.byType(TextField).first, 'invalid_email');
      await tester.enterText(find.byType(TextField).last, 'invalid_password');

      // Tap Login button
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify that error dialog is displayed
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Email atau password tidak valid.'), findsOneWidget);

      // Tap OK button on the error dialog
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Verify that still on the Login page
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
