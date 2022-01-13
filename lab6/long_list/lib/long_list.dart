import 'package:flutter/material.dart';

List<String> getListElements() {
  var items = List<String>.generate(30, (counter) => "Problem ${counter + 1}");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(
    itemCount: listItems.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(listItems[index]),
        leading: const Icon(Icons.arrow_right),
        trailing: index % 2 == 0 ? null : const Icon(Icons.star),
        onTap: () => {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${listItems[index]} is ${index % 2 == 0 ? 'selected' : 'my favorite'}.'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            ),
          )
        },
      );
    },
  );
  return listView;
}
