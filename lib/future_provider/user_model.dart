class UserModel{
  String? name;
  UserModel(this.name);


  //返回一个Future
  Future<void> initName() async{
    await Future.delayed(const Duration(seconds: 2));
    name = 'first get name';
  }

  //返回一个Future
  Future<void> changeName(String newName) async{
    await Future.delayed(const Duration(seconds: 2));
    name = newName;
    print("name is $name");
  }
}