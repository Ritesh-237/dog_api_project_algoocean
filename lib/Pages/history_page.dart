import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Recent History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<String>? historySkip =
                  snapshot.requireData.getStringList('Skip');
              //  List<String>? historyCart =
              // snapshot.requireData.getStringList('cart');

              return ListView.builder(
                itemCount: (historySkip ?? []).length,
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
                          child: Image.network(historySkip![index]),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
