import 'package:flutter/material.dart';

void main() {
  // I am Poor and Rich Apps
  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.blueGrey,
  //       appBar: AppBar(
  //         title: const Text('I Am Rich'),
  //         backgroundColor: Colors.blueGrey[900],
  //       ),
  //       body: const Center(
  //         child: Image(
  //           image: AssetImage('image/baymax.png'),
  //         ),
  //       ),
  //     ),
  //   ),
  // );

  runApp(MyApp());
}

// ========= Exercise 1: Learn Row and Column ===============
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.orange,
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            //verticalDirection: VerticalDirection.up,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 100.0,
                height: 100.0,
                //margin: const EdgeInsets.symmetric(vertical:50.0,horizontal:20.0), // fromLTRB() | only() | all()
                color: Colors.yellow,
                child: const Text('Hello World'),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: const Text('Hello World 2'),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.teal,
                child: const Text('Hello World 3'),
              ),
              Container(
                width: double.infinity,
              )
            ],
          ))),
    );
  }
}

// ========= Exercise 2: Create Profile =====================
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           backgroundColor: Colors.orange,
//           body: SafeArea(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: double.infinity,
//               ),
//               const CircleAvatar(
//                 radius: 55.0,
//                 backgroundImage: AssetImage('images/Me.jpg'),
//               ),
//               const Text(
//                 'Albert Chuah',
//                 style: TextStyle(
//                     fontFamily: 'Pacifico',
//                     fontSize: 35.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               Text(
//                 'Flutter Developer',
//                 style: TextStyle(
//                     fontFamily: 'Source San',
//                     color: Colors.teal.shade900,
//                     fontSize: 20.0,
//                     letterSpacing: 2.5,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20.0,
//                 width: 150.0,
//                 child: Divider(
//                   color: Colors.teal.shade100
//                 ),
//               ),
//               Card(
//                 color: Colors.white,
//                 margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                 //   child: Row(
//                 //   children: <Widget>[
//                 //     const Icon(
//                 //       color: Colors.teal,
//                 //       Icons.phone,
//                 //     ),
//                 //     const SizedBox(
//                 //       width: 10.0,
//                 //     ),
//                 //     Text(
//                 //       '+60197968130',
//                 //       style: TextStyle(
//                 //         fontSize: 20.0,
//                 //         color: Colors.teal.shade900,
//                 //       ),
//                 //     )
//                 //   ],
//                 // ),
//                   child: ListTile(
//                     leading: const Icon(
//                       color: Colors.teal,
//                       Icons.phone,
//                     ),
//                     title: Text(
//                       '+60197968130',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.teal.shade900,
//                       ),
//                     )
//                   ),
//                 )
//               ),
//               Card(
//                 color: Colors.white,
//                 margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: ListTile(
//                     leading: const Icon(
//                       color: Colors.teal,
//                       Icons.email,
//                     ),
//                     title: Text(
//                       '+60197968130',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.teal.shade900,
//                       ),
//                     )
//                   ),
//                 )
//               )
//             ],
            
//           ))),
//     );
//   }
// }
