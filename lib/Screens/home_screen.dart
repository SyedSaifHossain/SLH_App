import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
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
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 38,
              ),
            ),
          ),
        ),
        title: Text("Search"),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.black, size: 28),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
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
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF575555),
                    fontWeight: FontWeight.bold,
                  ),
                  filled: true,
                  fillColor: Color(0xFF575555).withValues(alpha: 0.5),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF575555),
                      size: 30,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),

            // Car Brand Filters
            Center(
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    List<String> icons = [
                      "assets/icons/stairingicon.png",
                      "assets/icons/ferrariicon.png",
                      "assets/icons/teslaicon.png",
                      "assets/icons/bmwicon.png",
                    ];
                    List<String> labels = ["All", "Ferrari", "Tesla", "BMW"];
                    return _buildCarBrandFilter(
                      icons[index],
                      labels[index],
                      index,
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5,left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recommended for you",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF575555),
                    ),
                  ),

                  Text("View All",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF575555),
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
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.65,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildCarCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build car brand filter
  Widget _buildCarBrandFilter(String iconPath, String label, int index) {
    bool isSelected = selectedFilterIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilterIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xFF575555).withValues(alpha: 0.5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isSelected)
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Center(
                        child: Image.asset(
                          iconPath,
                          width: 16,
                          height: 16,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                  const SizedBox(width: 8),
                  if (!isSelected)
                    Image.asset(
                      iconPath,
                      width: 16,
                      height: 16,
                      fit: BoxFit.contain,
                    ),

                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF575555),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build car card
  Widget _buildCarCard(int index) {
    List<Map<String, String>> cars = [
      {
        "name": "Sports Car",
        "price": "Starting from \$60/day",
        "image": "assets/images/frontcarimg.png",
      },
      {
        "name": "Luxury Car",
        "price": "Starting from \$55/day",
        "image": "assets/images/frontcarimg.png",
      },
      {
        "name": "SUV Car",
        "price": "Starting from \$70/day",
        "image": "assets/images/frontcarimg.png",
      },
      {
        "name": "Convertible Car",
        "price": "Starting from \$95/day",
        "image": "assets/images/frontcarimg.png",
      },
      {
        "name": "Tesla Model 3",
        "price": "Starting from \$60/day",
        "image": "assets/images/frontcarimg.png",
      },
      {
        "name": "Ferrari SF90",
        "price": "Starting from \$60/day",
        "image": "assets/images/frontcarimg.png",
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF575555).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car Image
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
          // Car Details Card
          Container(
            margin: const EdgeInsets.all(8),

            padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF000000),
                  ),

                  child: Text(
                    cars[index]["name"]!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  cars[index]["price"]!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Details-",
                  style: TextStyle(fontSize: 12, color: Color(0xFF000000)),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
