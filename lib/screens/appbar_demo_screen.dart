import 'package:flutter/material.dart';

class AppbarDemoScreen extends StatefulWidget {
  const AppbarDemoScreen({Key? key}) : super(key: key);

  @override
  State<AppbarDemoScreen> createState() => _AppbarDemoScreenState();
}

class _AppbarDemoScreenState extends State<AppbarDemoScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Appbar Demo'),
            actions: [
              IconButton(
                  tooltip: 'Калькулятор',
                  onPressed: () {},
                  icon: Icon(Icons.calculate)),
              IconButton(
                  tooltip: 'Настройки',
                  onPressed: () {},
                  icon: Icon(Icons.settings)),
              TextButton(
                  onPressed: () {},
                  child: Text('Профиль'),
                  style: buttonStyle),
            ],
          ),
          body: Center(child: Text('Содержимое экрана'))),
    );
  }
}
