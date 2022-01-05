import 'package:news/pages/screens.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Settings',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          notifications(),
          divider(),
          title('Clear Cache'),
          description('Clear locally cached images, currently : 15.4MB'),
          divider(),
          title('Services'),
          description('Connect with social media account'),
          divider(),
          title('Privacy Policy'),
          divider(),
          title('About Us'),
          divider(),
          title('Terms of use'),
          divider(),
          title('Version'),
          description('1.0'),
          divider(),
        ],
      ),
    );
  }

  title(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        0.0,
      ),
      child: Text(
        title,
        style: primaryColor14SemiBoldTextStyle,
      ),
    );
  }

  description(String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Text(
        description,
        style: greyColor12RegularTextStyle,
      ),
    );
  }

  notifications() {
    return Padding(
      padding: const EdgeInsets.only(right: fixPadding * 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title('Push Notifications'),
          SizedBox(
            height: 20,
            child: Transform.scale(
              scale: 0.8,
              child: Switch(
                activeColor: primaryColor,
                inactiveThumbColor: greyColor,
                inactiveTrackColor: greyColor.withOpacity(0.6),
                value: notification,
                onChanged: (value) {
                  setState(() {
                    notification = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(
        fixPadding * 2.0,
        fixPadding * 1.5,
        fixPadding * 2.0,
        fixPadding / 2,
      ),
      color: greyColor.withOpacity(0.5),
      height: 0.8,
      width: double.infinity,
    );
  }
}
