import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/colors.dart';
import 'package:food_delivery_app/constant.dart';
import 'package:food_delivery_app/foodDetail.dart';
import 'package:food_delivery_app/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedFoodCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(),
            createDrawerBodyItem(
                icon: Icons.home,text: 'Home'),
            createDrawerBodyItem(
                icon: Icons.account_circle,text: 'Profile'),

            createDrawerBodyItem(
                icon: Icons.event_note,text: 'Events'),
            Divider(),
            createDrawerBodyItem(
                icon: Icons.notifications_active,text: 'Notifications'),
            createDrawerBodyItem(
                icon: Icons.contact_phone,text: 'Contact Info'),
            ListTile(
              title: Text('App version 1.0.0'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: PrimaryText(
                    text: 'Food',
                    size: 22,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: PrimaryText(
                    text: 'Driving',
                    height: 1.1,
                    size: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.search,
                      color: AppColors.secondary,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: AppColors.lighterGray)),
                        hintText: 'Search..',
                        hintStyle: TextStyle(
                            color: AppColors.lightGray,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: PrimaryText(
                      text: 'Categories',
                      fontWeight: FontWeight.w700,
                      size: 22),
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodCategoryList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                      child: foodCategoryCard(
                          foodCategoryList[index]['imagePath'],
                          foodCategoryList[index]['name'],
                          index),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: PrimaryText(
                      text: 'Popular', fontWeight: FontWeight.w700, size: 22),
                ),
                Column(
                  children: List.generate(
                    popularFoodList.length,
                    (index) => popularFoodCard(
                        popularFoodList[index]['imagePath'],
                        popularFoodList[index]['name'],
                        popularFoodList[index]['weight'],
                        popularFoodList[index]['star'],
                      index
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget popularFoodCard(
      String imagePath, String name, String weight, String star,int index) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodDetail(index)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.lighterGray)],
          color: AppColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          PrimaryText(
                            text: 'top of the week',
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PrimaryText(
                            text: name, size: 22, fontWeight: FontWeight.w700),
                      ),
                      PrimaryText(
                          text: weight, size: 18, color: AppColors.lightGray),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 12),
                        SizedBox(width: 5),
                        PrimaryText(
                          text: star,
                          size: 18,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(30.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], blurRadius: 20)
                  ]),
              child: Hero(
                tag: imagePath,
                child: Image.asset(imagePath,
                    width: MediaQuery.of(context).size.width / 2.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {
            print(index),
            selectedFoodCard = index,
          },
        ),
      },
      child: Container(
        margin: EdgeInsets.only(right: 20, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
                color:
                    selectedFoodCard == index ? Colors.black87 : AppColors.white),
            color: selectedFoodCard == index
                ? Colors.grey.shade100
                : AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath, width: 40),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: null,
                fillColor: selectedFoodCard == index
                    ? AppColors.white
                    : AppColors.tertiary,
                shape: CircleBorder(),
                child: Icon(Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedFoodCard == index
                        ? AppColors.black
                        : AppColors.white))
          ],
        ),
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('assets/profile.jpeg'))),

    );
  }

  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: (){
        Navigator.pop(context);
      },
    );
  }
}
