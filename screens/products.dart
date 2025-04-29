import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  Products({super.key}); 

  final List<Map<String, String>> products = [
    {
      "name": "Economy Taxi",
      "description": "Corolla, Kia Rio...",
      "price": "Ksh.3,400 per hour",
      "imagePath": "assets/images/economy.jpeg",
    },
    {
      "name": "Luxury Taxi",
      "description": "BMW, Mercedes...",
      "price": "Ksh.5,000 per hour",
      "imagePath": "assets/images/luxury.jpeg",
    },
    {
      "name": "SUV Taxi",
      "description": "Land Cruiser, Jeep...",
      "price": "Ksh.4,500 per hour",
      "imagePath": "assets/images/suv.jpeg",
    },
    {
      "name": "Van Taxi",
      "description": "Toyota Hiace...",
      "price": "Ksh.6,000 per hour",
      "imagePath": "assets/images/van.jpeg",
    },
    {
      "name": "Mini Taxi",
      "description": "Suzuki Alto...",
      "price": "Ksh.2,500 per hour",
      "imagePath": "assets/images/mini.jpeg",
    },
    {
      "name": "Electric Taxi",
      "description": "Tesla Model 3...",
      "price": "Ksh.7,000 per hour",
      "imagePath": "assets/images/electric.jpg",
    },
    {
      "name": "Classic Taxi",
      "description": "Vintage Cars...",
      "price": "Ksh.8,000 per hour",
      "imagePath": "assets/images/classic.jpeg",
    },
    {
      "name": "Luxury SUV",
      "description": "Range Rover...",
      "price": "Ksh.9,000 per hour",
      "imagePath": "assets/images/luxurySUV.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          products.length, 
      itemBuilder: (context, index) {
        final product = products[index]; 
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ), 
          child: Container(
            margin: const EdgeInsets.only(
              left: 16.0,
            ), 
            child: Row(
              children: [
                Text(
                  '${index + 1}.', 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(width: 10), 
                Image.asset(product["imagePath"]!, height: 80, width: 80),
                SizedBox(
                  width: 10,
                ), 
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, 
                    children: [
                      Text(
                        product["name"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(product["description"]!),
                      Text(
                        product["price"]!,
                        style: TextStyle(color: Colors.green),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text("Hire"),
                        textColor: Colors.white,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
