import 'package:flutter/material.dart';
import 'package:insurancewalletmobile/profile_page.dart';
import './models/insurance.dart';
import './bottom_bar.dart';
import 'Insurance_page.dart';

import './models/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insurance Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/profile': (context) => ProfilePage(),
        '/insurance': (context) => InsurancePage(
            1, 'pdf_icon', 'Insurance Upload', 'Upload your PDF document')
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 225),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [lightBlueIsh, lightGreen],
                          begin: const FractionalOffset(1.0, 1.0),
                          end: const FractionalOffset(0.2, 0.2),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Your Insurances',
                          style: titleStyleWhite,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  constraints: BoxConstraints.expand(height: 200),
                  child: ListView(
                      padding: EdgeInsets.only(left: 40),
                      scrollDirection: Axis.horizontal,
                      children: getRecommendedInsurance()),
                ),
                Container(
                  height: 485,
                  margin: EdgeInsets.only(top: 300),
                  // padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Explore New Opportunities",
                          style: titileStyleBlack,
                        ),
                      ),
                      Container(
                        height: 455,
                        child: ListView(
                          children: getInsuranceCategories(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  List<String> insuranceCategories = ["Automotive", "Life", "House"];

  Map insuranceCatToIcon = {
    "Automotive": Icon(Icons.car_rental, color: lightBlueIsh, size: 50),
    "Life": Icon(Icons.person, color: lightBlueIsh, size: 50),
    "House": Icon(Icons.house, color: lightBlueIsh, size: 50)
  };

  Widget getCategoryContainer(String categoryName) {
    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 368,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(categoryName, style: titileStyleLighterBlack),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 200,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: insuranceCatToIcon[categoryName],
              elevation: 10,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getInsuranceCategories() {
    List<Widget> insuranceCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in insuranceCategories) {
      // if (i < 2) {
      //   rows.add(getCategoryContainer(category));
      //   i++;
      // } else {
      i = 0;
      insuranceCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
      rows = [];
      rows.add(getCategoryContainer(category));
      i++;
      // }
    }
    if (rows.length > 0) {
      insuranceCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return insuranceCategoriesCards;
  }

  List<Insurance> findInsurance() {
    List<Insurance> insurance = [];
    insurance.add(new Insurance("Bradesco", "Seguro Veicular", 20000,
        new AssetImage("lib/assets/car.png")));

    insurance.add(new Insurance(
        "Itaú", "Seguro de vida", 30000, new AssetImage("lib/assets/car.png")));

    insurance.add(new Insurance("Liberty", "Seguro Doméstico", 20000,
        new AssetImage("lib/assets/car.png")));

    return insurance;
  }

  List<Widget> getRecommendedInsurance() {
    List<Widget> recentInsuranceCards = [];
    List<Insurance> insurances = findInsurance();
    for (Insurance insurance in insurances) {
      recentInsuranceCards.add(getInsuranceCard(insurance));
    }
    return recentInsuranceCards;
  }

  Widget getInsuranceCard(Insurance insurance) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20, bottom: 30, top: 30),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: insurance.companyLogo,
              ),
              Text(
                insurance.insuranceTitle,
                style: jobCardTitileStyleBlue,
              )
            ],
          ),
          Text(insurance.companyName, style: jobCardTitileStyleBlack)
        ],
      ),
    );
  }
}
