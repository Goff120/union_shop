import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collection_product_page.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/product_card.dart';

void main() {
  testWidgets('CollectionProductPage displays loading indicator initially', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Verify loading indicator is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('CollectionProductPage displays MainHeader', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify MainHeader is displayed
    expect(find.byType(MainHeader), findsOneWidget);
  });

  testWidgets('CollectionProductPage displays Footer', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify Footer is displayed
    expect(find.byType(Footer), findsOneWidget);
  });

  testWidgets('CollectionProductPage displays itemType as title in uppercase', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify title is displayed in uppercase
    expect(find.text('SOCKS'), findsOneWidget);
  });

  testWidgets('CollectionProductPage displays filter dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify filter dropdown hint text
    expect(find.text('filter by'), findsOneWidget);
  });

  testWidgets('CollectionProductPage displays sort dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify sort dropdown hint text
    expect(find.text('sort by'), findsOneWidget);
  });

  testWidgets('CollectionProductPage filter dropdown has correct options', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Tap the filter dropdown
    await tester.tap(find.text('filter by'));
    await tester.pumpAndSettle();

    // Verify filter options are displayed
    expect(find.text('all products'), findsOneWidget);
    expect(find.text('clothes'), findsOneWidget);
    expect(find.text('merch'), findsOneWidget);
    expect(find.text('popular'), findsWidgets);
  });

  testWidgets('CollectionProductPage sort dropdown has correct options', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Tap the sort dropdown
    await tester.tap(find.text('sort by'));
    await tester.pumpAndSettle();

    // Verify sort options are displayed
    expect(find.text('price: low to high'), findsOneWidget);
    expect(find.text('price: high to low'), findsOneWidget);
    expect(find.text('newest first'), findsOneWidget);
    expect(find.text('best sellers'), findsOneWidget);
    expect(find.text('ratings'), findsOneWidget);
  });

  testWidgets('CollectionProductPage displays product cards for socks', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify ProductCard widgets are displayed
    expect(find.byType(ProductCard), findsWidgets);
    
    // Verify some product titles from items.json
    expect(find.text('rainbow socks'), findsOneWidget);
    expect(find.text('striped socks'), findsOneWidget);
  });

  testWidgets('CollectionProductPage displays prices', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify some prices from items.json
    expect(find.text('£9.00'), findsOneWidget);
    expect(find.text('£7.50'), findsOneWidget);
  });

  testWidgets('CollectionProductPage is scrollable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify SingleChildScrollView exists
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('CollectionProductPage header container has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Find the header container
    final headerContainer = tester.widgetList<Container>(find.byType(Container)).firstWhere(
      (container) => container.constraints?.maxHeight == 100 && container.color == Colors.white,
    );

    // Verify height
    expect(headerContainer.constraints?.maxHeight, 100);
  });

  testWidgets('CollectionProductPage has proper spacing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Find SizedBox widgets used for spacing
    final sizedBoxes = find.byType(SizedBox);
    expect(sizedBoxes, findsWidgets);

    // Verify spacing heights exist
    final sizedBoxWidgets = tester.widgetList<SizedBox>(sizedBoxes).toList();
    
    // Check for spacing of 50, 30, 16
    expect(sizedBoxWidgets.where((box) => box.height == 50).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 30).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.width == 16).length, greaterThan(0));
  });

  testWidgets('CollectionProductPage uses FutureBuilder', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Verify FutureBuilder exists
    expect(find.byType(FutureBuilder<Map<String, dynamic>>), findsOneWidget);
  });

  testWidgets('CollectionProductPage handles empty itemType gracefully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'nonexistent'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Verify page still renders without error
    expect(find.byType(MainHeader), findsOneWidget);
    expect(find.byType(Footer), findsOneWidget);
    expect(find.text('NONEXISTENT'), findsOneWidget);
    
    // Verify no products are displayed
    expect(find.byType(ProductCard), findsNothing);
  });

  testWidgets('CollectionProductPage dropdowns are expanded', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Find the dropdowns
    final dropdowns = tester.widgetList<DropdownButton>(find.byType(DropdownButton)).toList();
    
    // Verify both dropdowns are expanded
    expect(dropdowns[0].isExpanded, isTrue);
    expect(dropdowns[1].isExpanded, isTrue);
  });

  testWidgets('CollectionProductPage dropdowns have underlines', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Find the dropdowns
    final dropdowns = tester.widgetList<DropdownButton>(find.byType(DropdownButton)).toList();
    
    // Verify both dropdowns have underlines (containers with height 2 and black color)
    for (var dropdown in dropdowns) {
      expect(dropdown.underline, isA<Container>());
    }
  });

  testWidgets('CollectionProductPage content is center-aligned', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionProductPage(itemType: 'socks'),
      ),
    );

    // Wait for the future to complete
    await tester.pumpAndSettle();

    // Find the main content Column inside SingleChildScrollView
    final scrollView = tester.widget<SingleChildScrollView>(
      find.byType(SingleChildScrollView),
    );
    
    final column = scrollView.child as Column;

    // Verify center alignment
    expect(column.crossAxisAlignment, CrossAxisAlignment.center);
  });
}
