import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Print extends StatefulWidget {
  const Print({Key? key}) : super(key: key);

  @override
  // _PrintState createState() => _PrintState();
  State<Print> createState() => _PrintState();
}

class _PrintState extends State<Print> {
  //membuat array list dengan nama data
  late List<Map<String, dynamic>> data;

  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController ttlController = TextEditingController();
  TextEditingController jkController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController agamaController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController pekerjaanController = TextEditingController();
  TextEditingController kewarganegaraanController = TextEditingController();
  TextEditingController berlakuController = TextEditingController();

  // get http => null;

  @override
  void initState() {
    super.initState();
    data = <Map<String, dynamic>>[];
    _print();
  }

  Future<void> _print() async {
    final response = await http
        .get(Uri.parse('https://8853-114-6-31-174.ngrok-free.app/get_data'));

    if (response.statusCode == 200) {
      // Jika request sukses, parse JSON
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        data = List<Map<String, dynamic>>.from(jsonData);
      });
      uploadController();
    } else {
      // Jika request gagal, tampilkan pesan kesalahan
      print('Failed to load data');
    }
  }

  void uploadController() {
    nikController = TextEditingController(text: "${data.last['nik']}");
    namaController = TextEditingController(text: "${data.last['nama']}");
    ttlController = TextEditingController(text: "${data.last['ttl']}");
    jkController = TextEditingController(text: "${data.last['jenis_kelamin']}");
    alamatController = TextEditingController(text: "${data.last['alamat']}");
    agamaController = TextEditingController(text: "${data.last['agama']}");
    statusController =
        TextEditingController(text: "${data.last['status_perkawinan']}");
    pekerjaanController =
        TextEditingController(text: "${data.last['pekerjaan']}");
    kewarganegaraanController =
        TextEditingController(text: "${data.last['kewarganegaraan']}");
    berlakuController =
        TextEditingController(text: "${data.last['berlaku_hingga']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Print"),
      ),
      body: SingleChildScrollView(
        child: data == null
            ? const CircularProgressIndicator()
            : data.isEmpty
                ? const Text('No data available')
                : Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: nikController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'NIK',
                              // helperText: 'Masukkan NIK Anda'
                              hintText: 'Masukkan NIK Anda'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: namaController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: ttlController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'TTL',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: jkController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Jenis Kelamin',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: alamatController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Alamat',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: agamaController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Agama',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: statusController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Status Perkawinan',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: pekerjaanController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pekerjaan',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: kewarganegaraanController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Kewarganegaraan',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: TextField(
                          controller: berlakuController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Berlaku Hingga',
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
