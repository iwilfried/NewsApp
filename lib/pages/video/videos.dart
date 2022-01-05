import 'package:news/pages/screens.dart';

class Videos extends StatefulWidget {
  const Videos({Key key}) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  final videoList = [
    {
      'image': 'assets/news_image/img16.png',
      'newsTitle':
          'Euro 2020: Portugal Captain Cristiano Ronaldo Wins Golden Boot',
      'description':
          'Cristiano Ronaldo won the Golden Boot atEuro 2020 on Sunday Cristiano Ronaldo, 36, scored five goals for Portugal Ronaldo also featured...',
      'save': true,
      'date': '10/07/2021',
      'category': 'Sports',
    },
    {
      'image': 'assets/news_image/img17.png',
      'newsTitle':
          'WhatsApp Privacy Policy Update That Gives Facebook User Data Access Criticsed by Europe Consumer Organisation',
      'description':
          'Facebook\'s WhatsApp on Monday faced a ba- rrage of complaints by the European consumer Organisation and others over a...',
      'save': false,
      'date': '10/07/2021',
      'category': 'Technology',
    },
    {
      'image': 'assets/news_image/img18.png',
      'newsTitle':
          'Why People with Cancer Should Be in COVID-19 Vaccination Trials',
      'description':
          'Experts are uncertain how effective COVID-19 vaccines are for people being treated for cancer and those who have survived the...',
      'save': false,
      'date': '10/07/2021',
      'category': 'Health',
    },
    {
      'image': 'assets/news_image/img19.png',
      'newsTitle':
          'Zomato IPO opens July 14, check grey market premium; should you subscribe for listing gains?',
      'description':
          'Zomato, an online food delivery platform, sha- ses were trading with premium in the primary market, ahead of its Rs 9,375-crore...',
      'save': true,
      'date': '10/07/2021',
      'category': 'Business',
    },
    {
      'image': 'assets/news_image/img20.png',
      'newsTitle': 'Food joints focusing more on direct delivery!',
      'description':
          'Multiple food joints are on their way to becom e ‘atmanirbhar’ and have started self-delivery services in the city. Some of...',
      'save': false,
      'date': '10/07/2021',
      'category': 'Food',
    },
    {
      'image': 'assets/news_image/img16.png',
      'newsTitle':
          'Euro 2020: Portugal Captain Cristiano Ronaldo Wins Golden Boot',
      'description':
          'Cristiano Ronaldo won the Golden Boot atEuro 2020 on Sunday Cristiano Ronaldo, 36, scored five goals for Portugal Ronaldo also featured...',
      'save': false,
      'date': '10/07/2021',
      'category': 'Sports',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Videos',
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
      body: videosList(),
    );
  }

  videosList() {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: videoList.length,
      itemBuilder: (context, index) {
        final item = videoList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding,
            fixPadding * 2.0,
            fixPadding * 1.5,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoDetails(title: item['newsTitle'])),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
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
                        Positioned(
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
                        ),
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
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 15,
                          color: greyColor,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          item['date'],
                          style: greyColor10RegularTextStyle,
                        ),
                      ],
                    ),
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
