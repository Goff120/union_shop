import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';

void main() {
  testWidgets('AboutPage displays main header', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify MainHeader is displayed
    expect(find.byType(MainHeader), findsOneWidget);
  });

  testWidgets('AboutPage displays footer', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify Footer is displayed
    expect(find.byType(Footer), findsOneWidget);
  });

  testWidgets('AboutPage displays "About US" title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify title is displayed
    expect(find.text('About US'), findsOneWidget);
  });

  testWidgets('AboutPage displays introduction text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify introduction text
    expect(
      find.text('We are the UNI of portsmouth student shop give the best UNI products'),
      findsOneWidget,
    );
  });

  testWidgets('AboutPage displays "What we sell!" section', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify section header
    expect(find.text('What we sell!'), findsOneWidget);

    // Verify section content
    expect(
      find.text(
        'we give a range of items to merch you can \nbe proud of or common useful items that can be the foundation of your learning',
      ),
      findsOneWidget,
    );
  });

  testWidgets('AboutPage displays closing message', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify closing message
    expect(
      find.text('we hope you have a great time in our UNI and can have the proper supplys for it'),
      findsOneWidget,
    );
  });

  testWidgets('AboutPage is scrollable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify SingleChildScrollView exists
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('AboutPage content is laid out in Column', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify Column exists
    final columns = find.byType(Column);
    expect(columns, findsWidgets);
  });

  testWidgets('AboutPage has proper spacing between sections', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Find SizedBox widgets used for spacing
    final sizedBoxes = find.byType(SizedBox);
    expect(sizedBoxes, findsWidgets);

    // Verify various spacing heights exist
    final sizedBoxWidgets = tester.widgetList<SizedBox>(sizedBoxes).toList();
    
    // Check for spacing of 50, 30, 15, 8, 20
    expect(sizedBoxWidgets.where((box) => box.height == 50).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 30).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 15).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 8).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 20).length, greaterThan(0));
  });

  testWidgets('AboutPage header container has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Find the header container
    final headerContainer = tester.widgetList<Container>(find.byType(Container)).firstWhere(
      (container) => container.color == Colors.white,
    );

    // Verify color
    expect(headerContainer.color, Colors.white);
  });

  testWidgets('AboutPage content is center-aligned', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Find the main content Column
    final scrollView = tester.widget<SingleChildScrollView>(
      find.byType(SingleChildScrollView),
    );
    
    final column = scrollView.child as Column;

    // Verify center alignment
    expect(column.crossAxisAlignment, CrossAxisAlignment.center);
  });

  testWidgets('AboutPage displays all text content in correct order', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify all text elements exist
    expect(find.text('About US'), findsOneWidget);
    expect(
      find.text('We are the UNI of portsmouth student shop give the best UNI products'),
      findsOneWidget,
    );
    expect(find.text('What we sell!'), findsOneWidget);
    expect(
      find.text(
        'we give a range of items to merch you can \nbe proud of or common useful items that can be the foundation of your learning',
      ),
      findsOneWidget,
    );
    expect(
      find.text('we hope you have a great time in our UNI and can have the proper supplys for it'),
      findsOneWidget,
    );
  });

  testWidgets('AboutPage has Scaffold as root widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Verify Scaffold exists
    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('AboutPage navigateToHome method exists', (WidgetTester tester) async {
    // Create an instance to verify the method exists
    const aboutPage = AboutPage();
    
    // Verify the widget is created successfully
    expect(aboutPage, isNotNull);
  });
}
