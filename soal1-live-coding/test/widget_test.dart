// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uts_1122140142/main.dart';

void main() {
  testWidgets('MyApp smoke and profile page test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text('Fikri Bintang Purnomo'), findsOneWidget);
    expect(find.text('NIM: 1122140142'), findsOneWidget);
    expect(find.text('fikrbintang01@gmail.com'), findsOneWidget);

    // Tap FAB and test SnackBar
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('Terima kasih telah melihat profil saya'), findsOneWidget);
  });
}

