import 'package:value_notifier_demo/stream_provider/user_model.dart';

class CounterStream{

    Stream<UserModel> getStreamUserModel() {
      return Stream<UserModel>.periodic(const Duration(milliseconds: 1000),
              (value) => UserModel("name$value")
      ).take(10);
    }
}