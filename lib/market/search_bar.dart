import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cari Produk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductSearchPage(),
    );
  }
}

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  List<String> searchHistory = [];
  TextEditingController _searchController = TextEditingController();

  void _addSearchHistory(String query) {
    if (query.isNotEmpty && !searchHistory.contains(query)) {
      setState(() {
        searchHistory.add(query);
      });
    }
  }

  void _clearSearchHistory() {
    setState(() {
      searchHistory.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Cari Produk'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari Produk',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (query) {
                _addSearchHistory(query);
                _searchController.clear();
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: searchHistory.map((item) {
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      _searchController.text = item;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          if (searchHistory.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: _clearSearchHistory,
                  child: Text('Hapus Semua Riwayat'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}