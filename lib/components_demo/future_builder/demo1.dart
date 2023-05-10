import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CountryInfo {
  final String name;
  final String code;
  final String region;

  CountryInfo({
    required this.name,
    required this.code,
    required this.region,
  });
}

class FutureBuilderDemo1 extends StatefulWidget {
  const FutureBuilderDemo1({super.key});

  @override
  State<FutureBuilderDemo1> createState() => _FutureBuilderDemo1State();
}

class _FutureBuilderDemo1State extends State<FutureBuilderDemo1> {
  late Future<List<CountryInfo>> _futureCountries;
  Future<List<CountryInfo>> getCountries() async {
    final res = await Dio().get("https://api.first.org/data/v1/countries");
    final data = res.data["data"];
    final List<CountryInfo> countries = [];
    for (final countryCode in data.keys) {
      countries.add(
        CountryInfo(
          name: data[countryCode]["country"],
          code: countryCode,
          region: data[countryCode]["region"],
        ),
      );
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
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: _futureCountries,
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final countryInfo = snapshot.data!.elementAt(index);
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(
                          countryInfo.code,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: Text(countryInfo.name),
                      subtitle: Text(countryInfo.region),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Error!",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                );
              } else {
                // return SkeletonListView();
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          borderRadius: BorderRadius.circular(50),
                          height: 40,
                          width: 40,
                        ),
                      ),
                      title: const SkeletonLine(),
                      subtitle: const SkeletonLine(
                        style: SkeletonLineStyle(width: 100),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
