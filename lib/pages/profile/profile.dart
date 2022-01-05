import 'package:news/pages/screens.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          userDetails(context),
          divider(),
          profileDetails(context),
        ],
      ),
    );
  }

  userDetails(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditUserInformation()),
        ),
        child: Row(
          children: [
            Hero(
              tag: 'profilePick',
              child: Container(
                height: 70.0,
                width: 70.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/users/user1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Krishna Rai',
                    style: primaryColor14SemiBoldTextStyle,
                  ),
                  Text(
                    'krishnarai@gmail.com',
                    style: greyColor12RegularTextStyle,
                  ),
                ],
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            const Icon(
              Icons.arrow_forward_ios,
              color: greyColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  profileDetails(context) {
    return Column(
      children: [
        profileDetailRow(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MostViewNews()),
          ),
          icon: 'assets/icons/view.png',
          title: 'Most View News',
          child: const Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 16,
          ),
        ),
        profileDetailRow(
          ontap: () {
            currentIndex = 3;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomBar()),
            );
          },
          icon: 'assets/icons/save.png',
          title: 'Bookmarks',
          child: const Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 16,
          ),
        ),
        profileDetailRow(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubscriptionPlans()),
          ),
          icon: 'assets/icons/subscription.png',
          title: 'Subscription Plans',
          child: const Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 16,
          ),
        ),
        profileDetailRow(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Notifications()),
          ),
          icon: 'assets/icons/notification.png',
          title: 'Notifications',
          child: const Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 16,
          ),
        ),
        profileDetailRow(
          ontap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Settings()),
          ),
          icon: 'assets/icons/settings.png',
          title: 'Settings',
          child: const Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 16,
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        profileDetailRow(
          ontap: () => logoutDialog(context),
          icon: 'assets/icons/logout.png',
          title: 'Logout',
          child: Container(),
        ),
      ],
    );
  }

  profileDetailRow({String title, Function ontap, String icon, Widget child}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          fixPadding * 2.0, fixPadding, fixPadding * 2.0, fixPadding * 1.5),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 20,
              width: 20,
              color: primaryColor,
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: primaryColor14SemiBoldTextStyle,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  logoutDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: fixPadding * 2.0,
                  bottom: fixPadding,
                ),
                child: Center(
                  child: Text(
                    'Sure you want to logout?',
                    textAlign: TextAlign.center,
                    style: primaryColor18SemiBoldTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding,
                            vertical: 7.0,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Text(
                            'Cancel',
                            style: whiteColor20BoldTextStyle,
                          ),
                        ),
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding,
                            vertical: 7.0,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: primaryColor),
                          ),
                          child: Text(
                            'Logout',
                            style: primaryColor20BoldTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding * 2.0),
      color: greyColor.withOpacity(0.3),
      height: 1,
      width: double.infinity,
    );
  }
}
