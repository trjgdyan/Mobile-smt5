import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Print',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/upload');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/print');
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'APP',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   tooltip: 'Show Snackbar',
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('Hello, I am Yani, the cutie!')),
          //     );
          //   },
          // ),
          // Image.asset('images/gambar1.png', width: 40, height: 40),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'My Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Profile'),
                      ),
                      body: const Center(
                        child: Text(
                          'My Profile',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.people),
            tooltip: 'My Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Profile'),
                      ),
                      body: const Center(
                        child: Text(
                          'My Profile',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Hello, I am Yani, the cutie!')),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            // margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Ayo Ngoding!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Image.asset(
                                      'images/gambar1.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "${DateTime.now().hour}:${DateTime.now().minute}",
                                    style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${DateFormat('EEEE').format(DateTime.now())}, ${DateTime.now().day} ${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}",
                                    style: const TextStyle(
                                        fontSize: 20, fontFamily: 'popins'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "All Category",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Python"))),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("PHP"))),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Flutter"))),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Java"))),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("CSS"))),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("MySQL"))),
                          ),
                        ],
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Most Popoular",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              // fontFamily:
                            ),
                          )),
                      // Container(
                      //   child: Image.asset(
                      //     'images/gambar1.png',
                      //     width: 300,
                      //     height: 300,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.pink[100],
                                margin: const EdgeInsets.all(10),
                                child: Image.asset(
                                  'images/gambar1.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                color: Colors.pink[100],
                                child: Image.asset(
                                  'images/gambar1.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.pink[100],
                                margin: const EdgeInsets.all(10),
                                child: Image.asset(
                                  'images/gambar1.png',
                                  width: 105,
                                  height: 105,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(
      String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
