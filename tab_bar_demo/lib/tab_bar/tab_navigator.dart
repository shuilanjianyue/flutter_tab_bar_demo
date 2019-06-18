import 'package:flutter/material.dart';
import 'package:tab_bar_demo/pages/home_page.dart';
import 'package:tab_bar_demo/pages/search_page.dart';
import 'package:tab_bar_demo/pages/travel_page.dart';
import 'package:tab_bar_demo/pages/my_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final defaultColor = Colors.grey; //默认颜色
  final activeColor = Colors.blue;//选中颜色
  final List textList = ['首页','搜索','旅拍','我的'];
  int currentIndex = 0;
  //默认第一页
  final PageController controller = PageController(
        initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              textList[currentIndex],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        ),
        body: PageView(
        controller: controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem( //首页
            icon:Icon(Icons.home,color: defaultColor), 
            activeIcon: Icon(Icons.home,color: activeColor),
            title: Text(
              '首页',
              style:TextStyle(
                color: currentIndex!=0 ? defaultColor:activeColor,
              )
            ),
            ),
            BottomNavigationBarItem( //搜索
            icon:Icon(Icons.search,color: defaultColor), 
            activeIcon: Icon(Icons.search,color: activeColor),
            title: Text(
              '搜索',
              style:TextStyle(
                color: currentIndex!=1 ? defaultColor:activeColor,
              )
            ),
            ),

             BottomNavigationBarItem( //旅拍
            icon:Icon(Icons.camera_alt,color: defaultColor), 
            activeIcon: Icon(Icons.camera_alt,color: activeColor),
            title: Text(
              '旅拍',
              style:TextStyle(
                color: currentIndex!=2 ? defaultColor:activeColor,
              )
            ),
            ),

            BottomNavigationBarItem( //我的
            icon:Icon(Icons.account_circle,color: defaultColor), 
            activeIcon: Icon(Icons.account_circle,color: activeColor),
            title: Text(
              '我的',
              style:TextStyle(
                color: currentIndex!=3 ? defaultColor:activeColor,
              )
            ),
            )
        ],
        onTap: (index){
          controller.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}