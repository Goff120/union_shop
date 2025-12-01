import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/sign_up_page.dart';

void main() {
  testWidgets('MainHeader displays purple banner with text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Verify banner text is displayed
    expect(find.text('The one peace! The one peace is REAL!!'), findsOneWidget);

    // Find the purple banner container
    final bannerContainer = tester.widgetList<Container>(find.byType(Container)).firstWhere(
      (container) => container.color == const Color(0xFF4d2963),
    );

    // Verify banner color
    expect(bannerContainer.color, const Color(0xFF4d2963));
  });

  testWidgets('MainHeader has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Find the main header widget and verify its size
    final mainHeaderSize = tester.getSize(find.byType(MainHeader));

    // Verify height is 100
    expect(mainHeaderSize.height, 100);
  });

  testWidgets('MainHeader displays logo', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Verify logo image exists
    expect(find.byType(Image), findsAtLeastNWidgets(1));
  });

  testWidgets('MainHeader logo navigates to home on tap', (WidgetTester tester) async {
    bool homeNavigated = false;

    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(
          body: MainHeader(),
        ),
        routes: {
          '/': (context) {
            homeNavigated = true;
            return const Scaffold(body: Text('Home Page'));
          },
        },
      ),
    );

    // Find the logo's GestureDetector
    final logoGesture = find.descendant(
      of: find.byType(MainHeader),
      matching: find.byType(GestureDetector),
    ).first;

    // Tap the logo
    await tester.tap(logoGesture);
    await tester.pumpAndSettle();

    // Verify navigation occurred
    expect(homeNavigated, isTrue);
  });

  testWidgets('MainHeader displays desktop navigation on wide screen', (WidgetTester tester) async {
    // Set screen size to desktop width
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Verify desktop navigation links are displayed
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);

    // Reset screen size
    addTearDown(tester.view.reset);
  });

  testWidgets('MainHeader hides desktop navigation on mobile', (WidgetTester tester) async {
    // Set screen size to mobile width
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Verify desktop navigation links are NOT displayed
    expect(find.text('Home'), findsNothing);
    expect(find.text('Products'), findsNothing);
    expect(find.text('About'), findsNothing);
    expect(find.text('Contact'), findsNothing);

    // Reset screen size
    addTearDown(tester.view.reset);
  });

  testWidgets('MainHeader displays menu icon on mobile', (WidgetTester tester) async {
    // Set screen size to mobile width
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Verify menu icon is displayed on mobile
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Reset screen size
    addTearDown(tester.view.reset);
  });

  testWidgets('MainHeader does not display menu icon on desktop', (WidgetTester tester) async {
    // Set screen size to desktop width
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Verify menu icon is NOT displayed on desktop
    expect(find.byIcon(Icons.menu), findsNothing);

    // Reset screen size
    addTearDown(tester.view.reset);
  });

  testWidgets('MainHeader displays all action icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Verify search, account, and bag icons are displayed
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });

  testWidgets('MainHeader account icon navigates to SignUpPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Find and tap the account icon
    final accountIcon = find.byIcon(Icons.person_outline);
    await tester.tap(accountIcon);
    await tester.pumpAndSettle();

    // Verify navigation to SignUpPage occurred
    expect(find.byType(SignUpPage), findsOneWidget);
  });

  testWidgets('MainHeader desktop nav item navigates to correct route', (WidgetTester tester) async {
    // Set screen size to desktop width
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    bool aboutNavigated = false;

    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(
          body: MainHeader(),
        ),
        routes: {
          '/about': (context) {
            aboutNavigated = true;
            return const Scaffold(body: Text('About Page'));
          },
        },
      ),
    );

    // Tap the "About" navigation link
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    // Verify navigation occurred
    expect(aboutNavigated, isTrue);

    // Reset screen size
    addTearDown(tester.view.reset);
  });

  testWidgets('MainHeader search icon is tappable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Find and tap the search icon
    final searchIcon = find.byIcon(Icons.search);
    expect(searchIcon, findsOneWidget);
    
    await tester.tap(searchIcon);
    await tester.pump();

    // No assertion needed - just verify it doesn't throw
  });

  testWidgets('MainHeader bag icon is tappable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Find and tap the bag icon
    final bagIcon = find.byIcon(Icons.shopping_bag_outlined);
    expect(bagIcon, findsOneWidget);
    
    await tester.tap(bagIcon);
    await tester.pump();

    // No assertion needed - just verify it doesn't throw
  });

  testWidgets('MainHeader menu shows popup with navigation items on mobile', (WidgetTester tester) async {
    // Set screen size to mobile width
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MainHeader(),
        ),
      ),
    );

    // Tap the menu icon
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Verify popup menu items are displayed
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('The Print Shack'), findsOneWidget);
    expect(find.text('Sale!'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);

    // Reset screen size
    addTearDown(tester.view.reset);
  });
}
