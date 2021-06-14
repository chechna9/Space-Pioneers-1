import 'package:astro01/Screens/bravoBadge.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';
import '../main.dart';

// String avatar = user.avatar;
class TempAvatar extends ChangeNotifier {
  //to update avatar in avatarPage
  String avatar = user.avatar;
  void updateAvatar(String newAvatar) {
    avatar = newAvatar;
    notifyListeners();
  }
}

class AvatarPage extends StatefulWidget {
  @override
  AvatarPageState createState() => AvatarPageState();
}

class AvatarPageState extends State<AvatarPage> {
  int credit = user.etoiles;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TempAvatar>(
      create: (context) => TempAvatar(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profilePage');
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
                user.avatar = avatar;
                update_avatar(user.avatar);
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
                  child: CurrentAvatar(),
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
                        price: 0,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'ridingRocket',
                        price: 50,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'holdingRocket',
                        price: 100,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'ridingMoon',
                        price: 250,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'iron',
                        price: 500,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'beatPlanet',
                        price: 1000,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'iceCream',
                        price: 2000,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'onCloud',
                        price: 3000,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'hacker',
                        price: 4000,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'superHero',
                        price: 4500,
                      ),
                      AvatarCard(
                        credit: credit,
                        image: 'king',
                        price: 5000,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurrentAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(
          'assets/images/avatars/${Provider.of<TempAvatar>(context).avatar}.png'),
      radius: 100,
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
          avatar = image;
          Provider.of<TempAvatar>(context, listen: false).updateAvatar(image);
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

void update_avatar(String nouveaua_vatar) async {
  supabaseclient
      .from("user")
      .update({
        "email": user.email,
        "avatar": nouveaua_vatar,
      })
      .eq("email", user.email)
      .execute();
}
