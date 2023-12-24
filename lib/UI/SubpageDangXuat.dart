import 'package:connect/providers/loginviewmodel.dart';
import 'package:connect/ui/page_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SubPageDangXuat extends StatelessWidget {
  const SubPageDangXuat({super.key});
  static int idpage = 6;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      // LoginViewModel().Logout();
      // Navigator.popAndPushNamed(context, PageLogin.routename)
    });
  }
}
