import 'package:flutter/material.dart';
import 'package:connect/providers/forgotviewmodel.dart';
import 'package:connect/ui/AppConstant.dart';
import 'package:connect/ui/custom_control.dart';
import 'package:connect/ui/page_login.dart';
import 'package:provider/provider.dart';

class PageForgot extends StatelessWidget {
  PageForgot({super.key});
  static String routename = "/forgot";
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ForgotViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: viewmodel.status == 3
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/bronya_stick.gif"),
                      ),
                      Text(
                        "đã gửi yêu cầu thành công!",
                        style: AppConstant.textfancyheader2,
                      ),
                      Text(
                        "truy cap vao email va lam theo huong dan",
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewmodel.status = 0;
                              Navigator.popAndPushNamed(
                                  context, PageLogin.routename);
                            },
                            child: Text(
                              "Bam vao day ",
                              style: AppConstant.textlink,
                            ),
                          ),
                          Text("de dang nhap")
                        ],
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage(
                                'assets/images/a49cc95673f4ebf3a4263ab933f51c22_5393919961047654631.gif'),
                            width: 200,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          const Text(
                              "Dien Email vao de xac thuc qua trinh Lay lai mat khau!"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            textController: _emailController,
                            hintText: "Email",
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            viewmodel.errormessage,
                            style: AppConstant.textError,
                          ),
                          GestureDetector(
                            onTap: () {
                              final email = _emailController.text.trim();
                              viewmodel.forgotPassword(email);
                            },
                            child: CustomButton(textButton: "Gui Yeu Cau"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .popAndPushNamed(PageLogin.routename),
                            child: Text(
                              "<< Dang Nhap ",
                              style: AppConstant.textlink,
                            ),
                          )
                        ],
                      ),
                      viewmodel.status == 1
                          ? CustomSpinner(size: size)
                          : Container(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
