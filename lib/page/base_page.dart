import 'package:flutter/material.dart';
import 'home_page.dart';
import 'mine_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabBarPageState();
  }
}

class _TabBarPageState extends State<TabBarPage> {

  int currentIndex = 0;
  List<Widget> pageList  = [const HomePage(), const MinePage()];
  late PageController controller = PageController(keepPage: true, initialPage: currentIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() => currentIndex = index);
          controller.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, ), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.person, ), label: "我的"),
        ],
      ),
    );
  }
}
