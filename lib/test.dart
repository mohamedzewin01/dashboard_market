import 'package:flutter/material.dart';

class Product {
  final String name;

  Product({required this.name});
}

class SearchBarExample extends StatefulWidget {
  @override
  _SearchBarExampleState createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  List<Product> products = [
    Product(name: "Laptop"),
    Product(name: "Phone"),
    Product(name: "Tablet"),
    Product(name: "Watch"),
  ];

  List<Product> filteredProducts = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void updateSearch(String searchQuery) {
    setState(() {
      query = searchQuery;
      filteredProducts = products
          .where((product) =>
          product.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Example'),
      ),
      body: Column(
        children: [
          SearchBar(
            hintText: "Search products...",
            onChanged: (value) {
              updateSearch(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredProducts[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
