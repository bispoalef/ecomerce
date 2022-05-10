import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/appColors/app_colors.dart';
import 'package:ecomerce/data/home-page-data/home_page_data.dart';
import 'package:ecomerce/styles/home_sreen_style.dart';
import 'package:ecomerce/swvImages/swv_images.dart';
import 'package:ecomerce/widgets/show_all_widgest.dart';
import 'package:ecomerce/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  AppBar buildAppBar() {
    return AppBar(
      bottom: const TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 22),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text('All'),
          Text('Clothing'),
          Text('Shoes'),
          Text('Accesories'),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: const [
          Text(
            'Welcome',
            style: HomeScreenStyle.appBarUpperTitleStyle,
          ),
          Text(
            'Shopping',
            style: HomeScreenStyle.appBarButtomTitleStyle,
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(SvgImages.setting),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(SvgImages.search),
          ),
        ),
      ],
    );
  }

  Widget buildAdvertismentPlece() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 170.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        items: [
          'https://blog.creatopy.com/wp-content/uploads/2019/03/creative-advertising-and-pop-culture-pop-culture-ads.png',
          'https://www.creatopy.com/blog/wp-content/uploads/2018/05/advertisement-ideas-inspiration-advertising.png'
        ].map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(i),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: buildAppBar(),
          body: TabBarView(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  buildAdvertismentPlece(),
                  const ShowAllWidget(
                    leftText: 'New Arrival',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: sigleProductData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        var data = sigleProductData[index];
                        return SingleProductWidget(
                          onPressed: () {},
                          productImage: data.productImage,
                          productModel: data.productModel,
                          productName: data.productName,
                          productOldPrice: data.productOldPrice,
                          productPrice: data.productPrice,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Center(child: Text('conteundo')),
              const Center(child: Text('conteundo')),
              const Center(child: Text('conteundo')),
            ],
          ),
        ));
  }
}