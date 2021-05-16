import 'package:flutter/material.dart';
import '../components/constants.dart';

class ShopPage extends StatefulWidget {
  @override
  SshopPageState createState() => SshopPageState();
}

class SshopPageState extends State<ShopPage> {
  int credit = 75;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        backgroundColor: Color(0xff160030),
        elevation: 10,
        leadingWidth: 70,
        toolbarHeight: 70,
        actions: [
          Transform.rotate(
            angle: 8,
            child: Image.asset(
              'assets/images/other/star.png',
              width: 30,
              fit: BoxFit.scaleDown,
            ),
          ),
          Center(
            child: Text(
              '$credit',
              style: TextStyle(
                color: myYellow,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
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
          child: GridView.count(
            padding: EdgeInsets.only(top: 50),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            children: [
              ShopCard(
                credit: credit,
                image: 'default',
                price: 20,
              ),
              ShopCard(
                credit: credit,
                image: 'ridingRocket',
                price: 50,
              ),
              ShopCard(
                credit: credit,
                image: 'ridingMoon',
                price: 75,
              ),
              ShopCard(
                credit: credit,
                image: 'ridingRocket',
                price: 150,
              ),
              ShopCard(
                credit: credit,
                image: 'default',
                price: 2000,
              ),
              ShopCard(
                credit: credit,
                image: 'default',
                price: 2000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  ShopCard({
    Key key,
    this.image,
    this.price,
    this.credit,
    this.locked,
  }) : super(key: key);
  final String image;
  final int price;
  final int credit;
  final bool locked;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
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
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: myYellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (credit >= price)
                      ? Text('')
                      : Transform.rotate(
                          angle: 8,
                          child: Image.asset(
                            'assets/images/other/star.png',
                            width: 30,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                  Text(
                    credit >= price ? 'Obtenue' : '$price',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
