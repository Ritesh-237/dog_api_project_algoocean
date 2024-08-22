import 'package:dog_api_project/models/dog_image_model.dart';
import 'package:dog_api_project/repository/dog_image_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DogResponseModel? dogResponseModel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      retry();
    });
  }

  retry() {
    RepositoryImpl().getDogImageResponse().then((data) {
      setState(() {
        dogResponseModel = data;
      });
    }).onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Random Images",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: dogResponseModel?.message != null
          ? Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                            height: 400,
                            width: 500,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 350,
                                  width: 400,
                                  child: Card(
                                      elevation: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Image.network(
                                            fit: BoxFit.cover,
                                            height: 350,
                                            width: 300,
                                            dogResponseModel!.message),
                                      )),
                                ),
                                const Text('Price : ₹ 7000/-')
                              ],
                            ))),
                  ),
                ),
                // Text(dogResponseModel!.status),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          child: const Text("Skip"),
                          onPressed: () async {
                            List<String> temp = [];
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            List<String> historySkip =
                                prefs.getStringList('Skip') ?? [];

                            temp.addAll(historySkip);
                            temp.add(dogResponseModel!.message);
                            prefs.setStringList(
                              'Skip',
                              temp,
                            );
                            setState(() {
                              retry();
                            });
                          }),
                      ElevatedButton(
                          onPressed: () async {
                            List<String> temp = [];

                            List<String> histtemp = [];

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            List<String> historyCartImage =
                                prefs.getStringList('cart') ?? [];

                            temp.addAll(historyCartImage);

                            temp.add(dogResponseModel!.message);
                            prefs.setStringList('cart', temp);
                            List<String> historySkip =
                                prefs.getStringList('Skip') ?? [];

                            histtemp.addAll(historySkip);
                            histtemp.add(dogResponseModel!.message);
                            prefs.setStringList(
                              'Skip',
                              histtemp,
                            );
                            retry();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.blue,
                                duration: Duration(
                                  seconds: 1,
                                ),
                                content: Text("Added To Your Cart"),
                              ),
                            );
                          },
                          child: const Text("Add To Cart")),
                    ],
                  ),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
