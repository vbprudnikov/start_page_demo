import 'package:flutter/material.dart';
import 'package:start_page_demo/utils/global.dart';

import '../utils/strings.dart';

class ThemesDemoApp extends StatelessWidget {
  const ThemesDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: global_theme(),
      home: ThemesDemoScreen()

    );
  }
}

class ThemesDemoScreen extends StatefulWidget {
  const ThemesDemoScreen({Key? key}) : super(key: key);

  @override
  State<ThemesDemoScreen> createState() => _ThemesDemoScreenState();
}

class _ThemesDemoScreenState extends State<ThemesDemoScreen> {
  double _currentSliderValue = 20;
  bool _isDark = false;

  Widget _navigationDraw() => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Image.network('http://ruscultcenter.org.eg/wp-content/uploads/2021/02/logobsu22.jpg'),
                ),
                const Text('БашГУ'),

              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.calculate_outlined),
          title: const Text('Калькулятор'),
          onTap: () {

          },
        ),
        ListTile(
          leading: const Icon(Icons.app_registration),
          title: const Text('Авторизация'),
          onTap: () {

          },
        ),
        ListTile(
          leading: const Icon(Icons.arrow_back_rounded),
          title: const Text('Назад'),
          onTap: () {

          },
        ),
      ],
    ),
  );

  PreferredSizeWidget _appBar() =>AppBar(
    title: Text('Демо AppBar'),
    actions: <Widget>[
      IconButton(
          tooltip: 'Часы',
          onPressed: () {},
          icon: const Icon(Icons.access_time_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),

    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _navigationDraw(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Заголовок', style: Theme.of(context).textTheme.headline6),
              Container(
                height: 100,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Row(
                children: const [
                  Text('Логин: '),
                  Expanded(child: TextField()),

                ],
              ),
              Row(
                children: const [
                  Text('Пароль: '),
                  Expanded(child: TextField()),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text('Войти')),
              Text(Strings.longBodyText),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              SwitchListTile(
                  title: Text('Тёмная тема'),
                  value: _isDark,
                  onChanged: (val) {
                    setState(() {
                      _isDark = !_isDark;
                      if (_isDark) {

                      }
                    });
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Профиль'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Баланс'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Настройки'),
        ],
      ),
    );
  }
}
