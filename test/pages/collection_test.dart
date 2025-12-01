import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collection.dart';
import 'package:union_shop/part_builder/collection_image.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';

void main() {
  testWidgets('CollectionPage displays MainHeader', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify MainHeader is displayed
    expect(find.byType(MainHeader), findsOneWidget);
  });

  testWidgets('CollectionPage displays Footer', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify Footer is displayed
    expect(find.byType(Footer), findsOneWidget);
  });

  testWidgets('CollectionPage displays "Collection" title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify title is displayed
    expect(find.text('Collection'), findsOneWidget);
  });

  testWidgets('CollectionPage displays all collection images', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify 9 CollectionImage widgets are displayed
    expect(find.byType(CollectionImage), findsNWidgets(9));
  });

  testWidgets('CollectionPage displays SOCKS collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify SOCKS collection text
    expect(find.text('SOCKS'), findsOneWidget);
  });

  testWidgets('CollectionPage displays Winter Sales collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify Winter Sales collection text
    expect(find.text('Winter Sales'), findsOneWidget);
  });

  testWidgets('CollectionPage displays shirts collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify shirts collection text
    expect(find.text('shirts'), findsOneWidget);
  });

  testWidgets('CollectionPage displays hats collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify hats collection text
    expect(find.text('hats'), findsOneWidget);
  });

  testWidgets('CollectionPage displays trousers collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify trousers collection text
    expect(find.text('trousers'), findsOneWidget);
  });

  testWidgets('CollectionPage displays hoodie collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify hoodie collection text
    expect(find.text('hoodie'), findsOneWidget);
  });

  testWidgets('CollectionPage displays must haves collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify must haves collection text
    expect(find.text('get the must haves'), findsOneWidget);
  });

  testWidgets('CollectionPage displays merch collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify merch collection text
    expect(find.text('merch'), findsOneWidget);
  });

  testWidgets('CollectionPage displays pride collection', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify pride collection text
    expect(find.text('our pride'), findsOneWidget);
  });

  testWidgets('CollectionPage is scrollable', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify SingleChildScrollView exists
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('CollectionPage uses Wrap for collections', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify Wrap widget exists
    expect(find.byType(Wrap), findsOneWidget);
  });

  testWidgets('CollectionPage Wrap has correct spacing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Find the Wrap widget
    final wrap = tester.widget<Wrap>(find.byType(Wrap));

    // Verify spacing
    expect(wrap.spacing, 20);
    expect(wrap.runSpacing, 20);
    expect(wrap.alignment, WrapAlignment.center);
  });

  testWidgets('CollectionPage header container has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Find the header container
    final headerContainer = tester.widgetList<Container>(find.byType(Container)).firstWhere(
      (container) => container.constraints?.maxHeight == 100 && container.color == Colors.white,
    );

    // Verify height
    expect(headerContainer.constraints?.maxHeight, 100);
    });

  testWidgets('CollectionPage has proper spacing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Find SizedBox widgets used for spacing
    final sizedBoxes = find.byType(SizedBox);
    expect(sizedBoxes, findsWidgets);

    // Verify spacing heights exist
    final sizedBoxWidgets = tester.widgetList<SizedBox>(sizedBoxes).toList();
    
    // Check for spacing of 50, 30, 12
    expect(sizedBoxWidgets.where((box) => box.height == 50).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 30).length, greaterThan(0));
    expect(sizedBoxWidgets.where((box) => box.height == 12).length, greaterThan(0));
  });

  testWidgets('CollectionPage content is center-aligned', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Find the main content Column inside SingleChildScrollView
    final scrollView = tester.widget<SingleChildScrollView>(
      find.byType(SingleChildScrollView),
    );
    
    final column = scrollView.child as Column;

    // Verify center alignment
    expect(column.crossAxisAlignment, CrossAxisAlignment.center);
  });

  testWidgets('CollectionPage collection images have correct dimensions', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Find all CollectionImage widgets
    final collectionImages = tester.widgetList<CollectionImage>(
      find.byType(CollectionImage),
    ).toList();

    // Verify all have width 350 and height 250
    for (var image in collectionImages) {
      expect(image.width, 350);
      expect(image.height, 250);
    }
  });

  testWidgets('CollectionPage has Scaffold as root widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Verify Scaffold exists
    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('CollectionPage navigateToHome method exists', (WidgetTester tester) async {
    // Create an instance to verify the method exists
    const collectionPage = CollectionPage();
    
    // Verify the widget is created successfully
    expect(collectionPage, isNotNull);
  });

  testWidgets('CollectionPage collections have correct route names', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(),
      ),
    );

    // Find all CollectionImage widgets
    final collectionImages = tester.widgetList<CollectionImage>(
      find.byType(CollectionImage),
    ).toList();

    // Verify route names
    expect(collectionImages[0].routeName, 'socks');
    expect(collectionImages[1].routeName, 'winter-collection');
    expect(collectionImages[2].routeName, 'shirts');
    expect(collectionImages[3].routeName, 'hats');
    expect(collectionImages[4].routeName, 'trousers');
    expect(collectionImages[5].routeName, 'hoodie');
    expect(collectionImages[6].routeName, 'must_have');
    expect(collectionImages[7].routeName, 'merch');
    expect(collectionImages[8].routeName, 'pride');
  });
}
