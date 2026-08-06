import 'package:flutter/material.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample shopping list data - in a real app, this would come from state management
    final List<Map<String, dynamic>> items = [
      {'name': 'Beef', 'quantity': '500g', 'checked': false},
      {'name': 'Rice noodles', 'quantity': '400g', 'checked': true},
      {'name': 'Bean sprouts', 'quantity': '200g', 'checked': false},
      {'name': 'Thai basil', 'quantity': '1 bunch', 'checked': false},
      {'name': 'Lime', 'quantity': '4 pcs', 'checked': false},
      {'name': 'Fish sauce', 'quantity': '100ml', 'checked': true},
      {'name': 'Sugar', 'quantity': '2 tbsp', 'checked': true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              // TODO: Show dialog to add item
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              // TODO: Clear completed items
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final Map<String, dynamic> item = items[index];
          return CheckboxListTile(
            title: Text(item['name']),
            subtitle: Text('Quantity: ${item['quantity']}'),
            value: item['checked'],
            onChanged: (bool? value) {
              // TODO: Implement state management to update the item
            },
            secondary: const Icon(Icons.shopping_cart),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Share or save shopping list
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Shopping list shared!')),
          );
        },
        label: const Text('Share List'),
        icon: const Icon(Icons.share),
      ),
    );
  }
}