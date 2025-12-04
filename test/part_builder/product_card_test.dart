import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/part_builder/product_card.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('ProductCard', () {
    testWidgets('displays title, regular price, and image when no sale price', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Test Product',
              price: '£25.00',
              image: 'assets/images/jacket.webp',
              discp: 'Test description',
              newprice: 'F',
            ),
          ),
        ),
      );

      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('displays sale price and strikethrough old price when on sale', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Sale Product',
              price: '£30.00',
              image: 'assets/images/jacket.webp',
              discp: 'Test description',
              newprice: '£20.00',
            ),
          ),
        ),
      );

      expect(find.text('Sale Product'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£30.00'), findsOneWidget);

      // Verify new price is bold
      final newPriceText = tester.widget<Text>(
        find.text('£20.00'),
      );
      expect(newPriceText.style?.fontWeight, FontWeight.bold);
      expect(newPriceText.style?.color, Colors.grey);

      // Verify old price has strikethrough and is red
      final oldPriceText = tester.widget<Text>(
        find.text('£30.00'),
      );
      expect(oldPriceText.style?.decoration, TextDecoration.lineThrough);
      expect(oldPriceText.style?.color, Colors.red);
    });
    testWidgets('navigates to ProductPage when tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: ProductCard(
              title: 'Tappable Product',
              price: '£15.00',
              image: 'assets/images/jacket.webp',
              discp: 'Tap me!',
              newprice: 'F',
            ),
          ),
          routes: {
            '/product': (context) => const ProductPage(
                  title: 'Tappable Product',
                ),
          },
        ),
      );

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      expect(find.byType(ProductPage), findsOneWidget);
      expect(find.text('Tappable Product'), findsWidgets);
    });

    testWidgets('displays image with correct dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Image Test',
              price: '£10.00',
              image: 'assets/images/jacket.webp',
              discp: 'Testing image',
              newprice: 'F',
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(ClipRRect),
          matching: find.byType(SizedBox),
        ).first,
      );

      expect(sizedBox.height, 250);
      expect(sizedBox.width, 370);
    });

    testWidgets('shows regular price only when newprice is "F"', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Regular Product',
              price: '£12.50',
              image: 'assets/images/jacket.webp',
              discp: 'Regular price item',
              newprice: 'F',
            ),
          ),
        ),
      );

      expect(find.text('£12.50'), findsOneWidget);
      expect(find.byType(Row), findsNothing); // No Row for sale price layout
    });

    testWidgets('shows sale price layout when newprice is not "F"', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Discount Product',
              price: '£50.00',
              image: 'assets/images/jacket.webp',
              discp: 'On sale now',
              newprice: '£35.00',
            ),
          ),
        ),
      );

      // Should find a Row containing both prices
      final rowFinder = find.descendant(
        of: find.byType(ProductCard),
        matching: find.byWidgetPredicate(
          (widget) => widget is Row && widget.children.length == 3,
        ),
      );
      expect(rowFinder, findsOneWidget);
    });
  });
}
