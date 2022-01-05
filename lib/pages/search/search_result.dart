import 'package:news/pages/screens.dart';
import 'package:news/widget/column_builder.dart';

class SearchResult extends StatefulWidget {
  final String search;
  const SearchResult({Key key, this.search}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final searchResultList = [
    {
      'image': 'assets/news_image/img12.png',
      'newsTitle':
          'Coronavirus live updates: Favipiravir oral suspension to treat Covid-19',
      'description':
          'India on Monday reported 37,154 new Covid-19 cases in last 24 hours, pushing the country\'s...',
      'save': true,
      'date': '10/07/2021',
      'view': '365',
      'comments': '10',
      'type': 'news',
    },
    {
      'image': 'assets/news_image/img13.png',
      'newsTitle':
          'Covid-19: Delhi’s Janpath market to remain closed until further orders',
      'description':
          'Authorities have launched a crackdown and closed several prominent market places in the...',
      'save': false,
      'date': '10/07/2021',
      'view': '365',
      'comments': '10',
      'type': 'news',
    },
    {
      'image': 'assets/news_image/img14.png',
      'newsTitle':
          'Zydus Cadila\'s Covid-19 vaccine approval likely in next few days',
      'description':
          'Gujarat-based pharmaceutical major Zydus Cadila\'s covid-19 vaccine may not be available...',
      'save': true,
      'date': '10/07/2021',
      'view': '365',
      'comments': '10',
      'type': 'news',
    },
    {
      'image': 'assets/news_image/img15.png',
      'newsTitle':
          '42 new coronavirus cases in Gujarat; no fresh death reported',
      'description':
          'No fresh death was reported during the day and the toll currently stands at 10,073, is said...',
      'save': false,
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
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          searchTextField(),
          searchResults(),
        ],
      ),
    );
  }

  searchTextField() {
    return Container(
      height: 30.0,
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greyColor.withOpacity(0.3), width: 1.3),
        ),
      ),
      child: TextField(
        style: primaryColor14SemiBoldTextStyle,
        controller: TextEditingController(text: widget.search),
        cursorColor: primaryColor,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              color: greyColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  searchResults() {
    return ColumnBuilder(
      itemCount: searchResultList.length,
      itemBuilder: (context, index) {
        final item = searchResultList[index];
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
                        tag: searchResultList[index],
                        image: item['image'],
                        title: item['newsTitle'],
                      ),
                    ),
                  ),
            child: Column(
              children: [
                Row(
                  children: [
                    Hero(
                      tag: searchResultList[index],
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
                            maxLines: 2,
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
                    details(title: item['date'], icon: Icons.access_time),
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
                    details(title: 'Share', icon: Icons.share_outlined),
                    widthSpace,
                    widthSpace,
                    widthSpace,
                    widthSpace,
                    details(
                        title: '${item['comments']}Comments',
                        icon: Icons.comment_outlined),
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
