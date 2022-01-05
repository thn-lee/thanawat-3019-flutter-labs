import 'package:flutter/material.dart';

class MipongButton extends StatelessWidget {
  const MipongButton({Key? key}) : super(key: key);

  void alertMsg(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text("Respect Mipong"),
      content: Text("You have pay respect to Mipong."),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.all(17),
          textStyle: const TextStyle(color: Colors.redAccent),
        ),
        child: const Text(
          "Pay respect to Mipong",
          style: TextStyle(
            fontSize: 20,
            color: Colors.redAccent,
          ),
        ),
        onPressed: () => {
          alertMsg(context),
        },
      ),
    );
  }
}

class MipongImageAsset extends StatelessWidget {
  const MipongImageAsset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("images/Mipong.jpg");
    Image image = Image(
      image: assetImage,
      width: 400,
      height: 300,
    );
    return Container(child: image);
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      color: Colors.indigo,
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Expanded(
                child: Text(
                  'Thanawat Leelawatcharamas',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Kanit',
                      fontSize: 22.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent),
                ),
              ),
              Expanded(
                child: Text(
                  '613040301-9',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Kanit',
                    fontSize: 22.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Expanded(
                child: Text(
                  'Photo credit:',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Kanit',
                      fontSize: 22.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent),
                ),
              ),
              Expanded(
                child: Text(
                  '"sUPawIT SIPpAsucHon"',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Kanit',
                    fontSize: 22.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Expanded(
                child: MipongImageAsset(),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Expanded(
                child: MipongButton(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
