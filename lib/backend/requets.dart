import 'dart:convert';
import 'dart:io';
import 'package:cc_bogota/models/school_request.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'ccbapp-api.herokuapp.com';

// Get user clearance level
Future<String> getClearance(String uid, String token) async {
  var uri = Uri.https(baseUrl, '/users/$uid');
  final response = await http.get(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    },
  );
  if (response.statusCode == 200) {
    return json.decode(response.body)['role'];
  }
  return null;
}

// Add user to the specified clearance collection
Future<bool> addStaff(String email, String role, String token) async {
  var uri = Uri.https(baseUrl, 'roles');
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    },
    body: json.encode({'email': email, 'role': role}),
  );
  if (response.statusCode == 200) {
    return json.decode(response.body)['result'];
  } else {
    return false;
  }
}

Future<bool> removeCredentials(String email, String role, String token) async {
  var uri = Uri.https(baseUrl, 'roles');
  final request = http.Request("DELETE", uri);
  request.headers.addAll(
    <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    },
  );
  request.body = json.encode({'email': email, 'role': role});
  final response = await request.send();
  if (response.statusCode == 200) {
    return json.decode(await response.stream.bytesToString())['result'];
  } else {
    return false;
  }
}

// Sent school request to DB
Future<bool> sentReport(Map report, String token) async {
  var now = DateTime.now();
  String id =
      '${report['codigo']}-${now.day.toString().padLeft(2, '0')}${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';
  var uri = Uri.https(baseUrl, '/documents/pfi/$id');
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    },
    body: json.encode(report),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> sentSchoolRequest(SchoolRequest request, String token) async {
  var uri = Uri.https(baseUrl, '/documents/escuela');
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    },
    body: json.encode(request.toJson()),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
