import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerScreen> createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
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
                  )
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Телефонная книга'),
                onTap: () {

                },
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Адресная книга'),
                onTap: () {

                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Сервис'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Настройки абонента'),
                onTap: () {

                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.accessibility),
                title: const Text('Заказы'),
                onTap: () {

                  _messengerKey.currentState!.showSnackBar(
                    const SnackBar(
                      content: Text('Создание нового заказа'),
                      duration: Duration(seconds: 5),
                    ),

                  );

                },
              ),




            ],

          ),
        ),
        body: Center(child: Text('Информации о приложении'))
      ),
    );
  }
}
