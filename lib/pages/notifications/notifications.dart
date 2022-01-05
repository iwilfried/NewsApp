import 'package:news/pages/screens.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final notificationList = [
    {
      'image': 'assets/notifications/notification1.png',
      'title': 'Kina Shah',
      'notification': 'Reply to your comment.',
      'time': '1h',
    },
    {
      'image': 'assets/notifications/notification2.png',
      'title': 'Narendra modi is coming live',
      'notification':
          'Lorem Ipsum is simply dummy text of the printing and typesetting.',
      'time': '2h',
    },
    {
      'image': 'assets/notifications/notification3.png',
      'title': 'Social',
      'notification': 'Instagram starts rolling out new stories design',
      'time': '1 days',
    },
    {
      'image': 'assets/icons/subscription.png',
      'title': 'Subscription Plans',
      'notification':
          'Lorem Ipsum is simply dummy text of the printing and typesetting.',
      'time': '2 days',
    },
    {
      'image': 'assets/news_image/img18.png',
      'title': 'Health',
      'notification':
          'Why People with Cancer Should Be in COVID-19 Vaccination.',
      'time': '3 days',
    },
    {
      'image': 'assets/notifications/notification4.png',
      'title': 'Rocky Patel',
      'notification': 'Reply to your comment.',
      'time': '5 days',
    },
    {
      'image': 'assets/notifications/notification5.png',
      'title': 'Sports',
      'notification':
          'Tokyo Olympics: PM Narendra Modi promis es to have ice cream with',
      'time': '25 Jun 2021',
    },
  ];

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
          'Notifications',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: notificationList.isEmpty ? noNotifications() : notification(),
    );
  }

  noNotifications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.notifications_off,
            color: greyColor,
            size: 60.0,
          ),
          heightSpace,
          heightSpace,
          Text(
            'No new notifications',
            style: greyColor13MediumTextStyle,
          ),
        ],
      ),
    );
  }

  notification() {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        final item = notificationList[index];
        return Dismissible(
          key: Key('$item'),
          background: Container(
            margin: const EdgeInsets.only(top: fixPadding, bottom: fixPadding),
            color: primaryColor,
          ),
          onDismissed: (direction) {
            setState(() {
              notificationList.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item['title']} dismissed")));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: fixPadding,
            ),
            child: Row(
              children: [
                Container(
                  height: 55.0,
                  width: 55.0,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(color: whiteColor, width: 2.5),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.1),
                        spreadRadius: 2.0,
                        blurRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widthSpace,
                widthSpace,
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: primaryColor15SemiBoldTextStyle,
                      ),
                      Text(
                        item['notification'],
                        style: greyColor12RegularTextStyle,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${item['time']} ago',
                          textAlign: TextAlign.right,
                          style: greyColor12RegularTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
