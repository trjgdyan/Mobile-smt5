import 'package:rest_api2/model/mahasiswa.dart';
import 'package:http/http.dart' as http;

class MahasiswaService {
  static final String _baseUrl = "https://regres.in/api/unknown/2";

  var http;

  Future getMahasiswa() async{
    Uri urlApi =Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200){
      return mahsiswaFromJson(response.body.toString());
    }else{
      throw Exception('Failed to load data mahasiswa');
    }
  }
}
