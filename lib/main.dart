import 'package:ecommerce_flutter/common/widgets/bottom_bar.dart';
import 'package:ecommerce_flutter/constants/global_variables.dart';
import 'package:ecommerce_flutter/features/auth/screens/auth_screen.dart';
import 'package:ecommerce_flutter/features/auth/services/auth_service.dart';
import 'package:ecommerce_flutter/home/screens/home_screen.dart';
import 'package:ecommerce_flutter/provider/user_provider.dart';
import 'package:ecommerce_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Builder(
        builder: (context) {
          final userProvider = Provider.of<UserProvider>(context);
          return userProvider.user.token.isNotEmpty
              ? const BottomBar()
              : const AuthScreen();
        },
      ),
    );
  }
}
