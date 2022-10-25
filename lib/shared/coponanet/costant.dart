
import '../../shopapp/login/login.dart';
import '../network/local/cachhelper.dart';
import 'coponanet.dart';

List<Map> tasks = [];
void SignOut(context) {
  CachHelper.removedata(key: 'token').then((value) {
    if (value) {
      Navigatefinish(context, ShopLogin());
    }
  });
}
