// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/features/todo/presentation/pages/todos_home.dart';

void main() {

  testWidgets("add a todo", (WidgetTester tester) async {
    //find all widgets needed
    final addField = find.byKey(const ValueKey("addField"));
    final addButton = find.byKey(const ValueKey("addButton"));

    //execute the actual test
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: TodosHome())));
    await tester.enterText(addField, "Test entering");
    await tester.tap(addButton);
    await tester.pump(); //rebuilds your widget

    //check outputs
    expect(find.text("Test entering"), findsOneWidget);
  });

  testWidgets("delete a todo", (WidgetTester tester) async {
    //find all widgets needed
    final addField = find.byKey(const ValueKey("addField"));
    final addButton = find.byKey(const ValueKey("addButton"));
    final deleteButton = find.byKey(const ValueKey("deleteButton"));

    //execute the actual test
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: TodosHome())));
    await tester.enterText(addField, "Test entering");
    await tester.tap(addButton);
    await tester.pump(); //rebuilds your widget

    //check outputs
    expect(find.text("Test entering"), findsOneWidget);

    await tester.tap(deleteButton);
    await tester.pump(); //rebuilds your widget
    expect(find.text("Test entering"), findsNothing);
  });
}
