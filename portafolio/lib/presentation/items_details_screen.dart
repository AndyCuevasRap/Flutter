import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const valuekey = ValueKey('ItemDetailScreen');

  final String product;
  final int count;

  const ItemDetailsScreen(
      {Key? key, required this.product, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Producto"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("img/img${count + 1}.jpg"),
          Center(
            child: Text(
              product,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          // Descripciones de los Zapatillas
          if (product == "Zapatilla 1") ...[
            const Text("UA Spawn 4"),
            // Product 2
          ] else if (product == "Zapatilla 2") ...[
            const Text("Adidas OwntheGame 2.0"),
            // Product 3
          ] else if (product == "Zapatilla 3") ...[
            const Text("Adidas OwntheGame 2.0"),
            // Product 4
          ] else if (product == "Zapatilla 4") ...[
            const Text("Adidas Pro N3Xt"),
            // Product 5
          ] else if (product == "Zapatilla 5") ...[
            const Text("Adidas Adizero Rose 1.5"),
            // Product 6
          ] else if (product == "Zapatilla 6") ...[
            const Text("Nike Precision V"),
            // Product 7
          ] else if (product == "Zapatilla 7") ...[
            const Text("Nike Renew Elevate lii"),
            // Product 8
          ] else if (product == "Zapatilla 8") ...[
            const Text("Nike Precision Vi"),
            // Product 9
          ] else if (product == "Zapatilla 9") ...[
            const Text("Nike Fly.Mid"),
            // Product 10
          ] else if (product == "Zapatilla 10") ...[
            const Text("Nike Lebron Witness Vi Tb"),
          ],
        ],
      ),
    );
  }
}
