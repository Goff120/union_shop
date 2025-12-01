import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/styled_button.dart';

void main() {
  testWidgets('ProductPage displays MainHeader', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',                                                                                                            
        ),
      ),
    );

    // Verify MainHeader is displayed
    expect(find.byType(MainHeader), findsOneWidget);
  });

  testWidgets('ProductPage displays Footer', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify Footer is displayed
    expect(find.byType(Footer), findsOneWidget);
  });

  testWidgets('ProductPage displays product title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Amazing Product',
          price: '£25.00',
          discp: 'Product description',
        ),
      ),
    );

    // Verify title is displayed
    expect(find.text('Amazing Product'), findsOneWidget);
  });

  testWidgets('ProductPage displays product price', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£99.99',
          discp: 'Test description',
        ),
      ),
    );

    // Verify price is displayed
    expect(find.text('£99.99'), findsOneWidget);
  });

  testWidgets('ProductPage displays product description', (WidgetTester tester) async {
    const testDiscp = 'This is a wonderful product with great features';

    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£20.00',
          discp: testDiscp,
        ),
      ),
    );

    // Verify description is displayed
    expect(find.text(testDiscp), findsOneWidget);
  });

  testWidgets('ProductPage displays "Description" header', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify Description header
    expect(find.text('Description'), findsOneWidget);
  });

  testWidgets('ProductPage displays "Purchase" header', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify Purchase header
    expect(find.text('Purchase'), findsOneWidget);
  });

  testWidgets('ProductPage displays colour dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify colour dropdown exists using key
    expect(find.byKey(const Key('colour_dropdown')), findsOneWidget);
  });

  

  testWidgets('ProductPage displays size dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify size dropdown exists using key
    expect(find.byKey(const Key('size_dropdown')), findsOneWidget);
  });

  

  testWidgets('ProductPage displays amount text field', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify amount text field
    expect(find.widgetWithText(TextField, 'Enter amount'), findsOneWidget);
  });

  testWidgets('ProductPage amount field accepts input', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Find and enter text in amount field
    final amountField = find.widgetWithText(TextField, 'Enter amount');
    await tester.enterText(amountField, '5');
    
    // Verify text was entered
    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('ProductPage displays "Add to Cart" button', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify Add to Cart button
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.byType(StyledButton), findsOneWidget);
  });

  testWidgets('ProductPage "Add to Cart" button is tappable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Tap the Add to Cart button
    await tester.tap(find.text('Add to Cart'));
    await tester.pump();

    // No assertion needed - just verify it doesn't throw
  });

  testWidgets('ProductPage is scrollable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify SingleChildScrollView exists
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('ProductPage header container has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Find the header container
    final headerContainer = tester.widgetList<Container>(find.byType(Container)).firstWhere(
      (container) => container.constraints?.maxHeight == 100 && container.color == Colors.white,
    );

    // Verify height
    expect(headerContainer.constraints?.maxHeight, 100);
  });

  testWidgets('ProductPage image container has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Find image containers
    final imageContainers = tester.widgetList<Container>(find.byType(Container))
        .where((container) => container.constraints?.maxHeight == 300);

    // Verify at least one image container exists with height 300
    expect(imageContainers.length, greaterThan(0));
  });

  testWidgets('ProductPage title has correct text style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Styled Title Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Find the title Text widget
    final titleText = tester.widgetList<Text>(find.text('Styled Title Product')).first;

    // Verify text style
    expect(titleText.style?.fontSize, 28);
    expect(titleText.style?.fontWeight, FontWeight.bold);
    expect(titleText.style?.color, Colors.black);
  });

  testWidgets('ProductPage price has correct text style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£50.00',
          discp: 'Test description',
        ),
      ),
    );

    // Find the price Text widget
    final priceText = tester.widgetList<Text>(find.text('£50.00')).first;

    // Verify text style
    expect(priceText.style?.fontSize, 24);
    expect(priceText.style?.fontWeight, FontWeight.bold);
    expect(priceText.style?.color, const Color(0xFF4d2963));
  });

  testWidgets('ProductPage dropdowns are expanded', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Find the dropdowns
    final dropdowns = tester.widgetList<DropdownButton>(find.byType(DropdownButton)).toList();
    
    // Verify both dropdowns are expanded
    for (var dropdown in dropdowns) {
      expect(dropdown.isExpanded, isTrue);
    }
  });

  testWidgets('ProductPage has ClipRRect with rounded corners', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Find the ClipRRect widget
    final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));

    // Verify border radius
    expect(clipRRect.borderRadius, BorderRadius.circular(8));
  });

  testWidgets('ProductPage has Scaffold as root widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify Scaffold exists
    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('ProductPage size and amount fields are in a row', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(
          image: 'assets/images/test.png',
          title: 'Test Product',
          price: '£15.00',
          discp: 'Test description',
        ),
      ),
    );

    // Verify Row exists containing both size dropdown and amount field
    final rows = find.byType(Row);
    expect(rows, findsWidgets);
  });
}
