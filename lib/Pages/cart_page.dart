import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<String>? historyCartImage =
                  snapshot.requireData.getStringList(
                'cart',
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: (historyCartImage ?? []).length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                            Card(
                              shadowColor: Colors.black,
                              // color: Colors.white,
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  children: [
                                    Image.network(historyCartImage![index]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Price : ₹7000/-')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                          'Total :  ₹${(historyCartImage?.length ?? 0) * 7000}/-'))
                ],
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
