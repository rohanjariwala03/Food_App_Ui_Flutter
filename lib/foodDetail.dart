import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/colors.dart';
import 'package:food_delivery_app/constant.dart';
import 'package:food_delivery_app/style.dart';

class FoodDetail extends StatefulWidget {
  final int index;
  FoodDetail(this.index);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int selectSize=0;
  bool isFav=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () => {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryText(
                text: 'Place an Order',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          customAppBar(context),
          DraggableScrollableSheet(
            minChildSize: 0.89,
              maxChildSize: 0.89,
              initialChildSize: 0.89,
              builder: (context,index){
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: popularFoodList[widget.index]['name'],
                            size: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/dollar.svg',
                                color: AppColors.tertiary,
                                width: 15,
                              ),
                              PrimaryText(
                                text: selectSize==0?popularFoodList[widget.index]['priceS']
                                    : selectSize==1? popularFoodList[widget.index]['priceM']
                                    : popularFoodList[widget.index]['priceL'],
                                size: 25,
                                fontWeight: FontWeight.w700,
                                color: AppColors.tertiary,
                                height: 1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      PrimaryText(
                                        text: 'Crust',
                                        color: AppColors.lightGray,
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      PrimaryText(
                                          text: 'Thin Crust',
                                          fontWeight: FontWeight.w600),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      PrimaryText(
                                        text: 'Delivery in',
                                        color: AppColors.lightGray,
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      PrimaryText(
                                          text: '30 min', fontWeight: FontWeight.w600),
                                    ]),
                              ),
                              Hero(
                                tag: popularFoodList[widget.index]['imagePath'],
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.grey[400], blurRadius: 30),],
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 200,
                                  child:
                                  Image.asset(popularFoodList[widget.index]['imagePath'], fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height:popularFoodList[widget.index]['category']=='Pizza'? 140 : 120,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.only(left: 1 == 0 ? 25 : 0),
                                child:popularFoodList[widget.index]['category']=='Pizza' ? Row(
                                  children: [
                                    foodSizeCard('S','8 inch',0),
                                    foodSizeCard('M','12 inch',1),
                                    foodSizeCard('L','16 inch',2),
                                  ],
                                )
                                    :
                                Row(
                                  children: [
                                    foodSizeCard('S','',0),
                                    foodSizeCard('M','',1),
                                    foodSizeCard('L','',2),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          PrimaryText(
                              text: 'Ingredients', fontWeight: FontWeight.w700, size: 22),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                          child: ingredientCard(ingredients[index]['imagePath']),
                        ),
                      ),
                    ),
                    SizedBox(height: 100,)
                  ],
                );
              }
          )
        ],
      ),
    );
  }

  Container ingredientCard(String imagePath) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.grey[300]),
            ]),
        child: Image.asset(
          imagePath,
          width: 90,
        ));
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:30),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.grey[400])),
                child: Icon(Icons.chevron_left),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  isFav=!isFav;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:isFav? Colors.amber: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                    Icons.star,
                    color: isFav? Colors.grey : AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodSizeCard(String size, String inch, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
              () => {
                selectSize = index,
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
                selectSize == index ? Colors.black87 : AppColors.white),
            color: selectSize == index
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
            PrimaryText(text: size, fontWeight: FontWeight.w800, size: 16),
            inch==''?Container()
            : PrimaryText(text: inch, fontWeight: FontWeight.w800, size: 16),
          ],
        ),
      ),
    );
  }
}
