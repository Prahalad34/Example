import 'package:flutter/material.dart';
class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {

  String _selectedHeight = "4 ft";
  List<String> height = ["4 ft", "5 ft", "6 ft", "7 ft"];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(height: 100,),
              DropdownButton<String>(
                value:_selectedHeight,
                underline:Container(
                  // height: 50,
                  // width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.yellow,
                    border: Border.all(color: Colors.black)
                  ),
                ),
                icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                iconSize: 24,
                isExpanded:true,
                items: height.map(( String height) =>DropdownMenuItem<String>(
                  child:Text(height),
                  value:height,
                )).toList(),
                onChanged:(val) {
                  setState(() {
                    _selectedHeight = val!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
