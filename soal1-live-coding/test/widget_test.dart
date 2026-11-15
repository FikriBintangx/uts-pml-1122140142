
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

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('Terima kasih telah melihat profil saya'), findsOneWidget);
  });
}

