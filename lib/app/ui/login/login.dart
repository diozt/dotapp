import 'package:dotapp/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
// import 'package:gostrada/app/ui/theme/color.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final c = Get.find<AuthController>();
  var emailValidated = false;
  var passValidated = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Obx(
            () => Form(
              key: c.LoginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  Container(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // form email
                  TextFormField(
                    controller: c.email,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(14.0),
                      isDense: true,
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        color: Colors.grey, // <-- Change this
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      c.email.text = value!;
                    },
                    validator: (value) {
                      return c.validateEmail(value!);
                    },
                  ),
                  // end form email
                  const SizedBox(
                    height: 30,
                  ),

                  // form password

                  TextFormField(
                    autocorrect: false,
                    obscureText: c.isVisible.value,
                    controller: c.pass,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(14.0),
                      isDense: true,
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Colors.grey, // <-- Change this
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      suffixIcon: IconButton(
                          color: Colors.grey,
                          splashRadius: 1,
                          icon: Icon(c.isVisible.value == false
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            c.isVisible.toggle();
                          }),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onSaved: (value) {
                      c.pass.text = value!;
                    },
                    validator: (value) {
                      return c.validatePassword(value!);
                    },
                  ),

                  //end form password

                  const SizedBox(
                    height: 10,
                  ),
                  // error message
                  Visibility(
                    visible: c.errorMsg.value,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        c.errorVal.value,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  // end forgot password

                  // Forgont password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Lupa Kata Sandi?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  // end forgot password

                  const SizedBox(
                    height: 50,
                  ),

                  // button login
                  Container(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: c.validateEmail(c.email.text) == null &&
                              c.validatePassword(c.pass.text) == null
                          ? () => c.login(c.email.text, c.pass.text)
                          : null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, //background color of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: c.isLoading.isTrue
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : Text(
                                'Masuk',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                      ),
                    ),
                  )
                  // end button login
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
