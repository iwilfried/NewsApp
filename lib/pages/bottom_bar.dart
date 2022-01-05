import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/pages/screens.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

int currentIndex = 0;

class _BottomBarState extends State<BottomBar> {
  DateTime currentBackPressTime;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50.0,
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getBottomBarItemTile(0, 'assets/icons/home.png'),
              getBottomBarItemTile(1, 'assets/icons/category.png'),
              getBottomBarItemTile(2, 'assets/icons/video.png'),
              getBottomBarItemTile(3, 'assets/icons/save.png'),
              getBottomBarItemTile(4, 'assets/icons/user.png'),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: (currentIndex == 0)
            ? const Home()
            : (currentIndex == 1)
                ? Category()
                : (currentIndex == 2)
                    ? const Videos()
                    : (currentIndex == 3)
                        ? const Bookmarks()
                        : const Profile(),
      ),
    );
  }

  getBottomBarItemTile(int index, icon) {
    return InkWell(
      onTap: () {
        changeIndex(index);
      },
      child: Image.asset(
        icon,
        height: 24,
        width: 24,
        color: (currentIndex == index) ? primaryColor : greyColor,
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: primaryColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
