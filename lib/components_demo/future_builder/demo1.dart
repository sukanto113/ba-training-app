import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FutureBuilderDemo1 extends StatefulWidget {
  const FutureBuilderDemo1({super.key});

  @override
  State<FutureBuilderDemo1> createState() => _FutureBuilderDemo1State();
}

class _FutureBuilderDemo1State extends State<FutureBuilderDemo1> {
  late Future<List<String>> _futureCountries;
  Future<List<String>> getCountries() async {
    final res = await Dio().get("https://api.first.org/data/v1/countries");
    final data = res.data["data"];
    final List<String> countries = [];
    for (final countryCode in data.keys) {
      countries.add(data[countryCode]["country"]);
    }
    return countries;
  }

  @override
  void initState() {
    super.initState();
    _futureCountries = getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: _futureCountries,
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.star_border),
                        title: Text(snapshot.data!.elementAt(index)),
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Error!",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
