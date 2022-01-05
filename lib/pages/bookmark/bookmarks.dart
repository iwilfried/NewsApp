import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news/pages/screens.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  final saveList = [
    {
      'image': 'assets/news_image/img16.png',
      'newsTitle':
          'Euro 2020: Portugal Captain Cristiano Ronaldo Wins Golden Boot',
      'description':
          'Cristiano Ronaldo won the Golden Boot atEuro 2020 on Sunday Cristiano Ronaldo, 36, scored five goals for Portugal Ronaldo also featured...',
      'date': '2 days',
      'view': '365',
      'category': 'Sports',
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img21.png',
      'newsTitle':
          "Taapsee Pannu reacts to being labelled a 'superstar', says 'let theatres reopen",
      'description':
          "Taapsee Pannu has said that while she can sense positive signs, she is currently not in a position to say that she has become a 'star'...",
      'date': '2 days',
      'view': '365',
      'category': 'Entertainment',
      'type': 'news',
    },
    {
      'image': 'assets/news_image/img14.png',
      'newsTitle':
          'Zydus Cadila\'s Covid-19 vaccine approval likely in next few days',
      'description':
          'Gujarat-based pharmaceutical major Zydus Cadila\'s covid-19 vaccine may not be available in india...',
      'date': '3 days',
      'view': '365',
      'category': 'World',
      'type': 'news',
    },
    {
      'image': 'assets/news_image/img18.png',
      'newsTitle':
          'Why People with Cancer Should Be in COVID-19 Vaccination Trials',
      'description':
          'Experts are uncertain how effective COVID-19 vaccines are for people being treated for cancer and those who have survived the...',
      'date': '3 days',
      'view': '365',
      'category': 'Health',
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img19.png',
      'newsTitle':
          'Zomato IPO opens July 14, check grey market premium; should you...',
      'description':
          'Zomato, an online food delivery platform, sha- ses were trading with premium in the primary market, ahead of its Rs 9,375-crore...',
      'date': '3 days',
      'view': '365',
      'category': 'Business',
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img3.png',
      'newsTitle':
          'More than 2 can cost you govt Job single child\'s entry in IIT',
      'description':
          'Those who have only one child and undergo sterilisation will additionally get free health care for...',
      'date': '3 days',
      'view': '365',
      'category': 'Other',
      'type': 'video',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Bookmarks',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: saveList.isEmpty ? noItemSaved() : save(),
    );
  }

  noItemSaved() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.bookmark_remove,
            color: greyColor,
            size: 60,
          ),
          heightSpace,
          heightSpace,
          Text(
            'No new item save',
            style: greyColor13MediumTextStyle,
          ),
        ],
      ),
    );
  }

  save() {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: saveList.length,
      itemBuilder: (context, index) {
        final item = saveList[index];
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            Padding(
              padding: const EdgeInsets.only(
                top: fixPadding,
                bottom: fixPadding * 2.0,
              ),
              child: IconSlideAction(
                caption: 'Delete',
                color: primaryColor,
                icon: Icons.delete,
                onTap: () {
                  setState(() {
                    saveList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("News remove from bookmarks")));
                },
              ),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding,
              fixPadding * 2.0,
              fixPadding * 1.5,
            ),
            child: InkWell(
              onTap: () => item['type'] == 'video'
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoDetails(
                          title: item['newsTitle'],
                        ),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(
                          tag: saveList[index],
                          image: item['image'],
                          title: item['newsTitle'],
                        ),
                      ),
                    ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Hero(
                            tag: saveList[index],
                            child: Container(
                              height: 75.0,
                              width: 75.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: AssetImage(item['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          item['type'] == 'video'
                              ? Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      color: whiteColor,
                                      size: 28,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['newsTitle'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: primaryColor14SemiBoldTextStyle,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item['description'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: greyColor11RegularTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightSpace,
                  Row(
                    children: [
                      details(
                          title: '${item['date']} ago',
                          icon: Icons.access_time),
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      details(
                          title: item['view'], icon: Icons.visibility_outlined),
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      widthSpace,
                      Text(
                        item['category'],
                        style: greyColor11RegularTextStyle,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                saveList.removeAt(index);
                              });
                            },
                            child: Text(
                              'Remove',
                              style: primaryColor11BoldTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  details({String title, IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: greyColor,
        ),
        const SizedBox(width: 3),
        Text(
          title,
          style: greyColor10RegularTextStyle,
        ),
      ],
    );
  }
}
