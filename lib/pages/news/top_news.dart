import 'package:news/pages/screens.dart';

class TopNews extends StatefulWidget {
  const TopNews({Key key}) : super(key: key);

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
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
      'save': true,
      'type': 'news',
    },
    {
      'image': 'assets/news_image/img6.png',
      'newsTitle':
          'IMD predicts heavy to very heavy rains in several parts of north India today',
      'description':
          'The IMD prediction is for Uttarakhand, Punjab, Chandigarh, Haryana and national capital...',
      'save': true,
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img7.png',
      'newsTitle':
          'Yogi Adityanath unveils Popul- ation Policy 2021-2030 for Uttar Pradesh',
      'description':
          'The population policy and the draft bill for popul- ation control have become a political ...',
      'save': false,
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img8.png',
      'newsTitle': 'Rath Yatra to be taken out in Ahmedabad today amid curfew',
      'description':
          'Chief Minister Vijay Rupani and his deputy Nitin Patel, who visited the Lord Jagannath temple...',
      'save': true,
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img9.png',
      'newsTitle':
          'IMD predicts heavy to very heavy rains in several parts of north India today',
      'description':
          'Arrested Al-Qaeda-linked terrorists were plannin to use human bombs: UP Police',
      'save': false,
      'type': 'video',
    },
    {
      'image': 'assets/news_image/img10.png',
      'newsTitle':
          'India flies out Kandahar mission personnel as Taliban advance',
      'description':
          'he Indian mission is now manned only by local Afghan staff and while it is technically open, for...',
      'save': false,
      'type': 'video',
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
      body: topNews(),
    );
  }

  topNews() {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: topNewsList.length,
      itemBuilder: (context, index) {
        final item = topNewsList[index];
        return Padding(
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
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
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
}
