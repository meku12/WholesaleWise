import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CommitSale.dart';

class detailss extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String sellingPrice;
  final String expireDate;
  final Map<String, dynamic> additionalFields; // New field to hold additional data

  detailss({
    required this.imageUrl,
    required this.productName,
    required this.sellingPrice,
    required this.expireDate,
    required this.additionalFields, // Updated constructor to accept additional fields
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductDetailPage(
        imageUrl: imageUrl,
        productName: productName,
        sellingPrice: sellingPrice,
        expireDate: expireDate,
        additionalFields: additionalFields, // Pass additional fields to the detail screen
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String sellingPrice;
  final String expireDate;
  final Map<String, dynamic> additionalFields; // New field to hold additional data

  ProductDetailPage({
    required this.imageUrl,
    required this.productName,
    required this.sellingPrice,
    required this.expireDate,
    required this.additionalFields, // Updated constructor to accept additional fields
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 94, 147),
        title: Text('Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => CommitSale()));

          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Card(
                  elevation: 4.0,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Selling Price: \$${sellingPrice}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Expire Date: ${expireDate}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      // Additional fields fetched from Firestore
                      if (additionalFields.isNotEmpty) // Check if additional fields are available
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price: ${additionalFields['price']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Product ID: ${additionalFields['productId']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Quantity: ${additionalFields['quantity']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),


 Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Quantity:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Quantity',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Sold By:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Sold By',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Customer Name:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Customer Name',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Action to perform on button press (e.g., commit sale)
                  print('Commit button pressed');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 3, 94, 147),
                  ), // Set color here
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Commit',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
