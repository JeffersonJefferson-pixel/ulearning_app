import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> login(
      {LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}
