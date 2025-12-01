import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/part_builder/styled_button.dart';

void main() {
  testWidgets('StyledButton displays label text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StyledButton(
            onPressed: () {},
            label: 'Test Button',
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );

    // Verify the button label is displayed
    expect(find.text('Test Button'), findsOneWidget);
  });

  testWidgets('StyledButton has correct background color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StyledButton(
            onPressed: () {},
            label: 'Blue Button',
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );

    // Find the ElevatedButton widget
    final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final buttonStyle = elevatedButton.style;

    // Verify background color
    expect(buttonStyle?.backgroundColor?.resolve({}), Colors.blue);
  });

  testWidgets('StyledButton triggers onPressed callback', (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StyledButton(
            onPressed: () {
              wasPressed = true;
            },
            label: 'Click Me',
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );

    // Tap the button
    await tester.tap(find.byType(StyledButton));
    await tester.pump();

    // Verify callback was triggered
    expect(wasPressed, isTrue);
  });

  testWidgets('StyledButton can be disabled with null onPressed', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StyledButton(
            onPressed: null,
            label: 'Disabled Button',
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    );

    // Verify button exists
    expect(find.text('Disabled Button'), findsOneWidget);

    // Find the ElevatedButton and check if it's disabled
    final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(elevatedButton.onPressed, isNull);
  });

  testWidgets('StyledButton has white foreground color', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StyledButton(
            onPressed: () {},
            label: 'White Text',
            backgroundColor: Colors.purple,
          ),
        ),
      ),
    );

    // Find the ElevatedButton widget
    final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final buttonStyle = elevatedButton.style;

    // Verify foreground color (text color)
    expect(buttonStyle?.foregroundColor?.resolve({}), Colors.white);
  });

  testWidgets('StyledButton accepts different background colors', (WidgetTester tester) async {
    const testColor = Color.fromARGB(255, 64, 117, 221);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StyledButton(
            onPressed: () {},
            label: 'Custom Color',
            backgroundColor: testColor,
          ),
        ),
      ),
    );

    // Find the ElevatedButton widget
    final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final buttonStyle = elevatedButton.style;

    // Verify custom background color
    expect(buttonStyle?.backgroundColor?.resolve({}), testColor);
  });
}
