import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rp_project/Auth_Service/Auth_Service.dart';
import 'package:rp_project/Auth_Service/FireBase_Auth_Service.dart';
import 'package:rp_project/Buttons/Login_Page_Button.dart';
import 'package:rp_project/Constants/Colors.dart';
import 'package:rp_project/Screens/Main_Page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _createemailController = TextEditingController();
  final TextEditingController _createpasswordController =
      TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? password;
  String? bodyError;
  String? confirm;

  // late String hid;
  // late String chapterid;
  // late String image;
  // bool isLoading = false;

  bool _isLoading = false;
  bool showPassword = true;
  bool showPasswordSignup = true;
  bool showPasswordSignup2 = true;
  bool showconfirmPassword = true;

  // void showMessage(String message) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Error"),
  //           content: Text(message),
  //           actions: [
  //             TextButton(
  //               child: Text("Ok"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  // Future<void> signOutFromGoogle() async {
  //   await _googleSignIn.signOut();
  //   await _auth.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // User? result = FirebaseAuth.instance.currentUser;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: kPrimaryWhiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 200,
                      height: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logo.png"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  //  SizedBox(height: screenHeight * (1 / 20)),
                  DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 30,
                          child: TabBar(
                            indicatorColor: kPrimaryGreenColor,
                            labelColor: kPrimaryGreenColor,
                            unselectedLabelColor: kPrimaryGreyColor,
                            tabs: [
                              Tab(
                                text: 'Sign In',
                              ),
                              Tab(text: 'Get Started'),
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.765,
                          // decoration: BoxDecoration(
                          //     border: Border(
                          //         top: BorderSide(
                          //             color: Colors.purple, width: 0.5)
                          //     )
                          // ),
                          child: TabBarView(
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    //login screen
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30.0, left: 35),
                                          child: Text(
                                            "Login to your account",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * (1 / 40)),
                                    _email(),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    _password(),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 10)),
                                    // !_isLoading
                                    //     ? bodyError != null
                                    //         ? Padding(
                                    //             padding:
                                    //                 const EdgeInsets.fromLTRB(
                                    //                     25, 0, 25, 0),
                                    //             child: Container(
                                    //               padding:
                                    //                   EdgeInsets.only(top: 10),
                                    //               alignment: Alignment.topLeft,
                                    //               child: Text(
                                    //                 bodyError.toString(),
                                    //                 textAlign: TextAlign.left,
                                    //                 style: TextStyle(
                                    //                     color: Colors.red),
                                    //               ),
                                    //             ))
                                    //         : SizedBox()
                                    //     : SizedBox(),
                                    //  SizedBox(height: screenHeight * (0.25 / 20)),
                                    // Align(
                                    //     alignment: Alignment.centerRight,
                                    //     child: Padding(
                                    //       padding:
                                    //           const EdgeInsets.only(right: 20),
                                    //       child: TextButton(
                                    //           onPressed: () {
                                    //             // Navigator.of(context)
                                    //             //     .pushReplacement(
                                    //             //   MaterialPageRoute(
                                    //             //       builder:
                                    //             //           (BuildContext context) =>
                                    //             //               ForgetPassword()),
                                    //             // );
                                    //           },
                                    //           child: Text(
                                    //             "Forgot  Password ?",
                                    //             style: TextStyle(
                                    //                 fontSize: 12,
                                    //                 color: kPrimaryGreyColor),
                                    //           )),
                                    //     )),

                                    LoginPageButton(
                                      function: () async {
                                        if (_formKey.currentState!.validate()) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();

                                          setState(() {
                                            _isLoading = true;
                                          });

                                          final AuthService _authService =
                                              FirebaseAuthService(
                                            authService: FirebaseAuth.instance,
                                          );
                                          try {
                                            await _authService
                                                .signInWithEmailAndPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            );
                                            setState(() {
                                              _isLoading = false;
                                            });
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        MainPage(),
                                              ),
                                            );
                                          } catch (e) {
                                            print(e);
                                            showFlash(
                                              context: context,
                                              duration: Duration(seconds: 2),
                                              builder: (_, c) {
                                                return Flash(
                                                  controller: c,
                                                  barrierDismissible: false,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  backgroundColor:
                                                      kPrimaryGreenColor,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 12),
                                                    child: Text(
                                                      e.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            kPrimaryWhiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        }
                                      },
                                      child: _isLoading
                                          ? CupertinoActivityIndicator(
                                              color: kPrimaryWhiteColor,
                                            )
                                          : Text("Login",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white)),
                                    ),

                                    // SizedBox(height: 10),

                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    //signup screen
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30.0, left: 35),
                                          child: Text(
                                            "Signup to your account",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * (1 / 40)),
                                    _emailSignup(),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    _passwordSignup(),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    _confirmpassword(),
                                    SizedBox(height: screenHeight * (0.5 / 20)),
                                    LoginPageButton(
                                      function: () async {
                                        if (_formKey.currentState!.validate()) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          final AuthService _authService =
                                              FirebaseAuthService(
                                            authService: FirebaseAuth.instance,
                                          );
                                          try {
                                            await _authService
                                                .createUserWithEmailAndPassword(
                                              email:
                                                  _createemailController.text,
                                              password:
                                                  _confirmpasswordController
                                                      .text,
                                            );
                                            setState(() {
                                              _isLoading = false;
                                            });
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        MainPage(),
                                              ),
                                            );
                                          } catch (e) {
                                            print(e);
                                            showFlash(
                                              context: context,
                                              duration: Duration(seconds: 2),
                                              builder: (_, c) {
                                                return Flash(
                                                  controller: c,
                                                  barrierDismissible: false,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  backgroundColor:
                                                      kPrimaryGreenColor,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 12),
                                                    child: Text(
                                                      e.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            kPrimaryWhiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        }
                                      },
                                      child: _isLoading
                                          ? CupertinoActivityIndicator(
                                              color: kPrimaryWhiteColor,
                                            )
                                          : Text("Join in Community",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white)),
                                    ),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50.0, right: 50.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "By creating an account, you agree to Terms of use and Privacy policy.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: primaryColor,
                                                ),
                                              )
                                            ])),
                                    SizedBox(height: 20)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  //login FEILDS

//Email Feils
  _email() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 100,
            offset: Offset(0, 0),
            spreadRadius: -25,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 8, 35, 8),
        child: TextFormField(
          style: TextStyle(fontSize: 16, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
            if (value!.isEmpty) {
              return 'Email Required';
            } else if (!regex.hasMatch(value)) {
              return "Couldn't find your Email";
            }
            return null;
          },
          onSaved: (String? val) {
            password = val;
          },
          controller: _emailController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            hintText: "E-mail",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.email, color: Colors.grey),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  //Password Feild
  _password() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 100,
            offset: Offset(0, 0),
            spreadRadius: -25,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 8, 35, 8),
        child: TextFormField(
          style: TextStyle(fontSize: 16.0, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          obscureText: showPassword,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            if (value!.isEmpty) {
              return 'Password required';
            } else if (!regex.hasMatch(value)) {
              return 'Password not Match';
            }
            return null;
          },
          onSaved: (String? val) {
            password = val;
          },
          controller: _passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            hintText: "Password",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () => setState(() => showPassword = !showPassword),
                icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility),
                color: Colors.grey,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

//Email Feils
  _emailSignup() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 100,
            offset: Offset(0, 0),
            spreadRadius: -25,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 8, 35, 8),
        child: TextFormField(
          style: TextStyle(fontSize: 16, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
            if (value!.isEmpty) {
              return 'Email Required';
            } else if (!regex.hasMatch(value)) {
              return 'Email not Valid';
            }
            return null;
          },
          onSaved: (String? val) {
            password = val;
          },
          controller: _createemailController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            hintText: "E-mail",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.email, color: Colors.grey),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  _confirmpassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 100,
            offset: Offset(0, 0),
            spreadRadius: -25,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 8, 35, 8),
        child: TextFormField(
          style: TextStyle(fontSize: 16.0, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          obscureText: showPasswordSignup2,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            if (value!.isEmpty) {
              return 'Password required';
            } else if (!regex.hasMatch(value)) {
              return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
            } else if (value != _createpasswordController.text) {
              return 'Not Matched';
            }
            return null;
          },
          onSaved: (String? val) {
            confirm = val;
          },
          controller: _confirmpasswordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            hintText: "Confirm Password",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () =>
                    setState(() => showPasswordSignup2 = !showPasswordSignup2),
                icon: Icon(showPasswordSignup2
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: Colors.grey,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  //Password Feild
  _passwordSignup() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 100,
            offset: Offset(0, 0),
            spreadRadius: -25,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 8, 35, 8),
        child: TextFormField(
          style: TextStyle(fontSize: 16.0, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          obscureText: showPasswordSignup,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            if (value!.isEmpty) {
              return 'Password required';
            } else if (!regex.hasMatch(value)) {
              return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
            }
            return null;
          },
          onSaved: (String? val) {
            password = val;
          },
          controller: _createpasswordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            hintText: "Create Password",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () =>
                    setState(() => showPasswordSignup = !showPasswordSignup),
                icon: Icon(showPasswordSignup
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: Colors.grey,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
