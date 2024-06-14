import 'package:final_project_2023/app/modules/home/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/app/modules/home/views/home_view.dart';
import 'package:final_project_2023/app/modules/home/views/sign_up.dart';

import 'package:get/get.dart';

void main() {
  group('Login Page Test', () {
    testWidgets('Valid email and password should navigate to HomeView',
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: LoginPage(),
      ));

      // Find email TextField widget
      final emailTextField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration!.hintText == 'Email',
      );
      expect(emailTextField, findsOneWidget);

      // Find password TextField widget
      final passwordTextField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField && widget.decoration!.hintText == 'Password',
      );
      expect(passwordTextField, findsOneWidget);

      // Enter valid email and password
      await tester.enterText(emailTextField, 'test@example.com');
      await tester.enterText(passwordTextField, 'password');
      await tester.pump();

      // Find login button
      final loginButton = find.text('Login');
      expect(loginButton, findsOneWidget);

      // Tap on login button
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify navigation to HomeView
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(Register), findsNothing);
    });

    testWidgets('Tap on Register should navigate to Register',
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: LoginPage(),
      ));

      // Find register text
      final registerText = find.text('Register');
      expect(registerText, findsOneWidget);

      // Tap on register text
      await tester.tap(registerText);
      await tester.pumpAndSettle();

      // Verify navigation to Register
      expect(find.byType(Register), findsOneWidget);
      expect(find.byType(HomeView), findsNothing);
    });
  });
}
