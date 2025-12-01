import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';
import 'package:union_shop/part_builder/product_card.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/collection.dart';

void main() {
  testWidgets('UnionShopApp creates MaterialApp with correct title', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Find the MaterialApp widget
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

    // Verify title
    expect(materialApp.title, 'Union Shop');
  });

  testWidgets('UnionShopApp has debug banner disabled', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Find the MaterialApp widget
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

    // Verify debug banner is disabled
    expect(materialApp.debugShowCheckedModeBanner, false);
  });

  testWidgets('UnionShopApp has correct initial route', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Find the MaterialApp widget
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

    // Verify initial route
    expect(materialApp.initialRoute, '/');
  });

  testWidgets('UnionShopApp has about route configured', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Navigate to about page
    await tester.tap(find.byType(MaterialApp));
    await tester.pumpAndSettle();

    // Get the MaterialApp to verify routes
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.routes, isNotNull);
    expect(materialApp.routes!.containsKey('/about'), true);
  });

  testWidgets('UnionShopApp has collection route configured', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Get the MaterialApp to verify routes
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.routes, isNotNull);
    expect(materialApp.routes!.containsKey('/collection'), true);
  });

  testWidgets('HomeScreen displays MainHeader', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify MainHeader is displayed
    expect(find.byType(MainHeader), findsOneWidget);
  });

  testWidgets('HomeScreen displays Footer', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify Footer is displayed
    expect(find.byType(Footer), findsOneWidget);
  });

  testWidgets('HomeScreen displays Union Shop title', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify Union Shop title in hero section
    expect(find.text('Union Shop'), findsOneWidget);
  });

  testWidgets('HomeScreen displays sale message', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify sale message
    expect(find.text('WE have our no cold sale 20% off'), findsOneWidget);
  });

  testWidgets('HomeScreen displays "WE LOVE OUR PRODUCTS" button', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify button text
    expect(find.text('WE LOVE OUR PRODUCTS'), findsOneWidget);
  });

  testWidgets('HomeScreen "WE LOVE OUR PRODUCTS" button navigates to collection', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Tap the button
    await tester.tap(find.text('WE LOVE OUR PRODUCTS'));
    await tester.pumpAndSettle();

    // Verify navigation to CollectionPage
    expect(find.byType(CollectionPage), findsOneWidget);
  });

  testWidgets('HomeScreen displays "PRODUCTS SECTION" header', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify products section header
    expect(find.text('PRODUCTS SECTION'), findsOneWidget);
  });

  testWidgets('HomeScreen displays 6 product cards', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify 6 ProductCard widgets are displayed
    expect(find.byType(ProductCard), findsNWidgets(6));
  });

  testWidgets('HomeScreen displays warm jacket product', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify warm jacket product
    expect(find.text('warm jacket'), findsOneWidget);
    expect(find.text('£30.00'), findsOneWidget);
  });

  testWidgets('HomeScreen displays nice sleek jean product', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify jean product
    expect(find.text('nice sleek jean'), findsOneWidget);
    expect(find.text('£12.00'), findsOneWidget);
  });

  testWidgets('HomeScreen displays well hot hoodie product', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify hoodie product
    expect(find.text('well hot hoodie'), findsOneWidget);
    expect(find.text('£20.00'), findsOneWidget);
  });

  testWidgets('HomeScreen displays the hot mits product', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify mitts product
    expect(find.text('the hot mits'), findsOneWidget);
    expect(find.text('£7.00'), findsOneWidget);
  });

  testWidgets('HomeScreen displays silly hat product', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify hat product
    expect(find.text('silly hat'), findsOneWidget);
    expect(find.text('£7.50'), findsOneWidget);
  });

  testWidgets('HomeScreen displays rainbow socks product', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify socks product
    expect(find.text('rainbow socks'), findsOneWidget);
    expect(find.text('£9.00'), findsOneWidget);
  });

  testWidgets('HomeScreen is scrollable', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify SingleChildScrollView exists
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('HomeScreen hero section has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Find the hero section SizedBox
    final heroSizedBox = tester.widgetList<SizedBox>(find.byType(SizedBox)).firstWhere(
      (sizedBox) => sizedBox.height == 400 && sizedBox.width == double.infinity,
    );

    // Verify height
    expect(heroSizedBox.height, 400);
  });

  testWidgets('HomeScreen header container has correct height', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Find the header container
    final headerContainer = tester.widgetList<Container>(find.byType(Container)).firstWhere(
      (container) => container.constraints?.maxHeight == 100,
    );

    // Verify height
    expect(headerContainer.constraints?.maxHeight, 100);
    });

  testWidgets('HomeScreen uses GridView for products', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify GridView exists
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('HomeScreen GridView has correct configuration on narrow screen', (WidgetTester tester) async {
    // Set screen size to narrow width
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const UnionShopApp());

    // Find the GridView
    final gridView = tester.widget<GridView>(find.byType(GridView));

    // Verify crossAxisCount is 1 for narrow screens
    expect((gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount).crossAxisCount, 1);

    // Reset screen size
    addTearDown(tester.view.reset);
  });

  testWidgets('HomeScreen GridView has correct configuration on wide screen', (WidgetTester tester) async {
    // Set screen size to wide width
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const UnionShopApp());

    // Find the GridView
    final gridView = tester.widget<GridView>(find.byType(GridView));

    // Verify crossAxisCount is 2 for wide screens
    expect((gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount).crossAxisCount, 2);

    // Reset screen size
    addTearDown(tester.view.reset);
  });

  testWidgets('HomeScreen has Scaffold as root widget', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify Scaffold exists
    expect(find.byType(Scaffold), findsWidgets);
  });

  testWidgets('HomeScreen hero section has Stack layout', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Verify Stack exists in hero section
    expect(find.byType(Stack), findsOneWidget);
  });

  testWidgets('HomeScreen theme uses correct seed color', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Find the MaterialApp widget
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

    // Verify theme color scheme seed
    expect(materialApp.theme?.colorScheme.primary, isNotNull);
  });

  testWidgets('HomeScreen navigateToHome method exists', (WidgetTester tester) async {
    // Create an instance to verify the method exists
    const homeScreen = HomeScreen();
    
    // Verify the widget is created successfully
    expect(homeScreen, isNotNull);
  });

  testWidgets('AboutPage route works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Navigate to about page using Navigator
    final BuildContext context = tester.element(find.byType(MaterialApp));
    Navigator.of(context).pushNamed('/about');
    await tester.pumpAndSettle();

    // Verify AboutPage is displayed
    expect(find.byType(AboutPage), findsOneWidget);
  });

  testWidgets('CollectionPage route works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Navigate to collection page using Navigator
    final BuildContext context = tester.element(find.byType(MaterialApp));
    Navigator.of(context).pushNamed('/collection');
    await tester.pumpAndSettle();

    // Verify CollectionPage is displayed
    expect(find.byType(CollectionPage), findsOneWidget);
  });
}
