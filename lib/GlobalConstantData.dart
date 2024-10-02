

import 'package:secondtest/model/Class_setting/role.dart';
import 'package:secondtest/model/Class_setting/user.dart';

bool checkPermission(User user, String permission) {
  return user.role.permissions.contains(permission);
}


//--- create one instance user ---
User user = User(
    password: "password",
    username: "username",
    role: Role(
        name: "name",
        permissions: [
          "create_accident",
          "create_car",
          "create_person"
          "create_accidenté"
          "create_témoin"
          "edit_accident",
          "edit_car",
          "edit_person"
        ]
    )
);








class Constants {
  static const String grantType = 'password';
  static const String clientId = 'dataCollectBack';
  static const String clientSecret = '02cb2720-f6d4-4874-8fda-d39d2287463f';
  static  String username = 'police1';
  static  String password = 'police1';
  static String ?accessToken;



  // --------- LOCAL API BACKEND
  //static const String BASE_URL_API = 'http://192.168.43.193:8079/api/v1';

  // --------- ONLINE API BACKEND
  static const String BASE_URL_API = 'http://51.195.11.202:8099/api/v1';

  static const String BASE_URL_KEYCLOACK = 'http://51.195.11.202:8090';
  static const String KEYCLOACK_REALM_NAME = 'mtckeycloak';

  static const String KEYCLOACK_REALM_AUTH_CONFIG = '/auth/realms/${KEYCLOACK_REALM_NAME}/protocol/openid-connect/token';
  static const String URL_KEYCLOACK_REALM_CONFIG = '${BASE_URL_KEYCLOACK}${KEYCLOACK_REALM_AUTH_CONFIG}';






  static const String NamePathRacineProject = "dataCollecteAppFile";
}
