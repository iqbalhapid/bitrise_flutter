// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:shopjoy/app.dart';

void main(){
  final myPadding = Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset(
                    'lib/assets/img/logo_joycash.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  )); 
  testWidgets('finds a Text widget', (WidgetTester tester) async {
    
    await tester.pumpWidget(Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              myPadding
            ],));
  

    expect(find.byWidget(myPadding), findsOneWidget);
  });
}
