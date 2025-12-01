import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/part_builder/product_card.dart';
import 'package:union_shop/product_page.dart';

void main() {
  testWidgets('ProductCard displays title and price', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Test Product',
            price: '£19.99',
            image: 'assets/images/test.png',
            discp: 'Test description',
          ),
        ),
      ),
    );

    // Verify title and price are displayed
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('£19.99'), findsOneWidget);
  });

  testWidgets('ProductCard displays image with correct dimensions', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Image Product',
            price: '£25.00',
            image: 'assets/images/product.png',
            discp: 'Product description',
          ),
        ),
      ),
    );

    // Find the SizedBox container for the image
    final sizedBox = tester.widget<SizedBox>(
      find.descendant(
        of: find.byType(ProductCard),
        matching: find.byType(SizedBox),
      ).first,
    );

    // Verify image container dimensions
    expect(sizedBox.height, 250);
    expect(sizedBox.width, 370);
  });

  testWidgets('ProductCard navigates to ProductPage on tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Tappable Product',
            price: '£30.00',
            image: 'assets/images/tappable.png',
            discp: 'Tappable description',
          ),
        ),
      ),
    );

    // Tap the product card
    await tester.tap(find.byType(ProductCard));
    await tester.pumpAndSettle();

    // Verify navigation to ProductPage occurred
    expect(find.byType(ProductPage), findsOneWidget);
    
    // Verify the ProductPage shows the correct title and price
    expect(find.text('Tappable Product'), findsOneWidget);
    expect(find.text('£30.00'), findsOneWidget);
  });

  testWidgets('ProductCard passes all parameters to ProductPage', (WidgetTester tester) async {
    const testTitle = 'Full Test Product';
    const testPrice = '£45.99';
    const testImage = 'assets/images/full_test.png';
    const testDiscp = 'Full test description';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: testTitle,
            price: testPrice,
            image: testImage,
            discp: testDiscp,
          ),
        ),
      ),
    );

    // Tap the card to navigate
    await tester.tap(find.byType(ProductCard));
    await tester.pumpAndSettle();

    // Find the ProductPage widget
    final productPage = tester.widget<ProductPage>(find.byType(ProductPage));

    // Verify all parameters were passed correctly
    expect(productPage.title, testTitle);
    expect(productPage.price, testPrice);
    expect(productPage.image, testImage);
    expect(productPage.discp, testDiscp);
  });

  testWidgets('ProductCard title has correct text style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Styled Title',
            price: '£10.00',
            image: 'assets/images/styled.png',
            discp: 'Styled description',
          ),
        ),
      ),
    );

    // Find the title Text widget
    final titleText = tester.widget<Text>(find.text('Styled Title'));

    // Verify text style
    expect(titleText.style?.fontSize, 14);
    expect(titleText.style?.color, Colors.black);
    expect(titleText.maxLines, 2);
  });

  testWidgets('ProductCard price has correct text style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Price Test',
            price: '£99.99',
            image: 'assets/images/price.png',
            discp: 'Price description',
          ),
        ),
      ),
    );

    // Find the price Text widget
    final priceText = tester.widget<Text>(find.text('£99.99'));

    // Verify text style
    expect(priceText.style?.fontSize, 13);
    expect(priceText.style?.color, Colors.grey);
  });

  testWidgets('ProductCard has ClipRRect with rounded corners', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Rounded Product',
            price: '£15.00',
            image: 'assets/images/rounded.png',
            discp: 'Rounded description',
          ),
        ),
      ),
    );

    // Find the ClipRRect widget
    final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));

    // Verify border radius
    expect(clipRRect.borderRadius, BorderRadius.circular(4));
  });

  testWidgets('ProductCard shows error icon when image fails to load', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Invalid Image',
            price: '£20.00',
            image: 'assets/images/nonexistent.png',
            discp: 'Invalid image description',
          ),
        ),
      ),
    );

    await tester.pump();

    // Verify error builder container exists
    expect(find.byType(Container), findsWidgets);
    expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
  });
}
