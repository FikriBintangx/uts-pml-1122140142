import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal2_profil_app/main.dart';

void main() {
  testWidgets('Soal 2 app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Login Mahasiswa'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
  });
}
