import 'package:carousel_pro/carousel_pro.dart';
import 'package:news/pages/screens.dart';
import 'package:news/widget/column_builder.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height;
  bool isSave1 = false;
  bool isSave2 = false;
  bool isSave3 = false;
  bool isSave4 = false;
  bool isSave5 = false;

  final topNewsList = [
    {
      'image': 'assets/news_image/img1.png',
      'newsTitle': 'India reports 42,766 new  covid-19 cases',
      'description':
          'Coronavirus cases today: The centre has warned against laxity in following Covid-appropriate...',
      'save': true,
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img2.png',
      'newsTitle':
          'Covid testing enough for global travel, not vaccine discrimination’: Jaishankar',
      'description':
          'At a joint press conference with his Russian counterpart Sergey Lavrov, external affairs minis...',
      'save': false,
      'type': 'news',
    },
    {
      'image': 'assets/news_image/img3.png',
      'newsTitle':
          'More than 2 can cost you govt Job, single child\'s entry in IIT',
      'description':
          'Those who have only one child and undergo sterilisation will additionally get free health care',
      'save': false,
      'type': 'news',
    },
  ];

  final latestNewsList = [
    {
      'image': 'assets/news_image/img4.png',
      'newsTitle':
          'Euro 2020: England fans left feeling blue after heartbreaking loss to Italy in final on penalties.',
      'description':
          'A nail-biting match turned heart-breaking when penaiti  got the best of team England and they lost to the italia- ns 3-2 on penalties on the 11th of July in UEFA Euro Cup 2020 at the Wembley Stadium, London...',
      'save': false,
      'date': '10/07/2021',
      'view': '365',
      'comments': '10',
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img5.png',
      'newsTitle':
          'Dilip Kumar was shocked to learn that stars charge money to attend weddings.',
      'description':
          'Dilip Kumar along with veteran comedian Johnny Walker at his residence. Speaking about his first meeting with the thespian, Jaffrey said, “Because I had accompanied Johnny Walker uncle I was given extra importance...',
      'save': false,
      'date': '10/07/2021',
      'view': '365',
      'comments': '10',
      'type': 'news',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: primaryColor20SemiBoldTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
            ),
            icon: const Icon(
              Icons.search,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          mainHeadline(),
          title(
            title: 'Top News',
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TopNews()),
            ),
          ),
          topNews(),
          title(
            title: 'Latest News',
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LatestNews()),
            ),
          ),
          latestNews(),
        ],
      ),
    );
  }

  mainHeadline() {
    return Container(
      height: height * 0.22,
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      color: whiteColor,
      child: Carousel(
        indicatorBgPadding: 6.0,
        dotColor: primaryColor,
        dotSize: 6.0,
        dotIncreaseSize: 1.5,
        dotSpacing: 10,
        dotBgColor: Colors.transparent,
        images: [
          headline(
            tag: '1',
            image: 'assets/news_image/img22.png',
            newsTitle:
                'Over 2,500% rise in Covid death registrations in second wave in Kerala',
            description:
                'Covid-19 death registrations in local bodies in the state picked up at alarming pace during the second wave, going from 404 covid deaths a month to  over...',
            date: '10/07/2021',
            view: '365',
            comment: '100',
            save: InkWell(
              onTap: () {
                setState(() {
                  isSave1 = !isSave1;
                });
              },
              child: Icon(
                isSave1 ? Icons.bookmark : Icons.bookmark_outline,
                color: whiteColor,
                size: 18,
              ),
            ),
          ),
          headline(
            tag: '2',
            image: 'assets/news_image/img23.jpg',
            newsTitle:
                'High Court Grants Temporary Bail To Surendra Gadling In Elgar Parishad Case',
            description:
                'Surendra Gadling, lodged at Taloja jail in Navi Mumbai, can be out on bail from August 13 to 21, said a division bench of Justices SS Shinde and N J Jamadar.',
            date: '10/07/2021',
            view: '565',
            comment: '20',
            save: InkWell(
              onTap: () {
                setState(() {
                  isSave2 = !isSave2;
                });
              },
              child: Icon(
                isSave2 ? Icons.bookmark : Icons.bookmark_outline,
                color: whiteColor,
                size: 18,
              ),
            ),
          ),
          headline(
            tag: '3',
            image: 'assets/news_image/img26.png',
            newsTitle:
                'Gujarat Zoo To Trade 40 Asiatic Lions For Other Wild Animals',
            description:
                'Gujarat Zoo To Trade 40 Asiatic Lions For Other Wild Animals Under the animal exchange programme, 40 Asiatic lions of this zoo will be traded with zoos across the country for different wild animals.',
            date: '10/07/2021',
            view: '360',
            comment: '70',
            save: InkWell(
              onTap: () {
                setState(() {
                  isSave3 = !isSave3;
                });
              },
              child: Icon(
                isSave3 ? Icons.bookmark : Icons.bookmark_outline,
                color: whiteColor,
                size: 18,
              ),
            ),
          ),
          headline(
            tag: '4',
            image: 'assets/news_image/img25.png',
            newsTitle:
                'Mi HyperSonic Power Bank With 50W Fast Charging, 20,000mAh Capacity Launched in India',
            description:
                'Mi HyperSonic Power Bank can deliver up to 22.5W via USB Type-A ports.',
            date: '10/07/2021',
            view: '300',
            comment: '50',
            save: InkWell(
              onTap: () {
                setState(() {
                  isSave4 = !isSave4;
                });
              },
              child: Icon(
                isSave4 ? Icons.bookmark : Icons.bookmark_outline,
                color: whiteColor,
                size: 18,
              ),
            ),
          ),
          headline(
            tag: '5',
            image: 'assets/news_image/img24.png',
            newsTitle:
                'Flat White: The Coffee Brew That Australia And New Zealand Continue To Fight Over',
            description:
                'It\'s not just the Aussie-Kiwi legends that form the backdrop of the Flat White origin story, there\'s also the rivalry between Sydney and Melbourne akin to the Delhi-Mumbai city rivalry.',
            date: '10/07/2021',
            view: '305',
            comment: '10',
            save: InkWell(
              onTap: () {
                setState(() {
                  isSave5 = !isSave5;
                });
              },
              child: Icon(
                isSave5 ? Icons.bookmark : Icons.bookmark_outline,
                color: whiteColor,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  headline({image, newsTitle, description, date, view, comment, save, tag}) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetails(
            tag: tag,
            image: image,
            title: newsTitle,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.fromLTRB(
                  fixPadding / 2,
                  fixPadding / 2,
                  fixPadding / 2,
                  fixPadding * 2.0,
                ),
                child: save,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  fixPadding,
                  0.0,
                  fixPadding * 4.0,
                  fixPadding,
                ),
                child: Text(
                  newsTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: whiteColor13SemiBoldTextStyle,
                ),
              ),
              Row(
                children: [
                  widthSpace,
                  widthSpace,
                  details(
                    title: date,
                    icon: Icons.access_time,
                    color: whiteColor,
                  ),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  details(
                    title: view,
                    icon: Icons.visibility_outlined,
                    color: whiteColor,
                  ),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  details(
                    title: 'Share',
                    icon: Icons.share_outlined,
                    color: whiteColor,
                  ),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  details(
                    title: '${comment}comments',
                    icon: Icons.comment_outlined,
                    color: whiteColor,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  fixPadding,
                  fixPadding,
                  fixPadding * 4.0,
                  fixPadding,
                ),
                child: Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: whiteColor9LightTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  title({String title, Function ontap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: primaryColor16SemiBoldTextStyle,
          ),
          InkWell(
            onTap: ontap,
            child: Text(
              'View All',
              style: primaryColor12BoldTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  topNews() {
    return ColumnBuilder(
      itemCount: topNewsList.length,
      itemBuilder: (context, index) {
        final item = topNewsList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding,
            fixPadding * 2.0,
            fixPadding,
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
                        tag: topNewsList[index],
                        image: item['image'],
                        title: item['newsTitle'],
                      ),
                    ),
                  ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: topNewsList[index],
                      child: Container(
                        height: 65.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                          ),
                        ),
                      ),
                    ),
                    item['type'] == 'video'
                        ? const Positioned(
                            bottom: -3,
                            left: -5,
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: whiteColor,
                              size: 28,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item['newsTitle'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: primaryColor14SemiBoldTextStyle,
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          InkWell(
                            onTap: () {
                              setState(() {
                                item['save'] = !item['save'];
                              });
                            },
                            child: Icon(
                              item['save']
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: item['save']
                                  ? primaryColor
                                  : primaryColor.withOpacity(0.6),
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item['description'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: greyColor11RegularTextStyle,
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

  latestNews() {
    return ColumnBuilder(
      itemCount: latestNewsList.length,
      itemBuilder: (context, index) {
        final item = latestNewsList[index];
        return Stack(
          children: [
            SizedBox(
              height: height * 0.35,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding * 2.0,
                      vertical: fixPadding,
                    ),
                    child: InkWell(
                      onTap: () => item['type'] == 'video'
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoDetails(title: item['newsTitle']),
                              ),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetails(
                                  tag: latestNewsList[index],
                                  image: item['image'],
                                  title: item['newsTitle'],
                                ),
                              ),
                            ),
                      child: Hero(
                        tag: latestNewsList[index],
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            item['type'] == 'video'
                ? Positioned(
                    top: 50,
                    left: 180,
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
            Positioned(
              top: 140,
              right: 45,
              left: 45,
              child: InkWell(
                onTap: () => item['type'] == 'video'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VideoDetails(title: item['newsTitle']),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetails(
                            tag: latestNewsList[index],
                            image: item['image'],
                            title: item['newsTitle'],
                          ),
                        ),
                      ),
                child: Container(
                  padding: const EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        color: primaryColor.withOpacity(0.1),
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item['newsTitle'],
                              overflow: TextOverflow.ellipsis,
                              style: primaryColor15SemiBoldTextStyle,
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          InkWell(
                            onTap: () {
                              setState(() {
                                item['save'] = !item['save'];
                              });
                            },
                            child: Icon(
                              item['save']
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: item['save']
                                  ? primaryColor
                                  : primaryColor.withOpacity(0.6),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          details(
                            title: item['date'],
                            icon: Icons.access_time,
                            color: greyColor,
                          ),
                          details(
                            title: item['view'],
                            icon: Icons.visibility_outlined,
                            color: greyColor,
                          ),
                          details(
                            title: 'Share',
                            icon: Icons.share_outlined,
                            color: greyColor,
                          ),
                          details(
                            title: '${item['comments']}Comments',
                            icon: Icons.comment_outlined,
                            color: greyColor,
                          ),
                        ],
                      ),
                      heightSpace,
                      Text(
                        item['description'],
                        style: greyColor10LightTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  details({String title, IconData icon, Color color}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: color,
        ),
        const SizedBox(width: 3),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
