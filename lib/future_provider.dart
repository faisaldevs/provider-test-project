import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/model.dart';
import 'package:riverpod_test_project/riverpod.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Blood Donor List')),
        body: Center(
          child: Consumer(
            builder: (context, watch, child) {
              final asyncData = watch.watch(dataProvider);

              return asyncData.when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final donor = data.data![index];
                      return DonorCard(donor: donor);
                    },
                  );
                },
                loading: () => CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DonorCard extends StatelessWidget {
  final Data donor;

  DonorCard({required this.donor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              donor.user?.name ?? 'No Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Blood Group: ${donor.bloodGroup ?? 'N/A'}'),
            Text('Contact: ${donor.contactPersonPhone ?? 'N/A'}'),
            Text('Address: ${donor.address ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
