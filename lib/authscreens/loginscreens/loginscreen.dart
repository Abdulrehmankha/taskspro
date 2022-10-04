import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/color_config.dart';
import 'package:globalinctasks/Utils/responsive.dart';
import 'package:globalinctasks/authscreens/loginscreens/logincontrollers/loginauthcontroller.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  Responsive response =  Responsive();

  LoginAuthController loginAuthController = Get.put(LoginAuthController());
  @override
  Widget build(BuildContext context) {
    response.setContext(context);
    return Scaffold(
      backgroundColor: const Color(0xffFAFCFF),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: response.setHeight(2),
                ),
                Image.asset(
                  "assets/logo.jpeg",
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: response.setHeight(3),
                ),


                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: response.setHeight(3),
                      ),

                      //Email Text Field
                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: Container(
                            // height: response.setHeight(6.5),
                            child: TextFormField(
                              // focusNode: focusNode,
                              style: TextStyle(
                                fontSize: response.setTextScale(14),
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: response.setTextScale(12),
                                    color: Colors.red,
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    gapPadding: 6.0,
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    gapPadding: 6.0,
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),

                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffdadada),
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorConfig.secondaryColor,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),

                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: response.setTextScale(14),
                                    color: ColorConfig.hintColor,
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffefefef)),
                              controller: loginAuthController.emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                String pattern =
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                    r"{0,253}[a-zA-Z0-9])?)*$";
                                RegExp regex = RegExp(pattern);
                                if (value == null || value.isEmpty || !regex.hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              // onSaved: (value) {
                              //   setState(() {});
                              // },
                            ),
                          )
                      ),
                      SizedBox(
                        height: response.setHeight(1),
                      ),

                      // password text field

                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20,),
                          child: Container(
                            // height: response.setHeight(6.5),
                            child: Obx(() => TextFormField(
                              style: TextStyle(
                                fontSize: response.setTextScale(14),
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: response.setTextScale(12),
                                    color: Colors.red,
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    gapPadding: 6.0,
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    gapPadding: 6.0,
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffdadada),
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorConfig.secondaryColor,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),

                                  suffixIcon: InkWell(
                                    onTap: () {
                                      loginAuthController.togglepasswordview();
                                    },
                                    child: Icon(
                                      loginAuthController.hidepassword.value ?
                                      Icons.remove_red_eye_rounded : Icons.visibility_off,
                                      size: 18,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  hintText: "Password",

                                  hintStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: response.setTextScale(14),
                                    color: ColorConfig.hintColor,
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffefefef)),

                              controller: loginAuthController.passwordcontroller,
                              keyboardType: TextInputType.text,
                              // obscureText: true,
                              obscureText: loginAuthController.hidepassword.value,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Password';
                                } else if (value.length <= 2) {
                                  return 'Your Password Contains atleast 4 letters';
                                }
                                return null;
                              },

                            )
                            ),
                          )
                      ),


                      SizedBox(
                        height: response.setHeight(3),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: response.setHeight(6.5),
                          width: response.setWidth(90),
                          child: ElevatedButton(
                              style:
                              ElevatedButton.styleFrom(
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                primary: ColorConfig.primaryColor,
                              ),
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                  print("Success");
                                  Navigator.pushNamed(context, '/home');
                                  loginAuthController.getUserData(context);
                                  //loginController.logInUserEmail(context,emailController.text , passwordController.text);
                                }


                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: const Color(
                                      0xffffffff),
                                  fontSize: response
                                      .setTextScale(16),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
