import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final List<Map<String, dynamic>> _orders = [];

  void _addOrder() {
    final food = _foodController.text.trim();
    final price = double.tryParse(_priceController.text.trim()) ?? 0;
    final quantity = int.tryParse(_quantityController.text.trim()) ?? 0;

    if (food.isEmpty || price <= 0 || quantity <= 0) return;

    setState(() {
      _orders.add({
        "food": food,
        "price": price,
        "quantity": quantity,
        "total": price * quantity,
        "selected": false, // default unchecked
      });
      _foodController.clear();
      _priceController.clear();
      _quantityController.clear();
    });
  }

  double get _selectedTotal {
    return _orders
        .where((order) => order["selected"] == true)
        .fold(0, (sum, order) => sum + order["total"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                labelText: "Food Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: _addOrder,
              icon: const Icon(Icons.add),
              label: const Text("Add Order"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Your Orders:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _orders.isEmpty
                  ? const Center(child: Text("No orders added yet"))
                  : ListView.builder(
                      itemCount: _orders.length,
                      itemBuilder: (context, index) {
                        final order = _orders[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: CheckboxListTile(
                            value: order["selected"] ?? false,
                            onChanged: (bool? val) {
                              setState(() {
                                order["selected"] = val ?? false;
                              });
                            },
                            secondary: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.fastfood, color: Colors.green),
                                const SizedBox(width: 8),
                                Text(
                                  "Total: \$${order["total"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(order["food"]),
                            subtitle: Text(
                              "Price: \$${order["price"]} | Qty: ${order["quantity"]}",
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.orange,
                          ),
                        );
                      },
                    ),
            ),

            if (_orders.any((o) => o["selected"] == true))
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutPage(total: _selectedTotal),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Proceed to Checkout",
                  style: TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final double total;
  const CheckoutPage({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Amount: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            const Text(
              "Choose Payment Method:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet),
              label: const Text("Pay with PayPal"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.credit_card),
              label: const Text("Pay with Credit Card"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone_iphone),
              label: const Text("Pay with Apple Pay"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
