import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  // Lista temporal de productos de prueba
  List<Map<String, dynamic>> products = [
    {
      'name': 'Botellón de Agua',
      'price': 3.0,
      'imageUrl': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Hielo 1kg',
      'price': 2.5,
      'imageUrl': 'https://via.placeholder.com/50'
    },
    // Puedes agregar más productos si lo deseas
  ];

  // Lista temporal para almacenar los productos añadidos al carrito
  List<Map<String, dynamic>> cart = [];

  // Lista de pantallas para cada ícono
  final List<Widget> _pages = <Widget>[
    ProfileScreen(), // Pantalla de Perfil
    Center(child: Text('Home')), // Puedes reemplazar con tu widget Home
    Center(child: Text('Pedidos')), // Pantalla de Pedidos
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Método que se llamará al presionar el ícono del carrito
  void _openCart() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double totalPrice = cart.fold(
            0, (sum, item) => sum + (item['price'] * item['quantity']));

        return Dialog(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height *
                0.8, // 80% de la altura de la pantalla
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  // color: Colors.blue,
                  child: Text('Carrito',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (cart.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('El carrito está vacío',
                                style: TextStyle(fontSize: 18)),
                          )
                        else
                          Column(
                            children: cart.map((product) {
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: Image.network(product['imageUrl']),
                                  title: Text(product['name']),
                                  subtitle: Text(
                                      'Precio: \$${product['price']} x ${product['quantity']}'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (product['quantity'] > 1) {
                                              product['quantity']--;
                                            } else {
                                              cart.remove(product);
                                            }
                                          });
                                        },
                                      ),
                                      Text('${product['quantity']}'),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            product['quantity']++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        SizedBox(height: 20),
                        if (cart.isNotEmpty)
                          Text('Total: \$${totalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .blue, // Cambiado de 'primary' a 'backgroundColor'
                      minimumSize: Size(
                          double.infinity, 50), // Botón ocupa todo el ancho
                    ),
                    child: Text(
                      'Pagar',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Aquí iría la lógica para el pago
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, '/pedido');
                    },
                  ),
                ),
                TextButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Función para añadir un producto al carrito
  void addToCart(Map<String, dynamic> product) {
    setState(() {
      var found = cart.firstWhere(
        (item) => item['name'] == product['name'],
        orElse: () => {'name': '', 'price': 0.0, 'imageUrl': '', 'quantity': 0},
      );
      if (found['name'] != '') {
        found['quantity']++;
      } else {
        cart.add({
          'name': product['name'],
          'price': product['price'],
          'imageUrl': product['imageUrl'],
          'quantity': 1
        });
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['name']} añadido al carrito')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _openCart, // Llama a la función para abrir el carrito
          ),
        ],
      ),
      body: _selectedIndex == 1
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(product['imageUrl']),
                    title: Text(product['name']),
                    subtitle: Text('\$${product['price'].toStringAsFixed(2)}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        addToCart(product);
                      },
                      child: Text('Añadir al carrito'),
                    ),
                  ),
                );
              },
            )
          : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pedidos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
