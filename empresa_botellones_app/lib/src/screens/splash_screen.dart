import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Redirige automáticamente al LoginScreen después de 3 segundos
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Color de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.jpg', // Ruta de tu imagen
              width: 200, // Ajusta el ancho según sea necesario
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Indicador de carga
            SizedBox(height: 20),
            Text(
              'Cargando...',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
