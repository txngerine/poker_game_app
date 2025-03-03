import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pokerpad/constants/screen_size.dart';
import 'package:pokerpad/controller/login_controller.dart';
import 'package:pokerpad/model/login_request_model.dart';
import 'package:pokerpad/model/login_response_model.dart';
import 'package:pokerpad/view/forgot_password.dart';
import 'package:pokerpad/view/lobby_page.dart';
import 'package:pokerpad/view/register_page.dart';
import 'package:pokerpad/widget/build_bold_text_widget.dart';
import 'package:pokerpad/widget/build_sub_heading_text.dart';
import 'package:pokerpad/widget/build_text_field_widget.dart';
import 'package:pokerpad/widget/build_text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  bool rememberButton = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  LoginResponseModel? playerDetails;
  bool isLoading = false;

// device id get function
  String _deviceId = "Fetching...";

  Future<void> _getStoredDeviceId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? storedDeviceId = pref.getString("device_id");

    setState(() {
      _deviceId = storedDeviceId ?? "No Device ID Found";
    });
    print("Updated Device ID: $_deviceId");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStoredDeviceId();
    Future.delayed(Duration(seconds: 1), () {
      print("login page device id: $_deviceId");
    });
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });
    final requestModel = LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
        deviceId: _deviceId,
        accountNo: "A020241027101417");
    try {
      final response = await _loginController.login(requestModel);
      setState(() {
        playerDetails = response;
        isLoading = false;
      });
      print("device id login api:${_deviceId}");
      print(playerDetails);
      print("response:$response");
      if (response?.status == "OK") {
        final appVersion = int.tryParse(response?.data?.appVersion ?? "0") ?? 1;
        print("app version:$appVersion");
        final appUrl = response?.data?.appUrl;

        if (appVersion > 1 && appUrl != null && appUrl.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange,
            content:
                const Text("A new update is available. Please update the app."),
          ));
          await downloadAndInstallApk(appUrl);
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: CupertinoColors.activeGreen,
            content: const Text(
              "Login Successfully",
              style: TextStyle(color: Colors.white),
            )));
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: LobbyPage(
                  playerResponse: playerDetails,
                  playerBalance: playerDetails?.data?.balance,
                  avatar: playerDetails?.data?.lobbyAvatar,
                ),
                type: PageTransitionType.rightToLeftWithFade));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            behavior: SnackBarBehavior.floating,
            content: const Text("Login failed, Invalid email or password!")));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error:$e")));
    }
  }

  double downloadProgress = 0.0; // Track progress

  Future<void> downloadAndInstallApk(String appUrl) async {
    setState(() {
      isLoading = true;
    });

    try {
      // Check and request permissions
      if (await Permission.storage.request().isDenied ||
          await Permission.manageExternalStorage.request().isDenied ||
          await Permission.requestInstallPackages.request().isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text("Storage permission is required to update the app")),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Save in app directory instead of external storage (avoids permission issues)
      final dir = await getApplicationDocumentsDirectory(); // Internal storage
      final apkPath = '${dir.path}/app-release.apk';
      final dio = Dio();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("App Updating, please wait...")),
      );

      await dio.download(
        appUrl,
        apkPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double progress = received / total;
            setState(() {
              downloadProgress = progress;
            });
            print("Progress: ${(progress * 100).toStringAsFixed(0)}%");
          }
        },
      );

      // Install APK
      await OpenFilex.open(apkPath);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("App update complete!")),
      );
    } catch (e) {
      print("Error Downloading or Installing APK: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to update the app")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: ScreenSize.screenHeight,
            width: ScreenSize.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                color: Colors.transparent,
                width: 646,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image.asset(
                      "assets/images/welcome_to_pokerpad.png",
                    ),
                    const SizedBox(height: 12),
                    const BuildTextWidget(
                      text: "Login to your account",
                    ),
                    const SizedBox(height: 24),
                    // Login Fields
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          BuildTextFieldWidget(
                            controller: emailController,
                            hintText: "Email",
                            labelText: 'email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          BuildTextFieldWidget(
                            labelText: "password",
                            hintText: "Password",
                            controller: passwordController,
                            obscureText: passwordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: passwordVisible
                                  ? Image.asset(
                                      "assets/images/Artboard 28.png",
                                      width: 47,
                                    )
                                  : Image.asset(
                                      "assets/images/Artboard 29.png",
                                      width: 47,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    rememberButton = !rememberButton;
                                  });
                                },
                                child: rememberButton
                                    ? Image.asset(
                                        "assets/images/empty checkmark.png",
                                        width: 30,
                                      )
                                    : Image.asset(
                                        "assets/images/Artboard 41.png",
                                        width: 30,
                                      ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const BuildTextWidget(
                                text: "Remember me",
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const ForgotPassword(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: const BuildBoldTextWidget(
                                  text: "Forgot password"))
                        ],
                      ),
                    ),
                    const SizedBox(height: 54),
                    // isLoading
                    //     ? CircularProgressIndicator()
                    //     : GestureDetector(
                    //         onTap: () {
                    //           if (_formKey.currentState?.validate() ?? false) {
                    //             login(); // Call the login function
                    //           } else {
                    //             print("Form is not valid");
                    //           }
                    //         },
                    //         child: Image.asset(
                    //           "assets/images/login button.png",
                    //           height: 59,
                    //         ),
                    //       ),

                    isLoading
                        ? Column(
                            children: [
                              SizedBox(height: 20),
                              downloadProgress > 0
                                  ? Column(
                                      children: [
                                        LinearProgressIndicator(
                                          value:
                                              downloadProgress, // Show the download progress
                                          backgroundColor: Colors.grey[300],
                                          color: Colors
                                              .blue, // You can change this to your desired color
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          '${(downloadProgress * 100).toStringAsFixed(0)}%', // Display the percentage
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const CircularProgressIndicator(), // Show circular indicator if no download progress
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                login(); // Call the login function
                              } else {
                                print("Form is not valid");
                              }
                            },
                            child: Image.asset(
                              "assets/images/login button.png",
                              height: 59,
                            ),
                          ),

                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BuildTextWidget(
                          text: "Don’t have an account? ",
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: RegisterPage(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade));
                            },
                            child: const BuildBoldTextWidget(text: " Sign up")),
                      ],
                    ),
                    Spacer(),
                    BuildSubHeadingText(
                      text: "Version:1.0.0",
                      fontSize: 10,
                      color: Colors.black26,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
