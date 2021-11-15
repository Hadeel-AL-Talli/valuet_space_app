import 'package:sqflite/sqflite.dart';
import 'package:valuet_space_app/database/db_controller.dart';
import 'package:valuet_space_app/database/db_operation.dart';
import 'package:valuet_space_app/models/passwordmodel.dart';

class PasswordDBController implements DbOperations<Passwords>{
  final Database _database = DbController().database;

  @override
  Future<int> create(Passwords object) async{
    // TODO: implement create
       return await  _database.insert('passwords', object.toMap());  
    
  }

  @override
  Future<bool> delete(int id)  async{
   
     //DELETE FROM passwords
    //DELETE FROM passwords WHERE id = 1;
    int numberOfDeletedRows = await _database.delete(
      'passwords',
      where: 'id = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  Future<List<Passwords>> read() async{
    // TODO: implement read
    // SELECT * FROM passwords;
    List<Map<String, dynamic>> rowsMap = await _database.query('passwords');
    return rowsMap.map((Map<String, dynamic> rowMap) => Passwords.fromMap(rowMap)).toList();
  }

  @override
  Future<Passwords?> show(int id) async {
    // TODO: implement show
     // SELECT * FROM passwords WHERE id = ?;
    List<Map<String, dynamic>> rows =
        await _database.query('passwords', where: 'id = ?', whereArgs: [id]);
    return rows.isNotEmpty ? Passwords.fromMap(rows.first) : null;
  }

  @override
  Future<bool> update(Passwords object)  async{
    
     int numberOfUpdatedRows = await _database.update(
      'passwords',
      object.toMap(),
      where: 'id = ?',
      whereArgs: [object.id],
    );
    return numberOfUpdatedRows > 0;
  }

}