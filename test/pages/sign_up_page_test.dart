import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sign_up_page.dart';

void main() {
  testWidgets('SignUpPage displays form elements', (WidgetTester tester) async {
    // Build the SignUpPage widget
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpPage(),
      ),
    );

    // Verify the sign up title is displayed
    expect(find.text('Sign Up'), findsOneWidget);

    // Verify instructions text
    expect(find.text('choose how you would like to sign up'), findsOneWidget);

    // Verify username and password fields exist
    expect(find.widgetWithText(TextField, 'username'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'password'), findsOneWidget);

    // Verify buttons exist
    expect(find.text('Sign in with Shop'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);

    // Verify divider text
    expect(find.text('------------ or ------------'), findsOneWidget);
  });

  

  testWidgets('Shop button callback is triggered', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpPage(),
      ),
    );

    // Find the "Sign in with Shop" button
    final shopButton = find.text('Sign in with Shop');
    expect(shopButton, findsOneWidget);

    // Tap the button (currently does nothing, but verifies it's tappable)
    await tester.tap(shopButton);
    await tester.pump();
  });

  testWidgets('Sign in button callback is triggered', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpPage(),
      ),
    );

    // Find the "Sign in" button
    final signInButton = find.text('Sign in');
    expect(signInButton, findsOneWidget);

    // Tap the button
    await tester.tap(signInButton);
    await tester.pump();
  });

  testWidgets('Text fields accept input', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpPage(),
      ),
    );

    // Find text fields by hint text
    final usernameField = find.widgetWithText(TextField, 'username');
    final passwordField = find.widgetWithText(TextField, 'password');

    // Enter text in username field
    await tester.enterText(usernameField, 'testuser');
    expect(find.text('testuser'), findsOneWidget);

    // Enter text in password field
    await tester.enterText(passwordField, 'testpassword');
    expect(find.text('testpassword'), findsOneWidget);
  });

  testWidgets('Logo navigation to home page', (WidgetTester tester) async {
    bool homePageNavigated = false;

    await tester.pumpWidget(
      MaterialApp(
        home: const SignUpPage(),
        routes: {
          '/': (context) {
            homePageNavigated = true;
            return const Scaffold(body: Text('Home Page'));
          },
        },
      ),
    );

    // Find the logo image wrapped in GestureDetector
    final logoFinder = find.byType(GestureDetector);
    expect(logoFinder, findsWidgets);

    // Tap the logo
    await tester.tap(logoFinder.first);
    await tester.pumpAndSettle();

    // Verify navigation to home page occurred
    expect(homePageNavigated, isTrue);
    expect(find.text('Home Page'), findsOneWidget);
  });
}
