import 'package:flutter/cupertino.dart';
import 'package:valuet_space_app/database/controllers/password_db_controller.dart';
import 'package:valuet_space_app/models/passwordmodel.dart';

class PasswordsProvider extends ChangeNotifier {
  List<Passwords> passwords = <Passwords>[];

  final PasswordDBController _passwordDBController = PasswordDBController();

  Future<void> read() async {
    passwords = await _passwordDBController.read();
    notifyListeners();
  }

  Future<bool> create(Passwords password) async {
    int newRowId = await _passwordDBController.create(password);

    if (newRowId != 0) {
      password.id = newRowId;
      passwords.add(password);
      notifyListeners();
    }

    return newRowId != 0;
  }

  Future<bool> delete(int id) async {
    bool deleted = await _passwordDBController.delete(id);
    if(deleted){
    
      int index = passwords.indexWhere((element) => element.id == id);
      if(index != -1){
        passwords.removeAt(index);
        notifyListeners();
      }
    }
    return deleted;
  }

Future<bool> update(Passwords password, ) async{
    bool updated = await _passwordDBController.update(password);
    if(updated){
      
      int index = passwords.indexWhere((element) => element.id == password.id);
      if(index != -1) {
        passwords[index] = password;
        notifyListeners();
      }
    }
    return updated;
  }

}
