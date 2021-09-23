import 'package:dialog_flowtter/dialog_flowtter.dart';

class Basic {
  static Future<DetectIntentResponse> initialize() async {
    final DialogAuthCredentials credentials =
        await DialogAuthCredentials.fromFile(
            'assets/dialog_flow_auth.json');
    final DialogFlowtter dialogFlowtter =
        DialogFlowtter(credentials: credentials, sessionId: '101');
    final QueryInput query =
        QueryInput(text: TextInput(text: 'Hello', languageCode: 'en'));
    final DetectIntentResponse response =
        await dialogFlowtter.detectIntent(queryInput: query);
    print(response);
    return response;
  }
}
