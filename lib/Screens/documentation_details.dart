import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:astro01/components/constants.dart';
import 'documentation_data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height; //screen height
    double sw = MediaQuery.of(context).size.width; //screen width

    return Scaffold(
      backgroundColor: myBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sh / 1.97,
              decoration: BoxDecoration(color: myBlue),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 700,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(planetInfo.gifplanet),
                            fit: BoxFit.contain),
                      ),
                    ),
                    right: -300,
                    top: -100,
                    bottom: -20,
                  ),
                  Positioned(
                    top: 26.5,
                    left: 9.5,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 32,
                    child: Container(
                      child: Text(
                        planetInfo.name,
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    height: sh / 1,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 32,
                          child: Text(
                            'Système solaire',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 31,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 35,
                    child: Text(
                      planetInfo.position.toString(),
                      style: TextStyle(
                        fontSize: 247,
                        color: Colors.white.withOpacity(0.08),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 32, right: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Divider(color: Colors.white),
                              SizedBox(height: 32),
                              Text(
                                planetInfo.description ?? '',
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Gotham',
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 32),
                              Divider(color: Colors.white),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 32,
                            right: 32,
                          ),
                          child: Text(
                            'Le saviez-vous ?',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Column(children: [
                            Container(
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 350,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        right: 30,
                                      ),
                                      //width: 100,
                                      child: Swiper(
                                        itemCount: planets.length,
                                        itemWidth:
                                            MediaQuery.of(context).size.width -
                                                6 * 6,
                                        layout: SwiperLayout.DEFAULT,
                                        pagination: SwiperPagination(
                                          builder: DotSwiperPaginationBuilder(
                                            activeSize: 8,
                                            space: 8,
                                            color: Colors.white,
                                            activeColor: myRed,
                                          ),
                                        ),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            child: Stack(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Card(
                                                      elevation: 1,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32),
                                                      ),
                                                      color: myBlue,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(32.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            SizedBox(
                                                                height: 10),
                                                            Text(
                                                              planets[index]
                                                                  .title,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Gotham',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Text(
                                                              planetInfo
                                                                      .diduknow[
                                                                  index],
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Gotham',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 32,
                            right: 32,
                          ),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            'Ma Galerie',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 250,
                          //padding: const EdgeInsets.only(left: 32.0),
                          child: ListView.builder(
                              itemCount: planetInfo.images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.asset(
                                        planetInfo.images[index],
                                        fit: BoxFit.cover,
                                      )),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
