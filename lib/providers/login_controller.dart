import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_chat/models/user_model.dart';

final loginController = Provider<LoginController>((ref) {
  return LoginController();
});

class LoginController {

  
 
  List <UserModel> users = [
    UserModel(name: "ATS527",id: 1),
    UserModel(name: "MJK618",id: 2),
    UserModel(name: "Juxtn",id: 3),
    // UserModel(name: "Ali",id: 4),
    // UserModel(name: "Stephan",id: 5),
  ];
}
