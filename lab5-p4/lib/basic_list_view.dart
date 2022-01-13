import 'package:flutter/material.dart';

class BasicListView extends StatelessWidget {
  const BasicListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.build),
          title: const Text('Engineering'),
          trailing: const Icon(Icons.star),
          onTap: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('EN'),
              ),
            ),
          },
        ),
        ListTile(
          leading: const Icon(Icons.pets),
          title: const Text('Agricultural'),
          onTap: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('AG'),
              ),
            ),
          },
        ),
        ListTile(
          leading: const Icon(Icons.maps_home_work),
          title: const Text('Architecture'),
          onTap: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('AR'),
              ),
            ),
          },
        ),
      ],
    );
  }
}
