import 'package:empresa_botellones_app/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
//import 'src/screens/home_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/register_screen.dart';
import 'src/screens/splash_screen.dart'; // Importa la pantalla de carga
import 'src/screens/pedido_screen.dart';

class EmpresaBotellonesApp extends StatefulWidget {
  @override
  _EmpresaBotellonesAppState createState() => _EmpresaBotellonesAppState();
}

class _EmpresaBotellonesAppState extends State<EmpresaBotellonesApp> {
  bool isAuthenticated = false;

  void login() {
    setState(() {
      isAuthenticated = true;
    });
  }

  void logout() {
    setState(() {
      isAuthenticated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botellones y Hielo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>
            SplashScreen(), // Muestra la pantalla de carga al inicio
        '/login': (context) => LoginScreen(onLogin: login),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/pedido': (context) => PedidoScreen()
      },
    );
  }
}

void main() {
  runApp(EmpresaBotellonesApp());
}
