import 'package:flutter/material.dart';
import 'package:amaranth_sportcenter/models/product_entry.dart';
import 'package:amaranth_sportcenter/widgets/left_drawer.dart';
import 'package:amaranth_sportcenter/screens/product_detail.dart';
import 'package:amaranth_sportcenter/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Definisikan enum untuk filter agar lebih bersih
enum ProductFilter { allProducts, myProducts }

class ProductEntryListPage extends StatefulWidget {
  final ProductFilter initialFilter;
  const ProductEntryListPage({
    super.key,
    this.initialFilter = ProductFilter.allProducts,
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  late ProductFilter _currentFilter;

  @override
  void initState() {
    super.initState();
    _currentFilter = widget.initialFilter;
  }

  Future<List<ProductEntry>> fetchProduct(
      CookieRequest request, ProductFilter filter) async {
    String url;
    if (filter == ProductFilter.allProducts) {
      url = 'http://localhost:8000/json/';
    } else {
      url = 'http://localhost:8000/my-products/json/';
    }

    // Lakukan request ke URL yang sudah ditentukan
    final response = await request.get(url);

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        // Pastikan Anda menggunakan nama kelas ProductEntry yang benar
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  // Fungsi untuk mengubah filter
  void _setFilter(ProductFilter newFilter) {
    if (newFilter != _currentFilter) {
      setState(() {
        _currentFilter = newFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        // Tambahkan tombol filter di AppBar
        actions: [
          IconButton(
            icon: Icon(
              Icons.grid_view,
              color: _currentFilter == ProductFilter.allProducts
                  ? Colors.blue
                  : Colors.grey,
            ),
            tooltip: 'All Products',
            onPressed: () => _setFilter(ProductFilter.allProducts),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: _currentFilter == ProductFilter.myProducts
                  ? Colors.blue
                  : Colors.grey,
            ),
            tooltip: 'My Products',
            onPressed: () => _setFilter(ProductFilter.myProducts),
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // Tampilkan teks indikator filter saat ini
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _currentFilter == ProductFilter.allProducts
                  ? 'Showing: All Products'
                  : 'Showing: My Products',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          // Bagian utama konten menggunakan Expanded agar mengisi sisa ruang
          Expanded(
            child: FutureBuilder(
              // Gunakan _currentFilter dalam future key
              future: fetchProduct(request, _currentFilter),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentFilter == ProductFilter.allProducts
                            ? 'There are no products yet.'
                            : 'You haven\'t listed any products.',
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xff59A5D8)),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ProductEntryCard(
                      product: snapshot.data![index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              product: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}