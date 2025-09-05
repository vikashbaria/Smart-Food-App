import 'package:flutter/material.dart';
import 'package:smartfoodapp/screens/mealplane.dart';
import 'package:smartfoodapp/screens/order.dart';
import 'package:smartfoodapp/screens/profile.dart';
import 'package:smartfoodapp/theme/app_theme.dart';
import 'menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    Menupage(),
    Mealplane(),
    OrderPage(),
    Profile(),
  ];

  final List<String> _titles = [
    "Home",
    "Menu",
    "Meal Plan",
    "Order",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            _titles[_selectedIndex], // 👈 index ke hisaab se title change
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        elevation: 0,
      ),

      // 👇 Index ke hisaab se page show hoga
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFF6B35).withOpacity(0.5),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu/home.png', width: 24, height: 24),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu/menu.png', width: 24, height: 24),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/menu/mealplan.png',
              width: 24,
              height: 24,
            ),
            label: "Meal Plan",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu/order.png', width: 24, height: 24),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu/profile.png', width: 24, height: 24),

            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: AppTheme.appGradient,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to SmartFood",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Order delicious food and plan your meals",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/quick-order.png',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Quick Order",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/meal-plan.png',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Create Meal Plan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Popular Items",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          _buildFoodCard(
            "Margherita Pizza",
            "Fresh mozzarella, tomato sauce, and basil",
            15.99,
          ),
          const SizedBox(height: 10),
          _buildFoodCard(
            "Veggie Burger",
            "Loaded with fresh veggies and sauces",
            12.50,
          ),
          const SizedBox(height: 10),
          const Text(
            "Special Offers",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppTheme.nichewalaGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "SPECIAL OFFER",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "50% OFF",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "On all vegetarian dishes",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Order Now",
                        style: TextStyle(color: Color(0xFFFF6B35)),
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/white-fok.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Food Card Widget
  Widget _buildFoodCard(String title, String description, double price) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8A65).withOpacity(0.2),
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/white-fok.png',
            color: Colors.black,
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: Colors.black)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset('assets/stars.png', height: 20, width: 20),
                    Image.asset('assets/stars.png', height: 20, width: 20),
                    Image.asset('assets/stars.png', height: 20, width: 20),
                    Image.asset('assets/stars.png', height: 20, width: 20),
                    Image.asset('assets/halfstar.png', height: 20, width: 20),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "\$$price",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          IconButton(
            icon: Image.asset('assets/plus-icon.png', height: 38, width: 38),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
