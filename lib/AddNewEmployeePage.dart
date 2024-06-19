// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'ProductCard.dart';
// import 'api.dart';
// class add extends StatefulWidget {
//   const add({Key? key}) : super(key: key);
//
//   @override
//   State<add> createState() => _addState();
// }
//
// class _addState extends State<add> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter REST API'),
//       ),
//       body: FutureBuilder(
//         future: ApiService.getEmployees(),
//         builder: (context, snapshot) {
//           final employees = snapshot.data;
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView.separated(
//               separatorBuilder: (context, index) {
//                 return Divider(
//                   height: 2,
//                   color: Colors.black,
//                 );
//               },
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(employees[index]['employee_name']),
//                   subtitle: Text('Age: ${employees[index]['employee_age']}'),
//                 );
//               },
//               itemCount: employees?.length,
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddNewEmployeePage(key: null,),
//             ),
//           );
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class AddNewEmployeePage extends StatefulWidget {
//   AddNewEmployeePage({required Key key}) : super(key: key);
//
//   _AddNewEmployeePageState createState() => _AddNewEmployeePageState();
// }
//
// class _AddNewEmployeePageState extends State<AddNewEmployeePage> {
//   final _employeeNameController = TextEditingController();
//   final _employeeAge = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Employee'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: _employeeNameController,
//                 decoration: InputDecoration(hintText: 'Employee Name'),
//               ),
//               TextField(
//                 controller: _employeeAge,
//                 decoration: InputDecoration(hintText: 'Employee Age'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextButton(
//                 child: Text(
//                   'SAVE',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               //  child:  Colors.purple,
//                 onPressed: () {
//                   final body = {
//                     "name": _employeeNameController.text,
//                     "age": _employeeAge.text,
//                   };
//                   ApiService.addEmployee(body).then((success) {
//                     if (success) {
//                       showDialog(
//                         builder: (context) => AlertDialog(
//                           title: Text('Employee has been added!!!'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 _employeeNameController.text = '';
//                                 _employeeAge.text = '';
//                               },
//                               child: Text('OK'),
//                             )
//                           ],
//                         ),
//                         context: context,
//                       );
//                       return;
//                     }else{
//                       showDialog(
//                         builder: (context) => AlertDialog(
//                           title: Text('Error Adding Employee!!!'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Text('OK'),
//                             )
//                           ],
//                         ),
//                         context: context,
//                       );
//                       return;
//                     }
//                   });
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }