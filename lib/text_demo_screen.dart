import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDemoScreen extends StatelessWidget {
  const TextDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(

            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                width: 200,
                height: 200,
                decoration: BoxDecoration (
                    color: Colors.green,
                    border: Border.all(color: Colors.blue,
                        width: 5)),
                child: Text('Простой длинный текст',
                style: TextStyle(fontSize: 16),
                softWrap: true,
                overflow: TextOverflow.visible),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                width: 200,
                height: 200,
                decoration: BoxDecoration (
                    color: Colors.green,
                    border: Border.all(color: Colors.blue,
                        width: 5)),
                child: Text.rich(
                  TextSpan(text: 'Самый первый фрагмент',
                  style: TextStyle(color: Colors.white),
                  children: <TextSpan> [
                    TextSpan(text: ', второй фрагмент',
                        style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ', третий и заключительный фрагмент длинного текста',
                      style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    )
                  ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
