import 'package:flutter_test/flutter_test.dart';
import 'package:ecowalk/main.dart';

void main() {
  testWidgets('EcoWalk app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const EcoWalkApp());

    expect(find.text('ECOWA'), findsOneWidget);
    expect(find.text('K'), findsOneWidget);
  });
}