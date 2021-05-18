import 'dart:async';

import 'package:flutter/material.dart';
import '../components/constants.dart';

String avatar = "default";
StreamController<String> avatarController = StreamController();

class AvatarPage extends StatefulWidget {
  AvatarPage(this.stream);
  final Stream<String> stream;
  @override
  AvatarPageState createState() => AvatarPageState();
}

class AvatarPageState extends State<AvatarPage> {
  int credit = 75;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.stream.listen((event) {
      setState(() {
        avatar = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profilePage');
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Avatar',
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        backgroundColor: Color(0xff160030),
        elevation: 10,
        leadingWidth: 70,
        toolbarHeight: 70,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() {});
              print('saved');
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: myGradiant,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: myRed,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/avatars/$avatar.png'),
                  radius: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.only(top: 50),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                  children: [
                    AvatarCard(
                      credit: credit,
                      image: 'default',
                      price: 20,
                    ),
                    AvatarCard(
                      credit: credit,
                      image: 'ridingRocket',
                      price: 50,
                    ),
                    AvatarCard(
                      credit: credit,
                      image: 'ridingMoon',
                      price: 75,
                    ),
                    AvatarCard(
                      credit: credit,
                      image: 'ridingRocket',
                      price: 150,
                    ),
                    AvatarCard(
                      credit: credit,
                      image: 'default',
                      price: 2000,
                    ),
                    AvatarCard(
                      credit: credit,
                      image: 'default',
                      price: 2000,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarCard extends StatelessWidget {
  AvatarCard({
    Key key,
    this.image,
    this.price,
    this.credit,
  }) : super(key: key);
  final String image;
  final int price;
  final int credit;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (credit >= price) {
          avatarController.add(image);
        }
      },
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/avatars/$image.png',
              fit: BoxFit.fitWidth,
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/avatars/cadna.png'),
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(credit >= price ? 0 : 0.5),
                      BlendMode.dstATop),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
