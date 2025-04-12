import 'package:animated_snackbars/animated_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SnackbarUtils Tests', () {
    testWidgets('showAnimatedSnackbar shows a snackbar', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showAnimatedSnackbar(
                        context: context,
                        message: 'Test Message',
                        description: 'Test Description',
                      );
                    },
                    child: const Text('Show Snackbar'),
                  ),
            ),
          ),
        ),
      );

      // Find the button and tap it.
      final buttonFinder = find.text('Show Snackbar');
      expect(buttonFinder, findsOneWidget);
      await tester.tap(buttonFinder);

      // Wait for the animation to start.
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Verify that the snackbar widget is in the widget tree.
      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('Test Message'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });

    testWidgets('showSuccessSnackbar shows a success snackbar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showSuccessSnackbar(
                        context: context,
                        message: 'Success Message',
                        description: 'Success Description',
                      );
                    },
                    child: const Text('Show Success Snackbar'),
                  ),
            ),
          ),
        ),
      );

      final buttonFinder = find.text('Show Success Snackbar');
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('Success Message'), findsOneWidget);
      expect(find.text('Success Description'), findsOneWidget);
      // Verify color:
      final snackBarFinder = find.byType(SnackBarWidget);
      final snackBarWidget = tester.widget<SnackBarWidget>(snackBarFinder);
      expect(snackBarWidget.color, const Color(0xDD28A745));

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });
    testWidgets('showErrorSnackbar shows an error snackbar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showErrorSnackbar(
                        context: context,
                        message: 'Error Message',
                        description: 'Error Description',
                      );
                    },
                    child: const Text('Show Error Snackbar'),
                  ),
            ),
          ),
        ),
      );

      final buttonFinder = find.text('Show Error Snackbar');
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('Error Message'), findsOneWidget);
      expect(find.text('Error Description'), findsOneWidget);
      // Verify color:
      final snackBarFinder = find.byType(SnackBarWidget);
      final snackBarWidget = tester.widget<SnackBarWidget>(snackBarFinder);
      expect(snackBarWidget.color, const Color(0xDDC72C41));

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });
    testWidgets('showInfoSnackbar shows an info snackbar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showInfoSnackbar(
                        context: context,
                        message: 'Info Message',
                        description: 'Info Description',
                      );
                    },
                    child: const Text('Show Info Snackbar'),
                  ),
            ),
          ),
        ),
      );

      final buttonFinder = find.text('Show Info Snackbar');
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('Info Message'), findsOneWidget);
      expect(find.text('Info Description'), findsOneWidget);
      // Verify color:
      final snackBarFinder = find.byType(SnackBarWidget);
      final snackBarWidget = tester.widget<SnackBarWidget>(snackBarFinder);
      expect(snackBarWidget.color, const Color(0xDD007BFF));

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });

    testWidgets('showWarningSnackbar shows a warning snackbar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showWarningSnackbar(
                        context: context,
                        message: 'Warning Message',
                        description: 'Warning Description',
                      );
                    },
                    child: const Text('Show Warning Snackbar'),
                  ),
            ),
          ),
        ),
      );

      final buttonFinder = find.text('Show Warning Snackbar');
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('Warning Message'), findsOneWidget);
      expect(find.text('Warning Description'), findsOneWidget);
      // Verify color:
      final snackBarFinder = find.byType(SnackBarWidget);
      final snackBarWidget = tester.widget<SnackBarWidget>(snackBarFinder);
      expect(snackBarWidget.color, const Color(0xDDFFC107));

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });
  });

  group('SnackbarUtils Additional Tests', () {
    testWidgets('Custom duration test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showAnimatedSnackbar(
                        context: context,
                        message: 'Custom Duration',
                        description: 'Test Description',
                        duration: const Duration(milliseconds: 1000),
                      );
                    },
                    child: const Text('Show Custom Duration'),
                  ),
            ),
          ),
        ),
      );

      final buttonFinder = find.text('Show Custom Duration');
      await tester.tap(buttonFinder);

      // Wait for the initial frame
      await tester.pump();

      // Wait for the overlay to be added
      await tester.pump(const Duration(milliseconds: 50));

      // Wait for the animation to complete
      await tester.pump(const Duration(milliseconds: 500));

      // Verify snackbar appears
      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('Custom Duration'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);

      // Wait for the full duration
      await tester.pump(const Duration(milliseconds: 1000));

      // Wait for the exit animation to complete
      await tester.pump(const Duration(milliseconds: 500));
    });

    testWidgets('Multiple snackbars test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          SnackbarUtils.showSuccessSnackbar(
                            context: context,
                            message: 'First Snackbar',
                            description: 'First Description',
                          );
                        },
                        child: const Text('Show First'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          SnackbarUtils.showErrorSnackbar(
                            context: context,
                            message: 'Second Snackbar',
                            description: 'Second Description',
                          );
                        },
                        child: const Text('Show Second'),
                      ),
                    ],
                  ),
            ),
          ),
        ),
      );

      // Show first snackbar
      await tester.tap(find.text('Show First'));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('First Snackbar'), findsOneWidget);

      // Show second snackbar
      await tester.tap(find.text('Show Second'));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Verify only the second snackbar is visible
      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text('Second Snackbar'), findsOneWidget);
      expect(find.text('First Snackbar'), findsNothing);

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });

    testWidgets('Custom color test', (WidgetTester tester) async {
      const customColor = Color(0xDD800080); // Purple color

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showAnimatedSnackbar(
                        context: context,
                        message: 'Custom Color',
                        description: 'Test Description',
                        color: customColor,
                      );
                    },
                    child: const Text('Show Custom Color'),
                  ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom Color'));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      final snackBarFinder = find.byType(SnackBarWidget);
      final snackBarWidget = tester.widget<SnackBarWidget>(snackBarFinder);
      expect(snackBarWidget.color, customColor);

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });

    testWidgets('Empty message and description test', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showAnimatedSnackbar(
                        context: context,
                        message: '',
                        description: '',
                      );
                    },
                    child: const Text('Show Empty'),
                  ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Empty'));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Verify snackbar still appears with empty text
      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(
        find.text(''),
        findsNWidgets(2),
      ); // Both message and description are empty

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });

    testWidgets('Long text test', (WidgetTester tester) async {
      const longMessage =
          'This is a very long message that should be properly displayed in the snackbar without any issues or overflow problems.';
      const longDescription =
          'This is a very long description that should also be properly displayed in the snackbar without any issues or overflow problems.';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder:
                  (context) => ElevatedButton(
                    onPressed: () {
                      SnackbarUtils.showAnimatedSnackbar(
                        context: context,
                        message: longMessage,
                        description: longDescription,
                      );
                    },
                    child: const Text('Show Long Text'),
                  ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Long Text'));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Verify snackbar appears with long text
      expect(find.byType(SnackBarWidget), findsOneWidget);
      expect(find.text(longMessage), findsOneWidget);
      expect(find.text(longDescription), findsOneWidget);

      // Verify no overflow errors
      expect(tester.takeException(), isNull);

      // Wait for the full duration plus animation time
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });
  });
}
