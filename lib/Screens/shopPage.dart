import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

// la page shop c'est la page ou l'utilisateur peut consulter les badges ( obtenues et non obtenues)
class ShopPage extends StatefulWidget {
  @override
  SshopPageState createState() => SshopPageState();
}

class SshopPageState extends State<ShopPage> {
  int credit = user.etoiles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // un boutton pour retourner en arriére
            Navigator.pop(context);
          },
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
        backgroundColor:
            Color(0xff160030), // specifier la couleur du background
        elevation:
            10, // specifier les deffirentes tailles des elements de  la page
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
                credit: credit, // le credit
                image: 'ridingRocket', // le nom ed l'avatar
                price: 50, // le prix de l'avatar
              ),
              ShopCard(
                credit: credit,
                image: 'holdingRocket',
                price: 100,
              ),
              ShopCard(
                credit: credit,
                image: 'ridingMoon',
                price: 250,
              ),
              ShopCard(
                credit: credit,
                image: 'iron',
                price: 500,
              ),
              ShopCard(
                credit: credit,
                image: 'beatPlanet',
                price: 1000,
              ),
              ShopCard(
                credit: credit,
                image: 'iceCream',
                price: 2000,
              ),
              ShopCard(
                credit: credit,
                image: 'onCloud',
                price: 3000,
              ),
              ShopCard(
                credit: credit,
                image: 'hacker',
                price: 4000,
              ),
              ShopCard(
                credit: credit,
                image: 'superHero',
                price: 4500,
              ),
              ShopCard(
                credit: credit,
                image: 'king',
                price: 5000,
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
                            'assets/images/other/star.png', // inserer une etoiles
                            width: 30,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                  Text(
                    credit >= price
                        ? 'Obtenu'
                        : '$price', // afficher si le badge et obtenue ou non(afficher le prix sinon)
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
