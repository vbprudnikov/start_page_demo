import 'package:flutter/material.dart';

class SwitchDemoScreen extends StatefulWidget {
  const SwitchDemoScreen({Key? key}) : super(key: key);

  @override
  State<SwitchDemoScreen> createState() => _SwitchDemoScreenState();
}

enum Skilllevel {Junior, Middle, Senior}

class _SwitchDemoScreenState extends State<SwitchDemoScreen> {

  bool _checked = true;
  bool _checked2 = false;
  Skilllevel? _skilllevel = Skilllevel.Senior;

  void _onCheckboxChange(bool? val) {
    setState(() {
      _checked = !_checked;
    });
  }

  void _onCheckboxChange2(bool? val) {
    setState(() {
      _checked2 = !_checked2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value: _checked, onChanged: _onCheckboxChange),
                Text('Элемент выбран'),
              ],
            ),
            CheckboxListTile(
                title: Text('Выберите элемент'),
                value: _checked2,
                onChanged: _onCheckboxChange2),
            Row(
              children: [
                Switch(value: _checked, onChanged: _onCheckboxChange),
                Text('Включить/выключить переключатель')
              ],
            ),
            SwitchListTile(
              title: Text('Выключить/включить'),
                value: _checked,
                onChanged: _onCheckboxChange),
            RadioListTile<Skilllevel>(
              title: const Text('Junior'),
              value: Skilllevel.Junior,
              groupValue: _skilllevel,
              onChanged: (Skilllevel? value) {
                setState(() {
                  _skilllevel = value;
                });
              },
            ),
            RadioListTile<Skilllevel>(
              title: const Text('Middle'),
              value: Skilllevel.Middle,
              groupValue: _skilllevel,
              onChanged: (Skilllevel? value) {
                setState(() {
                  _skilllevel = value;
                });
              },
            ),
            RadioListTile<Skilllevel>(
              title: const Text('Senior'),
              value: Skilllevel.Senior,
              groupValue: _skilllevel,
              onChanged: (Skilllevel? value) {
                setState(() {
                  _skilllevel = value;
                });
              },
            )
          ],
        ),
      ),
    ));
  }
}
