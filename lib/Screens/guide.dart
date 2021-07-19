import 'package:astro01/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Guide extends StatelessWidget {
  final docGuide = [
    CardedPhoto(path: "assets/guide/doc/doc1.png"),
    CardedPhoto(path: "assets/guide/doc/doc2.png"),
    CardedPhoto(path: "assets/guide/doc/doc3.png")
  ];
  final jouerGuide = [
    CardedPhoto(path: "assets/guide/jouer/jouer1.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer2.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer3.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer4.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer5.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer6.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer7.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer8.png"),
    CardedPhoto(path: "assets/guide/jouer/jouer9.png"),
  ];
  final profilGuide = [
    CardedPhoto(path: "assets/guide/profil/profil1.png"),
    CardedPhoto(path: "assets/guide/profil/profil2.png"),
    CardedPhoto(path: "assets/guide/profil/profil3.png"),
    CardedPhoto(path: "assets/guide/profil/profil4.png"),
    CardedPhoto(path: "assets/guide/profil/profil5.png"),
    CardedPhoto(path: "assets/guide/profil/profil6.png"),
    CardedPhoto(path: "assets/guide/profil/profil7.png"),
    CardedPhoto(path: "assets/guide/profil/profil8.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myBlue,
        title: Text(
          'Guide',
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.white,
          iconSize: 35,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 70,
      ),
      backgroundColor: myBlue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Documentation',
                style: TextStyle(
                  color: myRed,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GuideSwiper(list: docGuide),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Jouer',
                style: TextStyle(
                  color: myRed,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GuideSwiper(list: jouerGuide),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Profil',
                style: TextStyle(
                  color: myRed,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GuideSwiper(list: profilGuide),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuideSwiper extends StatelessWidget {
  const GuideSwiper({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<CardedPhoto> list;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: list.length,
      curve: Curves.decelerate,
      itemBuilder: (context, indx) {
        return list[indx];
      },
      loop: false,
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          activeSize: 8,
          size: 9,
          space: 8,
          color: Colors.white,
          activeColor: myRed,
        ),
      ),
    );
  }
}

class CardedPhoto extends StatelessWidget {
  final String path;
  const CardedPhoto({
    @required this.path,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          path,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
