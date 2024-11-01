import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                // Imagen del logo
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/logo.jpg'), // Reemplaza con tu logo
                ),
                SizedBox(height: 10),
                Text(
                  'Una forma diferente de hidratarte',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          // Opciones del menú
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text('Registrarme / Iniciar sesión'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
              // Acción al tocar esta opción
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.headset_mic_outlined),
            title: Text('Ayuda en línea'),
            onTap: () {
              // Acción al tocar esta opción
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Información legal'),
            onTap: () {
              // Acción al tocar esta opción
            },
          ),
        ],
      ),
      // Footer parecido al de PedidosYa
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Mi perfil seleccionado por defecto
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent_outlined),
            label: 'Promociones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Mi perfil',
          ),
        ],
        onTap: (index) {
          // Manejar navegación entre pantallas
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/promotions');
              break;
            case 2:
              Navigator.pushNamed(context, '/orders');
              break;
            case 3:
              // Ya estás en "Mi perfil"
              break;
          }
        },
      ),
    );
  }
}
