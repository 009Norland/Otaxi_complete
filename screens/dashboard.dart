import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to the Otaxi.Co!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20), 
          
          GridView.count(
            crossAxisCount: 2, 
            shrinkWrap: true, 
            physics: NeverScrollableScrollPhysics(), 
            children: [
              
              Container(
                width: 50, 
                height: 50, 
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown.withOpacity(0.4),
                    width: 2,
                  ), 
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: Image.asset(
                    "assets/images/economy.jpeg", 
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
              Container(
                width: 50, 
                height: 50, 
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown.withOpacity(0.4),
                    width: 2,
                  ), 
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: Image.asset(
                    "assets/images/mini.jpeg", 
                    fit: BoxFit.contain, 
                  ),
                ),
              ),
             
              Container(
                width: 50, 
                height: 50, 
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown.withOpacity(0.4),
                    width: 2,
                  ), 
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: Image.asset(
                    "assets/images/car1.png", 
                    fit: BoxFit.contain, 
                  ),
                ),
              ),
             
              Container(
                width: 50, 
                height: 50, 
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown.withOpacity(0.4),
                    width: 2,
                  ), 
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: Image.asset(
                    "assets/images/classic.jpeg", 
                    fit: BoxFit.contain, 
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}