import 'package:flutter/material.dart';
import 'cart_screen.dart' show CartScreen;
import 'items_details_screen.dart' show ItemDetailsScreen;

class ItemsListScreen extends StatefulWidget {
  const ItemsListScreen({super.key});

  @override
  State<ItemsListScreen> createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  String _selectedProduct = "";
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Productos $_count"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CartScreen()));
            },
            icon: const Icon(Icons.shopping_cart),
            tooltip: ("Carrito de Compras"),
          )
        ],
      ),
      // Detalles de la card
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          onTap: () {
            setState(() => _selectedProduct = "Zapatilla ${index + 1}");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ItemDetailsScreen(
                    product: _selectedProduct,
                    count: index,
                    key: ItemDetailsScreen.valuekey)));
          },
          title: Text("Producto ${index + 1}"),
        ),
        itemCount: 10,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: "Contador Incremental",
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
