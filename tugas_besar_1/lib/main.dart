import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget{
  const Mainscreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver{
  bool _isPermissionGranted = false;

  late final Future<void> _future;
  CameraController? _cameraController;

  final textRecognizer = TextRecognizer();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _future = _requestCameraPermission();

  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    _stopCamera();
    textRecognizer.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if(_cameraController == null || !_cameraController!.value.isInitialized){
      return;
    }

    if(state == AppLifecycleState.inactive){
      _stopCamera();
    }else if(state == AppLifecycleState.resumed &&
        _cameraController != null &&){
      _startCamera();
    }
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: _future,
      builder: (context, napshot){
        return Stack(
          children:[
            if (_isPermissionGranted)
            FutureBuilder(
            future: availableCameras(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                _initCameraController(snapshot.data!);
                return Center(child: CameraPreview(_cameraController!));
              }else{
                return const LinearProgressIndicator();
              }
            },
            ),
            Scaffold(
              appBar: AppBar(
                title: const Text('Scan Text Tugas Besar Yani'),
              ),

              backgroundColor: _isPermissionGranted ? Colors.transparent: null,
              body: _isPermissionGranted
              ? Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: _scanImage,
                        child: const Text('Scan Text'),
                      ),
                      
                      )
                    )
                  )
                ],
              )
              : Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 34.0, right: 34.0),
                  child: const Text(
                    'Camera permission denied',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    
  }
}

