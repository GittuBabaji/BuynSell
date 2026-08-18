import 'dart:convert';
import 'package:http/http.dart' as http;
class THttpClient{
  THttpClient._();
  static const String _baseurl="---";
  static Future<Map<String,dynamic>> get(String endpoint) async{
    final response=await http.get(Uri.parse("$_baseurl$endpoint"));
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to load data");
    }
  }
  static Future<Map<String,dynamic>> post(String endpoint,Map<String,dynamic> body) async{
    final response=await http.post(Uri.parse("$_baseurl$endpoint"),body: jsonEncode(body),headers: {"Content-Type":"application/json"});
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to load data");
    }
  }
  static Future<Map<String,dynamic>> put(String endpoint,Map<String,dynamic> body) async{
    final response=await http.put(Uri.parse("$_baseurl$endpoint"),body: jsonEncode(body),headers: {"Content-Type":"application/json"});
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to load data");
    }
  }
  static Future<Map<String,dynamic>> delete(String endpoint) async{
    final response=await http.delete(Uri.parse("$_baseurl$endpoint"));
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to load data");
    }
  }
  static Future<Map<String,dynamic>> patch(String endpoint,Map<String,dynamic> body) async{
    final response=await http.patch(Uri.parse("$_baseurl$endpoint"),body: jsonEncode(body),headers: {"Content-Type":"application/json"});
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to load data");
    }
  }

}
