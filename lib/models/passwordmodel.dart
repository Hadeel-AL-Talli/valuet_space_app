class Passwords {
  late int id;
  late String title;
  late String loginAccount;
  late String password;
  late String website;
  Passwords();

  // read table row
  Passwords.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    title = rowMap['title'];
    loginAccount = rowMap['loginAccount'];
    password = rowMap['password'];
    website = rowMap['website'];
  }

  // save data in database

  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['title'] = title;
    rowMap['loginAccount'] = loginAccount;
    rowMap['password'] = password;
    rowMap['website'] = website;
    return rowMap;
  }
}
