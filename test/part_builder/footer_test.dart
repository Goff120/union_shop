import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/styles/footer_style.dart';

void main() {
  testWidgets('Footer displays all text content', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Verify all text content is displayed
    expect(find.text('Open hours'), findsOneWidget);
    expect(find.text('Term time'), findsOneWidget);
    expect(find.text('Monday-Friday(07:30-19:00)'), findsOneWidget);
    expect(find.text('Out of term or reading week'), findsOneWidget);
    expect(find.text('Monday-Thursday(09:00-15:00)'), findsOneWidget);
    expect(find.text('24/7 in store'), findsOneWidget);
    expect(find.text('help me'), findsOneWidget);
  });

  testWidgets('Footer has correct background color', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find the footer container
    final container = tester.widget<Container>(find.byType(Container).first);

    // Verify background color
    expect(container.color, const Color.fromARGB(255, 219, 219, 219));
  });

  testWidgets('Footer has correct padding', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find the footer container
    final container = tester.widget<Container>(find.byType(Container).first);

    // Verify padding
    expect(container.padding, const EdgeInsets.all(24));
  });

  testWidgets('Footer spans full width', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find the footer container
    final container = tester.widget<Container>(find.byType(Container).first);

    // Verify width is set to full width
    expect(container.constraints?.maxWidth, double.infinity);
  });

  testWidgets('Footer header uses footHeader1 style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find the "Open hours" text widget
    final openHoursText = tester.widget<Text>(find.text('Open hours'));

    // Verify it uses footHeader1 style
    expect(openHoursText.style, footHeader1);
    expect(openHoursText.style?.fontSize, 20);
    expect(openHoursText.style?.color, const Color.fromARGB(255, 97, 97, 97));
    expect(openHoursText.style?.fontWeight, FontWeight.w600);
  });

  testWidgets('Footer subheaders use footHeader2 style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find the "Term time" text widget
    final termTimeText = tester.widget<Text>(find.text('Term time'));

    // Verify it uses footHeader2 style
    expect(termTimeText.style, footHeader2);
    expect(termTimeText.style?.fontSize, 18);
    expect(termTimeText.style?.color, const Color.fromARGB(255, 97, 97, 97));
    expect(termTimeText.style?.fontWeight, FontWeight.w600);
  });

  testWidgets('Footer hours use footNormal style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find one of the hours text widgets
    final hoursText = tester.widget<Text>(find.text('Monday-Friday(07:30-19:00)'));

    // Verify it uses footNormal style
    expect(hoursText.style, footNormal);
    expect(hoursText.style?.fontSize, 16);
    expect(hoursText.style?.color, Colors.grey);
    expect(hoursText.style?.fontWeight, FontWeight.w600);
  });

  testWidgets('Footer link uses footerlink style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find the "help me" text widget
    final helpMeText = tester.widget<Text>(find.text('help me'));

    // Verify it uses footerlink style
    expect(helpMeText.style, footerlink);
    expect(helpMeText.style?.fontSize, 16);
    expect(helpMeText.style?.color, const Color.fromARGB(255, 62, 130, 255));
    expect(helpMeText.style?.fontWeight, FontWeight.w600);
  });

  testWidgets('Footer link is wrapped in InkWell', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Verify InkWell exists
    expect(find.byType(InkWell), findsOneWidget);

    // Verify "help me" is inside InkWell
    final inkWell = find.ancestor(
      of: find.text('help me'),
      matching: find.byType(InkWell),
    );
    expect(inkWell, findsOneWidget);
  });

  testWidgets('Footer link is tappable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find and tap the "help me" link
    final helpMeLink = find.text('help me');
    expect(helpMeLink, findsOneWidget);

    // Tap the link (note: actual URL launching won't work in tests)
    await tester.tap(helpMeLink);
    await tester.pump();

    // No assertion needed - just verify it doesn't throw
  });

  testWidgets('Footer content is laid out in Column', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Verify Column exists
    final column = find.descendant(
      of: find.byType(Footer),
      matching: find.byType(Column),
    );
    expect(column, findsOneWidget);
  });

  testWidgets('Footer has proper spacing between elements', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Find SizedBox widgets used for spacing
    final sizedBoxes = find.byType(SizedBox);
    expect(sizedBoxes, findsWidgets);

    // Verify various spacing heights
    final sizedBoxWidgets = tester.widgetList<SizedBox>(sizedBoxes).toList();
    
    // Check that we have spacing of 4, 4, 4, 4, 4, 32
    expect(sizedBoxWidgets.where((box) => box.height == 4).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 32).length, greaterThan(0));
  });

  testWidgets('Footer displays all operating hours sections', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Footer(),
        ),
      ),
    );

    // Verify both time period sections exist
    expect(find.text('Term time'), findsOneWidget);
    expect(find.text('Monday-Friday(07:30-19:00)'), findsOneWidget);
    
    expect(find.text('Out of term or reading week'), findsOneWidget);
    expect(find.text('Monday-Thursday(09:00-15:00)'), findsOneWidget);
    
    expect(find.text('24/7 in store'), findsOneWidget);
  });
}
