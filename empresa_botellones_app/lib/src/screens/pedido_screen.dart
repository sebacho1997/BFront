import 'package:flutter/material.dart';

class PedidoScreen extends StatelessWidget {
  final String tipoPedido;

  PedidoScreen({required this.tipoPedido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedido de $tipoPedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Has seleccionado: $tipoPedido',
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Selecciona tu método de pago:'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Aquí integraríamos el pago por QR
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Pago por QR'),
                    content: Text('El QR será escaneado en la entrega.'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'))
                    ],
                  ),
                );
              },
              child: Text('Pagar por QR'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Confirmación de pago en efectivo
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Pago en Efectivo'),
                    content: Text('Pagarás al momento de la entrega.'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'))
                    ],
                  ),
                );
              },
              child: Text('Pagar en Efectivo'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Confirmar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
