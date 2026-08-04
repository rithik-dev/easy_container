import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Pumps [child] inside a minimal [MaterialApp] so theme lookups resolve.
Future<void> pumpContainer(WidgetTester tester, Widget child) {
  return tester.pumpWidget(MaterialApp(home: Scaffold(body: child)));
}

Card findCard(WidgetTester tester) => tester.widget<Card>(find.byType(Card).first);

/// The padding wrapping the child.
///
/// Scoped to inside the [InkWell]: [Card] renders its own margin as a [Padding]
/// too, and that one sits higher in the tree.
EdgeInsetsGeometry findContentPadding(WidgetTester tester) => tester
    .widget<Padding>(
      find.descendant(of: find.byType(InkWell), matching: find.byType(Padding)).first,
    )
    .padding;

void main() {
  group('rendering', () {
    testWidgets('renders its child', (tester) async {
      await pumpContainer(tester, const EasyContainer(child: Text('hello')));

      expect(find.text('hello'), findsOneWidget);
    });

    testWidgets('applies the default elevation, padding and margin', (
      tester,
    ) async {
      await pumpContainer(tester, const EasyContainer(child: SizedBox()));

      expect(findCard(tester).elevation, 1.5);
      expect(findCard(tester).margin, const EdgeInsets.all(5));
      expect(findContentPadding(tester), const EdgeInsets.all(10));
    });

    testWidgets('customPadding and customMargin win over the shorthands', (
      tester,
    ) async {
      await pumpContainer(
        tester,
        const EasyContainer(
          padding: 99,
          margin: 99,
          customPadding: EdgeInsets.all(4),
          customMargin: EdgeInsets.all(7),
          child: SizedBox(),
        ),
      );

      expect(findCard(tester).margin, const EdgeInsets.all(7));
      expect(findContentPadding(tester), const EdgeInsets.all(4));
    });

    testWidgets('showBorder toggles the border side', (tester) async {
      await pumpContainer(tester, const EasyContainer(child: SizedBox()));
      var shape = findCard(tester).shape! as RoundedRectangleBorder;
      expect(shape.side, BorderSide.none);

      await pumpContainer(
        tester,
        const EasyContainer(
          showBorder: true,
          borderWidth: 3,
          borderColor: Colors.red,
          child: SizedBox(),
        ),
      );
      shape = findCard(tester).shape! as RoundedRectangleBorder;
      expect(shape.side.color, Colors.red);
      expect(shape.side.width, 3);
    });

    testWidgets('allowOverflow controls clipping', (tester) async {
      await pumpContainer(tester, const EasyContainer(child: SizedBox()));
      expect(findCard(tester).clipBehavior, Clip.hardEdge);

      await pumpContainer(
        tester,
        const EasyContainer(allowOverflow: true, child: SizedBox()),
      );
      expect(findCard(tester).clipBehavior, isNot(Clip.hardEdge));
    });

    testWidgets('a null alignment skips the Align wrapper', (tester) async {
      await pumpContainer(
        tester,
        const EasyContainer(alignment: null, child: Text('x')),
      );

      expect(
        find.descendant(of: find.byType(Card), matching: find.byType(Align)),
        findsNothing,
      );
    });
  });

  group('gestures', () {
    testWidgets('onTap fires', (tester) async {
      var taps = 0;
      await pumpContainer(
        tester,
        EasyContainer(onTap: () => taps++, child: const Text('tap me')),
      );

      await tester.tap(find.text('tap me'));
      expect(taps, 1);
    });

    testWidgets('sinks the elevation while pressed, and restores it', (
      tester,
    ) async {
      await pumpContainer(
        tester,
        EasyContainer(elevation: 10, onTap: () {}, child: const Text('x')),
      );
      expect(findCard(tester).elevation, 10);

      // Press and hold: elevation above 2.5 sinks to 2.5.
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('x')),
      );
      await tester.pumpAndSettle();
      expect(findCard(tester).elevation, 2.5);

      await gesture.up();
      await tester.pumpAndSettle();
      expect(findCard(tester).elevation, 10);
    });

    testWidgets('an elevation at or below 2.5 sinks all the way to 0', (
      tester,
    ) async {
      await pumpContainer(
        tester,
        EasyContainer(elevation: 1.5, onTap: () {}, child: const Text('x')),
      );

      final gesture = await tester.startGesture(
        tester.getCenter(find.text('x')),
      );
      await tester.pumpAndSettle();
      expect(findCard(tester).elevation, 0);

      await gesture.up();
      await tester.pumpAndSettle();
      expect(findCard(tester).elevation, 1.5);
    });

    testWidgets('zeroDownElevationOnTap: false holds the elevation steady', (
      tester,
    ) async {
      await pumpContainer(
        tester,
        EasyContainer(
          elevation: 10,
          zeroDownElevationOnTap: false,
          onTap: () {},
          child: const Text('x'),
        ),
      );

      final gesture = await tester.startGesture(
        tester.getCenter(find.text('x')),
      );
      await tester.pumpAndSettle();
      expect(findCard(tester).elevation, 10);
      await gesture.up();
    });

    testWidgets('onHighlightChanged fires on press and release', (tester) async {
      final changes = <bool>[];
      await pumpContainer(
        tester,
        EasyContainer(
          onTap: () {},
          onHighlightChanged: changes.add,
          child: const Text('x'),
        ),
      );

      final gesture = await tester.startGesture(
        tester.getCenter(find.text('x')),
      );
      await tester.pumpAndSettle();
      await gesture.up();
      await tester.pumpAndSettle();

      expect(changes, [true, false]);
    });
  });
}
