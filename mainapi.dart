import 'dart:convert';

import 'package:http/http.dart' as http;

class mainapi {
  Future<List> Getusers() async {
    var res = await http
        .get(Uri.parse('https://65730444192318b7db416921.mockapi.io/employee'));
    return jsonDecode(res.body);
  }

  Future<void> Deleteusers(id) async {
    var res = await http.delete(Uri.parse(
        'https://65730444192318b7db416921.mockapi.io/employee/' + id));
  }


  Future<void> insertUsers(Map<String, dynamic> user) async {
    var res = await http.post(
        Uri.parse('https://65730444192318b7db416921.mockapi.io/employee'),
        body: user);
  }

  Future<void> updateUsers(Map<String, dynamic> user,String id) async {
    var res = await http.put(
        Uri.parse('https://65730444192318b7db416921.mockapi.io/employee/'+id),
        body: user);
  }


}
