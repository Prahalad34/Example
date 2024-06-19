import 'package:flutter/material.dart';
class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  List<bool> _isSelected = [false, true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Woolha.com Flutter Tutorial'),
      ),
      body: Center(
        child:  ToggleButtons(
          children: <Widget>[
            Icon(Icons.bluetooth),
            Icon(Icons.wifi),
            Icon(Icons.flash_on),

          ],
          isSelected: _isSelected,
          onPressed: (int index) {
            setState(() {
              _isSelected[index] = !_isSelected[index];
            });
          },
          // region example 1
          color: Colors.grey,
          selectedColor: Colors.red,
          fillColor: Colors.lightBlueAccent,
          // endregion
          // region example 2
          // borderColor: Colors.lightBlueAccent,
          selectedBorderColor: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // endregion
        ),
      ),
    );
  }
}
