import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: const Color (0xFF000000),
          width: 2,
        )

    );

    const linkStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A4F2F),
    );

    return MaterialApp(

      home: Scaffold(

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 70),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image:  AssetImage('assets/bg2.jpg'),
                fit: BoxFit.fill,
              )
          ),

          child: SingleChildScrollView(
            child: Column(
              children:  [
                SizedBox(height: 45),

                SizedBox(
                    width: 97,
                    height: 98,
                    child: Image(image: AssetImage('assets/sber.png'))),
                SizedBox(height: 20),
                Text('Введите логин (10 цифр)'),
                SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFC4C4C4),
                    labelText: 'Телефон',
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,

                  ),
                ),
                SizedBox(height: 30),
                TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFC4C4C4),
                      labelText: 'Пароль',
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                    ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 175,
                  height: 45,
                  child: ElevatedButton(onPressed: () {},
                    child: Text('Войти'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF1A4F2F),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                    child: Text('Зарегистрироваться',
                        style: linkStyle),
                    onTap: () {}),
                InkWell(
                    child: Text('Забыли пароль',
                        style: linkStyle),
                    onTap: () {}),


              ],
            ),
          ),
        ),
      ),
    );
  }
}