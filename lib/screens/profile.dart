import 'package:easy_localization/easy_localization.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/login.dart';
import 'package:movie/widgets/global_keys.dart';
import 'package:movie/widgets/my_bottomsheet.dart';
import 'package:movie/widgets/my_dialog.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _onChangeLanguage() {
    final context = GlobalKeys.navigatorKey.currentContext!;

    showDialog(context: context, builder: ((context) => MyDialog()));

    if (context.locale.languageCode == Locale("mn", "MN").languageCode) {
      context.setLocale(Locale("en", "US"));
    } else {
      context.setLocale(Locale("mn", "MN"));
    }
  }

  Future<void> _onImagePick(ImageSource source) async {
    final XFile? file = await ImagePicker().pickImage(source: source);
    print(file?.name);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
      return provider.isLoggedIn
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _onImagePick(ImageSource.gallery),
                  child: Text("Зургийн сан нээх"),
                ),
                ElevatedButton(
                  onPressed: () => _onImagePick(ImageSource.camera),
                  child: Text("Камер нээх"),
                ),
                ElevatedButton(
                    onPressed: _onChangeLanguage,
                    child: Text("changeLang".tr())),
                // child: Text("changeLang".tr())),
                ElevatedButton(
                    onPressed: provider.onLogout, child: Text("logout".tr())),
              ],
            ))
          : LoginPage();
    }));
  }
}
