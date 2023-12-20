import 'package:call_doc/controllers/auth_services.dart';
import 'package:call_doc/firebase_options.dart';
import 'package:call_doc/tab/tab_index.dart';
import 'package:call_doc/views/add_customer_page.dart';
// import 'package:call_doc/views/call_detail_page.dart';
import 'package:call_doc/views/home_page.dart';
import 'package:call_doc/views/login_page.dart';
import 'package:call_doc/views/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  KakaoSdk.init(
    nativeAppKey: "73f47c741e295d7406e75fb3d246065a",
    javaScriptAppKey: "5c1619e6e61fbbdbfc6e8a11b9f396cd",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '마트의원 비대면',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const CheckUser(),
        "/home": (context) => const HomePage(),
        "/tabindex": (context) => const TabIndex(),
        "/signup": (context) => const SignUpPage(),
        "/login": (context) => const LoginPage(),
        "/add": (context) => const AddCustomerPage(),
      },
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    AuthService().isLoggedIn().then((value) {
      if (value) {
        // Navigator.pushReplacementNamed(context, "/home");
        //tab navigation menu
        Navigator.pushReplacementNamed(context, "/tabindex");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
