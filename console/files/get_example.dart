import "dart:io";
import "dart:async";
import "dart:json" as JSON;
import "package:google_oauth2_client/google_oauth2_console.dart";
import "package:google_drive_v2_api/drive_v2_api_console.dart" as drivelib;
import "package:http/http.dart" as http;

void getFile(String fileId, drivelib.Drive drive, Function callback) {
  var request = drive.files.get(fileId).then((drivelib.File rtrvdFile) {
    Function.apply(callback,[rtrvdFile]);
    
  });
  
}

void onGetFile(drivelib.File file) {
  print(file);
}

void main() {
  String identifier = "814252216960.apps.googleusercontent.com";
  String secret = "JSzWxJYl7IGMCjrMX1UqL50b";
  List scopes = [drivelib.Drive.DRIVE_FILE_SCOPE, drivelib.Drive.DRIVE_SCOPE];
  print(scopes);
  final auth = new OAuth2Console(identifier: identifier, secret: secret, scopes: scopes);
  var drive = new drivelib.Drive(auth);
  drive.makeAuthRequests = true;
  
  getFile("1z13pdHxgJAxZfTcA3zTuegwE5SYpfH3VWaQLAOl-Rc4", drive, onGetFile);
}
