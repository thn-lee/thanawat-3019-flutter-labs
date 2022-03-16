import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _buildWideScreenContainers();
        } else {
          return _buildPortraitContainers();
        }
      },
    );
  }

  Widget leonardo() {
    return Stack(
      alignment: const Alignment(0.5, 0.65),
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://i.ytimg.com/vi/QxJHJPCh65A/hqdefault.jpg',
          ),
          radius: 140,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: const Text(
            'Leonardo Dicaprio',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget infoCard() {
    return Card(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: const [
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            title: Text(
              '4,000 metres underwater.',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('bottom of the Atlantic Ocean.'),
            leading: Icon(
              Icons.directions_boat,
              color: Colors.deepOrange,
            ),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            title: Text(
              '(911) 420-6969',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.deepOrange,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            title: Text(
              'leo_dicaprio@oscar.meme',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }

  Widget stars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star_half, color: Colors.red),
      ],
    );
  }

  Widget _buildPortraitContainers() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite Actor"),
      ),
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [leonardo(), infoCard(), stars()],
      ),
    );
  }

  Widget _buildWideScreenContainers() {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [leonardo()],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  infoCard(),
                  const SizedBox(
                    height: 40,
                  ),
                  stars()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
