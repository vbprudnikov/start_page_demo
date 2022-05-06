import 'package:flutter/material.dart';

// дополнительно
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}


enum Discount { ten, twenty, thirty }

class _CalculatorScreenState extends State<CalculatorScreen> {

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
        body: Container(
          width: double.infinity,
          child: Center(
            child: Column(

              children: [
                SizedBox(height: 40),
                SizedBox(width: 100, height: 100, child: Image(image: AssetImage('assets/img.png')),),
                //SizedBox(width: 225, height: 225, child: Image.asset('assets/img.png'),),
                SizedBox(height: 10),
                const Text('Калькулятор стоимости авто',
                    style: TextStyle(fontSize: 25, color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                const Text('Условия приобретения:',
                    style: TextStyle(fontSize: 18, color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
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
                SizedBox(height: 15),
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
                SizedBox(height: 15),
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
                            width: 40,
                            height: 40,
                            child: Image(image: AssetImage('assets/img_1.png'))
                        ),
                        Text('Пенсионная скидка',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                SizedBox(height: 15),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Итоговая стоимость авто',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${_price.round()} руб. ',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,

                      ),
                      textAlign: TextAlign.center,

                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(width: 154, height: 42,
                    child: ElevatedButton(onPressed: () {},
                        child: Text('Забронировать'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            )
                        )
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
