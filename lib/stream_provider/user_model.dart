class UserModel{
  String? name;
  UserModel(this.name);


  Stream<UserModel> changeName(String newName) {
    name = newName;
    return Stream<UserModel>.value(this);
  }
}