import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// membuat progam konversi suhu
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyConverter(),
    );
  }
}

class MyConverter extends StatefulWidget {
  const MyConverter({Key? key}) : super(key: key);

  @override
  _MyConverterState createState() => _MyConverterState();
}

class _MyConverterState extends State<MyConverter> {
  String selectedValue = 'Reamur';
  double inputValue = 0.0;
  String result = '';

  void convertTemperature() {
    double convertedValue = 0.0;

    if (selectedValue == 'Reamur') {
      convertedValue = (inputValue * 4) / 5;
    } else if (selectedValue == 'Fahrenheit') {
      convertedValue = (inputValue * 9 / 5) + 32;
    } else if (selectedValue == 'Kelvin') {
      convertedValue = inputValue + 273.15;
    }

    setState(() {
      result = convertedValue.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konverter Suhu"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Celcius',
                hintText: 'Masukkan Angka Temperatur dalam Celcius',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedValue,
              items: const [
                DropdownMenuItem(
                  value: 'Reamur',
                  child: Text('Reamur'),
                ),
                DropdownMenuItem(
                  value: 'Fahrenheit',
                  child: Text('Fahrenheit'),
                ),
                DropdownMenuItem(
                  value: 'Kelvin',
                  child: Text('Kelvin'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            const Text('Hasil'),
            Text(result),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: convertTemperature,
                    child: const Text('Konversi Suhu'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//TUGAS 2
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const MyConverter(),
//     );
//   }
// }

// class MyConverter extends StatefulWidget {
//   const MyConverter({Key? key}) : super(key: key);

//   @override
//   _MyConverterState createState() => _MyConverterState();
// }

// class _MyConverterState extends State<MyConverter> {
//   String selectedValue = 'Reamur'; // Nilai awal dropdown

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Konverter Suhu"),
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'Celcius',
//                 hintText: 'Masukkan Angka Temperatur dalam Celcius',
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             DropdownButton<String>(
//               isExpanded: true,
//               value: selectedValue,
//               items: const [
//                 DropdownMenuItem(
//                   child: Text('Reamur'),
//                   value: 'Reamur',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Fahrenheit'),
//                   value: 'Fahrenheit',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Kelvin'),
//                   value: 'Kelvin',
//                 ),
//               ],
//               onChanged: (value) {
//                 setState(() {
//                   selectedValue = value!;
//                 });
//               },
//             ),
//             const Text('Hasil'),
//             const Text('365'),
//             Row(
//               children: [
//                 Expanded(
//                     child: ElevatedButton(
//                         onPressed: () {}, child: const Text('Konversi Suhu'))),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// TUGAS 1
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   final List<String> data = [
//     "Tri",
//     "Jagad",
//     "Ariyani",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Tri Jagad Ariyani - 2141720049"),
//       ),
//       body: Center(
//         child: DropdownButton(
//           hint: const Text("Pilih Nama"),
//           onChanged: (value) {
//             // ignore: avoid_print
//             print(value);
//           },
//           items: data.map((e) {
//             return DropdownMenuItem(
//               value: e,
//               child: Text(e),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }