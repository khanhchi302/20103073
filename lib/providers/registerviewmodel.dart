import 'package:flutter/material.dart';
import 'package:connect/repositories/register_repository.dart';

class RegisterViewModel with ChangeNotifier {
  int status =
      0; // 0 chua dang ki, 1 dang ki, 2 dk loi, 3 dk can xac minh email, 4 dk ko xm email
  String errormessage = "";
  bool agree = false;
  final registerRepo = RegisterRepository();
  String quydinh = "Chap nhan cac Dieu khoan sau:\n" +
      "1. cac thong tin cua ban se duoc chia se voi cac thanh vien\n" +
      "2. cac thong tin cua ban co the anh huong toi ket qua hoc tap\n" +
      "3. thong tin se duoc xoa vinh vien neu co yeu cau xoa.\n";
  void setAgree(bool value) {
    agree = value;
    notifyListeners();
  }

  Future<void> register(
      String email, String username, String pass, String cpass) async {
    status = 1;
    notifyListeners();
    errormessage = "";

    if (!agree) {
      status = 2;
      errormessage += "Bạn phải đồng ý với điều khoản đăng ký!\n";
      return;
    }

    if (email.isEmpty || username.isEmpty || pass.isEmpty) {
      status = 2;
      errormessage += "Email, username, pass không được để trống\n";
      return;
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      status = 2;
      errormessage += "email không hợp lệ!\n";
      return;
    }
    if (pass.length < 8) {
      status = 2;
      errormessage += "Password phải nhiều hơn 8 kí tự";
    }
    if (pass != cpass) {
      status = 2;
      errormessage += "Mật khẩu không giống nhau!";
      return;
    }
    if (pass == username) {
      status = 2;
      errormessage += "Tài khoản và mật khẩu không được giống nhau";
    }
    if (status != 2)
      status = await registerRepo.register(email, username, pass);
    // su dung repository goi ham login va lay ket qua
    notifyListeners();
  }
}
