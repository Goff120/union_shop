import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collection.dart';
import 'package:union_shop/part_builder/collection_image.dart';
import 'package:union_shop/part_builder/footer.dart';
import 'package:union_shop/part_builder/main_header.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CollectionPage Widget Tests', () {
    testWidgets('CollectionPage is a StatefulWidget', (WidgetTester tester) async {
      const collectionPage = CollectionPage();
      
      expect(collectionPage, isA<StatefulWidget>());
    });

    // Note: Other tests require Firebase to be mocked or initialized
    // The CollectionPage uses DatabaseService which requires Firebase
    // To test the UI properly, you would need to:
    // 1. Mock the DatabaseService
    // 2. Use setupFirebaseAuthMocks() from firebase_auth_mocks package
    // 3. Or refactor CollectionPage to accept DatabaseService as a parameter
    
    /*

    testWidgets('CollectionPage displays MainHeader', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(MainHeader), findsOneWidget);
    });

    testWidgets('CollectionPage displays Footer', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('CollectionPage displays "Collection" title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pump();

      expect(find.text('Collection'), findsOneWidget);
    });

    testWidgets('CollectionPage shows loading indicator initially', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('CollectionPage displays CollectionImages after loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CollectionImage), findsWidgets);
    });

    testWidgets('CollectionPage has FutureBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      expect(find.byType(FutureBuilder<Map<String, String>>), findsOneWidget);
    });

    testWidgets('CollectionPage is scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('CollectionPage uses Wrap for collections', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Wrap), findsOneWidget);
    });

    testWidgets('CollectionPage Wrap has correct spacing', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pumpAndSettle();

      final wrap = tester.widget<Wrap>(find.byType(Wrap));

      expect(wrap.spacing, 20);
      expect(wrap.runSpacing, 20);
      expect(wrap.alignment, WrapAlignment.center);
    });

    testWidgets('CollectionPage has Scaffold as root widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('CollectionPage content is center-aligned', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pump();

      final scrollView = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );
      
      final column = scrollView.child as Column;

      expect(column.crossAxisAlignment, CrossAxisAlignment.center);
    });

    testWidgets('CollectionPage has proper spacing', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pump();

      final sizedBoxes = find.byType(SizedBox);
      expect(sizedBoxes, findsWidgets);

      final sizedBoxWidgets = tester.widgetList<SizedBox>(sizedBoxes).toList();
      
      expect(sizedBoxWidgets.where((box) => box.height == 50).length, greaterThan(0));
      expect(sizedBoxWidgets.where((box) => box.height == 30).length, greaterThan(0));
      expect(sizedBoxWidgets.where((box) => box.height == 12).length, greaterThan(0));
    });

    testWidgets('CollectionPage header container has correct height', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pump();

      final containers = tester.widgetList<Container>(find.byType(Container));
      final headerContainers = containers.where(
        (container) => container.color == Colors.white,
      ).toList();

      expect(headerContainers.isNotEmpty, true);
    });

    testWidgets('CollectionPage CollectionImages are tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CollectionPage(),
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: Text(settings.name ?? '')),
                body: const Center(child: Text('Collection Product Page')),
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      final collectionImages = find.byType(CollectionImage);
      
      if (tester.widgetList(collectionImages).isNotEmpty) {
        await tester.tap(collectionImages.first);
        await tester.pumpAndSettle();

        expect(find.byType(Scaffold), findsWidgets);
      }
    });

    testWidgets('CollectionPage handles error state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pumpAndSettle();

      final errorText = find.textContaining('Error:');
      expect(errorText, findsNothing);
    });

    testWidgets('CollectionPage displays categories dynamically', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );

      await tester.pumpAndSettle();

      final collectionImages = find.byType(CollectionImage);
      
      expect(tester.widgetList(collectionImages).length, greaterThanOrEqualTo(0));
    });
    */
  });
}

