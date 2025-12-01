import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/part_builder/collection_image.dart';
import 'package:union_shop/collection_product_page.dart';

void main() {
  testWidgets('CollectionImage displays text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/test.png',
            text: 'Test Collection',
            routeName: 'test_route',
          ),
        ),
      ),
    );

    // Verify text is displayed
    expect(find.text('Test Collection'), findsOneWidget);
  });

  testWidgets('CollectionImage has default width and height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/test.png',
            text: 'Default Size',
            routeName: 'default',
          ),
        ),
      ),
    );

    // Find the SizedBox
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));

    // Verify default dimensions
    expect(sizedBox.width, 200);
    expect(sizedBox.height, 200);
  });

  testWidgets('CollectionImage accepts custom width and height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/custom.png',
            text: 'Custom Size',
            routeName: 'custom',
            width: 300,
            height: 400,
          ),
        ),
      ),
    );

    // Find the SizedBox
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));

    // Verify custom dimensions
    expect(sizedBox.width, 300);
    expect(sizedBox.height, 400);
  });

  testWidgets('CollectionImage text has correct style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/test.png',
            text: 'Styled Text',
            routeName: 'styled',
          ),
        ),
      ),
    );

    // Find the text widget
    final textWidget = tester.widget<Text>(find.text('Styled Text'));

    // Verify text style
    expect(textWidget.style?.color, Colors.white);
    expect(textWidget.style?.fontSize, 24);
    expect(textWidget.style?.fontWeight, FontWeight.bold);
    expect(textWidget.textAlign, TextAlign.center);
  });

  testWidgets('CollectionImage navigates to CollectionProductPage on tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/tappable.png',
            text: 'Tappable Collection',
            routeName: 'tappable_route',
          ),
        ),
      ),
    );

    // Tap the collection image
    await tester.tap(find.byType(CollectionImage));
    await tester.pumpAndSettle();

    // Verify navigation to CollectionProductPage occurred
    expect(find.byType(CollectionProductPage), findsOneWidget);
  });

  testWidgets('CollectionImage passes routeName as itemType to CollectionProductPage', (WidgetTester tester) async {
    const testRouteName = 'clothing_collection';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/clothing.png',
            text: 'Clothing',
            routeName: testRouteName,
          ),
        ),
      ),
    );

    // Tap the collection image
    await tester.tap(find.byType(CollectionImage));
    await tester.pumpAndSettle();

    // Find the CollectionProductPage widget
    final collectionPage = tester.widget<CollectionProductPage>(
      find.byType(CollectionProductPage),
    );

    // Verify routeName was passed as itemType
    expect(collectionPage.itemType, testRouteName);
  });

  testWidgets('CollectionImage has ClipRRect with rounded corners', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/rounded.png',
            text: 'Rounded',
            routeName: 'rounded',
          ),
        ),
      ),
    );

    // Find the ClipRRect widget
    final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));

    // Verify border radius
    expect(clipRRect.borderRadius, BorderRadius.circular(8));
  });

  testWidgets('CollectionImage has dark overlay', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/overlay.png',
            text: 'Overlay Test',
            routeName: 'overlay',
          ),
        ),
      ),
    );

    // Find Container widgets
    final containers = tester.widgetList<Container>(find.byType(Container));

    // Find the overlay container (has decoration with color and opacity)
    final overlayContainer = containers.firstWhere(
      (container) => container.decoration is BoxDecoration,
    );

    final boxDecoration = overlayContainer.decoration as BoxDecoration;

    // Verify overlay has rounded corners
    expect(boxDecoration.borderRadius, BorderRadius.circular(8));
    
    // Verify overlay color has opacity (black with 0.4 opacity)
    expect(boxDecoration.color, Colors.black.withOpacity(0.4));
  });

  testWidgets('CollectionImage uses Stack layout', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/stack.png',
            text: 'Stack Test',
            routeName: 'stack',
          ),
        ),
      ),
    );

    // Verify Stack exists
    final stack = find.descendant(
      of: find.byType(CollectionImage),
      matching: find.byType(Stack),
    );
    expect(stack, findsOneWidget);

    // Verify Stack fit
    final stackWidget = tester.widget<Stack>(stack);
    expect(stackWidget.fit, StackFit.expand);
  });

  testWidgets('CollectionImage shows error icon when image fails to load', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/nonexistent.png',
            text: 'Error Test',
            routeName: 'error',
          ),
        ),
      ),
    );

    await tester.pump();

    // Verify error builder shows icon
    expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
  });

  testWidgets('CollectionImage text is centered', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/centered.png',
            text: 'Centered Text',
            routeName: 'centered',
          ),
        ),
      ),
    );

    // Verify text is wrapped in Center widget
    final centerWidget = find.ancestor(
      of: find.text('Centered Text'),
      matching: find.byType(Center),
    );
    expect(centerWidget, findsOneWidget);
  });

  testWidgets('CollectionImage is wrapped in GestureDetector', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CollectionImage(
            imageUrl: 'assets/images/gesture.png',
            text: 'Gesture Test',
            routeName: 'gesture',
          ),
        ),
      ),
    );

    // Verify GestureDetector exists
    expect(find.byType(GestureDetector), findsOneWidget);
  });

}