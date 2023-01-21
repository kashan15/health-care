import 'package:azlistview/azlistview.dart';

class Client extends ISuspensionBean {
  Client();

  String? name;
  String? tagIndex;

  @override
  String getSuspensionTag() {
    return tagIndex!;
  }
}
