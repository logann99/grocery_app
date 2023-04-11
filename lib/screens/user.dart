import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 15,
                // ),
                RichText(
                  text: TextSpan(
                    text: 'Hi ,  ',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('My name is pressed');
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  textTitle: 'Email@gmail.com',
                  textColor: color,
                  textSize: 18,
                  // isTitle: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                _customListTiles(
                    color: color,
                    title: 'Address',
                    subTitle: 'My subtitle',
                    icon: IconlyLight.profile,
                    onPressed: () async {
                      _showAddressDialog();
                    }),
                _customListTiles(
                    color: color,
                    title: 'Orders',
                    subTitle: '',
                    icon: IconlyLight.bag,
                    onPressed: () {}),
                _customListTiles(
                  color: color,
                  title: 'WishList',
                  icon: IconlyLight.heart,
                  onPressed: () {},
                ),
                _customListTiles(
                  color: color,
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: () {},
                ),
                _customListTiles(
                  color: color,
                  title: 'Forget Password',
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                ),
                SwitchListTile(
                  title: TextWidget(
                    textTitle:
                        themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    textColor: color,
                    textSize: 22,
                    // isTitle: true,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(
                      () {
                        themeState.setDarkTheme = value;
                      },
                    );
                  },
                  value: themeState.getDarkTheme,
                ),
                _customListTiles(
                  color: color,
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  onPressed: () {
                    _showLogOutDialog();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogOutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Log Out',
                ),
              ],
            ),
            content: const Text(
              'Do You Want LogOut?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  textColor: Colors.cyan,
                  textSize: 18,
                  textTitle: 'Cancel',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  textColor: Colors.red,
                  textSize: 18,
                  textTitle: 'Ok',
                ),
              ),
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Update',
          ),
          content: TextField(
            onChanged: (value) {
              _addressTextController.text;
            },
            controller: _addressTextController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: "Your Address",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Update',
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _customListTiles({
    required String title,
    required IconData icon,
    required Function onPressed,
    String? subTitle,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        textTitle: title,
        textColor: color,
        textSize: 22,
        // isTitle: true,
      ),
      subtitle: TextWidget(
        textTitle: subTitle ?? "",
        textColor: color,
        textSize: 18,
        // isTitle: true,
      ),
      leading: Icon(
        icon,
      ),
      trailing: const Icon(
        IconlyLight.arrowRight2,
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
