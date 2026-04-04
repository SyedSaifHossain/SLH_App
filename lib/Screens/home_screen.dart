import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {  // Fixed class name (convention)
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xFF000000),
                size: 38,
              ),
            ),
          ),
        ),
        title: const Text("Search"),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sauce",
          color: Color(0xFF000000),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Color(0xFF000000), size: 28),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 3,
            width: double.infinity,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search your speed.....",
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontFamily: "Open Sauce",
                    fontWeight: FontWeight.bold,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF575555).withValues(alpha: 0.5),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.search,
                      color: Colors.black38,
                      size: 30,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,   // Even spacing
                children: List.generate(4, (index) {
                  List<String> icons = [
                    "assets/icons/stairingicon.png",
                    "assets/icons/ferrariicon.png",
                    "assets/icons/teslaicon.png",
                    "assets/icons/bmwicon.png",
                  ];
                  List<String> labels = ["All", "Ferrari", "Tesla", "BMW"];

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4), // Small gap between chips
                      child: _buildCarBrandFilter(icons[index], labels[index], index),
                    ),
                  );
                }),
              ),
            ),


            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recommended for you",
                    style: TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                      fontFamily: "Open Sauce",
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Open Sauce",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Car Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemCount: 6,
                itemBuilder: (context, index) => _buildCarCard(index),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  // Filter Widget
  Widget _buildCarBrandFilter(String iconPath, String label, int index) {
    bool isSelected = selectedFilterIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilterIndex = index;
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          color: isSelected ? Color(0xFF999993): const Color(0xFFb8b8b7),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              // Icon with white background when selected
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Color(0xFFfff9f4) : null,
                ),
                child: Center(
                  child: Image.asset(
                    iconPath,
                    width: isSelected ? 28 : 28,
                    height: isSelected ? 28 : 28,
                    fit: BoxFit.contain,
                    color: isSelected ? Color(0xFF000000) : null,

                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),

              const SizedBox(width: 8),
              // Label
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Open Sauce",
                  color: isSelected ? Color(0xFF000000) : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _buildCarCard remains the same (you can keep your existing one)
  Widget _buildCarCard(int index) {
    // ... your existing car card code (unchanged)
    List<Map<String, String>> cars = [
      {"name": "Sports Car", "price": "Starting from \$60/day", "image": "assets/images/frontcarimg.png"},
      {"name": "Luxury Car", "price": "Starting from \$55/day", "image": "assets/images/frontcarimg.png"},
      {"name": "SUV Car", "price": "Starting from \$70/day", "image": "assets/images/frontcarimg.png"},
      {"name": "Convertible Car", "price": "Starting from \$95/day", "image": "assets/images/frontcarimg.png"},
      {"name": "Tesla Model 3", "price": "Starting from \$60/day", "image": "assets/images/frontcarimg.png"},
      {"name": "Ferrari SF90", "price": "Starting from \$60/day", "image": "assets/images/frontcarimg.png"},
    ];


    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFc7c2c2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                cars[index]["image"]!,
                fit: BoxFit.contain,
                width: 150,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4, right: 4),
            padding: const EdgeInsets.only(top: 18, left: 20, right: 20, bottom: 33),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Color(0xFF222220),
                  ),
                  child: Text(
                    cars[index]["name"]!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Open Sauce",
                      color: Color(0xFFffffff),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  cars[index]["price"]!,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF222220),
                    fontFamily: "Open Sauce",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Details-",
                  style: TextStyle(fontSize: 10,
                      color: Colors.black,
                      fontFamily: "Open Sauce",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}