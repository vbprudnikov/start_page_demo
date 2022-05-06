import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class NavigationDemo2Screen extends StatefulWidget {
  const NavigationDemo2Screen({Key? key}) : super(key: key);

  @override
  State<NavigationDemo2Screen> createState() => _NavigationDemo2ScreenState();
}

class _NavigationDemo2ScreenState extends State<NavigationDemo2Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const AuthScreen(),
        '/calc': (context) => const CalcScreen(),
      },
    );
  }
}

Widget navDrawer(context) => Drawer(
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
          Navigator.pushNamed(context, '/calc');
        },
      ),
      ListTile(
        leading: const Icon(Icons.app_registration),
        title: const Text('Авторизация'),
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      ListTile(
        leading: const Icon(Icons.arrow_back_rounded),
        title: const Text('Назад'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ],
  ),
);


class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
          color: const Color (0xFF000000),
          width: 4
          ,
        )
    );

    const linkStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF007900),
    );

    return MaterialApp(

      home: Scaffold(
          appBar: AppBar(
              title: const Text('Авторизация')),
          drawer: navDrawer(context),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage('assets/bg.jpg'),
                  fit: BoxFit.none,
                )
            ),
            width: double.infinity ,
            child: Column(children:  [
              SizedBox(height: 10,),
              SizedBox(width: 97, height: 98, child: Image(image: AssetImage('assets/sber.png')),),
              SizedBox(height: 10,),
              Text('Введите логин (10 цифр номера)',
                style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0.5), ),
              ),
              SizedBox(height: 15,),
              const SizedBox(width: 244,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFC4C4C4),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Телефон'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              const SizedBox(width: 240,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFC4C4C4),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'Пароль'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(width: 154, height: 32,
                  child: ElevatedButton(onPressed: () {},
                      child: Text('Войти'),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF007900),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          )
                      )
                  )),
              SizedBox(height: 10,),
              InkWell(child: const Text('Регистрация',
                style: linkStyle,
              ), onTap: () {}),
              SizedBox(height: 10,),
              InkWell(child: const Text('Забыли пароль',
                style: linkStyle,
              ), onTap: () {}),
            ],),
          )

      ),
    );
  }
}




class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

enum Discount { ten, twenty, thirty }

class _CalcScreenState extends State<CalcScreen> {

  bool _isMegapolis = true;// в Мегаполисах цена автомобилей на 100 тыс. руб. больше
  double _engineVolume = 1.6; // Объем двигателя
  double _price = 1000000; // Базовая стоимость автомобиля
  Discount? _discount = Discount.ten; // Значение скидки по умолчанию
  bool _pensDiscount = false; // Признак того, что покупатель является пенсионером
// Пенсионерам предоставляется скидка 5% от итоговой стоимости



  double _calcPrice() {

    // надбавки за объем двигателя
    // если объем двигателя 1.8, то цена увеличивается на 200 т.р., а если 2 литра, то на 300
    _price = 1000000;

    if (_engineVolume == 1.8) {
      _price += 200000;

    } else if (_engineVolume == 2.0) {
      _price += 300000;
    }

    // надбавка за то, что магазин находится в мегаполисе
    if (_isMegapolis == true) _price += 100000;

    // скидка в зависимости от вида карты лояльности клиента
    switch (_discount) {
      case Discount.ten:
        _price = _price*(1-0.1);
        break;
      case Discount.twenty:
        _price = _price*(1-0.2);
        break;
      case Discount.thirty:
        _price = _price*(1-0.3);
        break;
      case null: // если не задана, то скидка 10%
        _price = _price*(1-0.1);
        break;

    }

    // дополнительная скидка 5% пенсионерам
    if (_pensDiscount == true) _price = _price*(1-0.05);

    return _price;

  }

  void _onDiscountChange(Discount? value) {
    setState(() {
      _discount = value;
      _calcPrice();
    });
  }

  void _onPensChange(bool value) {
    setState(() {
      _pensDiscount = value;
      _calcPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Калькулятор')),
        drawer: navDrawer(context),
        body: Container(
          width: double.infinity,
          child: Center(
            child: Column(

              children: [
                SizedBox(height: 20),
                SizedBox(width: 80, height: 80, child: Image(image: AssetImage('assets/img.png')),),
                //SizedBox(width: 225, height: 225, child: Image.asset('assets/img.png'),),
                SizedBox(height: 10),
                const Text('Калькулятор стоимости авто',
                    style: TextStyle(fontSize: 25, color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                const Text('Условия приобретения:',
                    style: TextStyle(fontSize: 18, color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child:
                  SlidingSwitch(
                    value: false,
                    width: 250,
                    onChanged: (bool value) {
                      _isMegapolis = value;
                      setState(() {
                        _calcPrice();
                      });
                    },
                    height : 30,
                    animationDuration : const Duration(milliseconds: 150),
                    onTap:(){},
                    onDoubleTap:(){},
                    onSwipe:(){},
                    textOff : "Город",
                    textOn : "Mегаполис",
                    // colorOn : const Color(0xffdc6c73),
                    // colorOff : const Color(0xffdc6c73),
                    colorOn : Colors.white,
                    colorOff : Colors.white,
                    background : const Color(0xffe4e5eb),
                    buttonColor : Colors.blue,
                    inactiveColor : const Color(0xff636f7b),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Объем двигателя',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ),
                SizedBox(
                  width: 300,
                  child: SfSlider(
                    min: 1.6,
                    max: 2.0001,
                    value: _engineVolume,
                    interval: 0.2,
                    showTicks: true,
                    showLabels: true,
                    showDividers: true,
                    numberFormat: NumberFormat("#.# л"),
                    enableTooltip: true,
                    minorTicksPerInterval: 0,
                    stepSize: 0.2,
                    onChanged: (value) {
                      setState(() {
                        _engineVolume = value;
                        _calcPrice();
                      });
                    },



                  ),
                ),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Размер скидки по карте',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ),
                RadioListTile<Discount>(
                  title: const Text('Стандартная карта (10%)'),
                  value: Discount.ten,
                  groupValue: _discount,
                  onChanged: _onDiscountChange,
                  // visualDensity: VisualDensity(horizontal: 0, vertical: -5.0),
                ),
                RadioListTile<Discount>(
                  title: const Text('Серебрянная карта (20%)'),
                  value: Discount.twenty,
                  groupValue: _discount,
                  onChanged: _onDiscountChange,
                  // visualDensity: VisualDensity(horizontal: 0, vertical: -5.0),
                ),
                RadioListTile<Discount>(
                  title: const Text('Золотая карта (30%)'),
                  value: Discount.thirty,
                  groupValue: _discount,
                  onChanged: _onDiscountChange,
                  // visualDensity: VisualDensity(horizontal: 0, vertical: -5.0),
                ),

                // скидка пенсионерам
                SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 20,
                            height: 20,
                            child: Image(image: AssetImage('assets/img_1.png'))
                        ),
                        Text('Пенсионная скидка',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Switch(value: _pensDiscount,
                            onChanged: _onPensChange),
                      ],
                    ),
                  ),
                  /*child: Row(
                    children: [
                      Switch(value: _pensDiscount,
                          onChanged: (bool value) {
                            setState(() {
                              _pensDiscount = value;
                              _calcPrice();
                            });

                          }),
                      Text('Пенсионная скидка'),
                    ],
                  ),*/
                ),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Итоговая стоимость авто',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${_price.round()} руб. ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,

                      ),
                      textAlign: TextAlign.center,

                    ),
                  ),
                ),
                //SizedBox(height: 20),
                /*SizedBox(width: 154, height: 42,
                    child: ElevatedButton(onPressed: () {},
                        child: Text('Забронировать'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            )
                        )
                    )),*/

              ],
            ),
          ),
        ),
      ),
    );
  }
}