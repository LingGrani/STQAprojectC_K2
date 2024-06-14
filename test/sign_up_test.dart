import 'package:final_project_2023/app/modules/home/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/app/modules/home/views/login_page.dart';

void main() {
  testWidgets('Register Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Register(),
    ));

    // Find register button
    final registerButton = find.text('Daftar');
    expect(registerButton, findsOneWidget);

    // Tap on register button
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Verify navigation to LoginPage
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('Tap on Login should navigate back', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Register(),
    ));

    // Find login text
    final loginText = find.text('Login');
    expect(loginText, findsOneWidget);

    // Tap on login text
    await tester.tap(loginText);
    await tester.pumpAndSettle();

    // Verify navigation back
    expect(find.byType(LoginPage), findsNothing);
  });
}
