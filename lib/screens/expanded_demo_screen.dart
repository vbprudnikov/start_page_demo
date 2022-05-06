import 'package:flutter/material.dart';

class ExpandedDemoScreen extends StatelessWidget {
  const ExpandedDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Очень очень очень очень очень очень очень очень очень длинный текст',
                  style: TextStyle(fontSize: 18),),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.black,
                  ),
                ),

              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.ac_unit_rounded),
                      ),
                    )),
                Expanded(child: ElevatedButton(onPressed: () {}, child: Text('Добро пожаловать'))),
              ],
            ),
          ],
        ),
      )
    );
  }
}
