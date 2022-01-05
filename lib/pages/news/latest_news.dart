import 'package:news/pages/screens.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({Key key}) : super(key: key);

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
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
    {
      'image': 'assets/news_image/img11.png',
      'newsTitle':
          'Amazon\'s Online Store Down for many users globally, says Downdetector',
      'description':
          'E-commerce giant Amazon.com Inc\'s online store was grappling with widespread outages on Sunday night, according to outage monitoring website Downdetector, the second broad disruption to services since late...',
      'save': true,
      'date': '10/07/2021',
      'view': '365',
      'comments': '10',
      'type': 'news',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
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
      body: latestNews(),
    );
  }

  latestNews() {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: latestNewsList.length,
      itemBuilder: (context, index) {
        final item = latestNewsList[index];
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
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
                                builder: (context) => VideoDetails(
                                  title: item['newsTitle'],
                                ),
                              ),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetails(
                                  image: item['image'],
                                  tag: latestNewsList[index],
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
                          builder: (context) => VideoDetails(
                            title: item['newsTitle'],
                          ),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetails(
                            image: item['image'],
                            tag: latestNewsList[index],
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
                          details(title: item['date'], icon: Icons.access_time),
                          details(
                              title: item['view'],
                              icon: Icons.visibility_outlined),
                          details(title: 'Share', icon: Icons.share_outlined),
                          details(
                              title: '${item['comments']}Comments',
                              icon: Icons.comment_outlined),
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
