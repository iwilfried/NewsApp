import 'package:news/pages/screens.dart';

class NewsDetails extends StatefulWidget {
  final Object tag;
  final String image;
  final String title;
  const NewsDetails({Key key, this.image, this.tag, this.title})
      : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  bool save = true;
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nestedScrollView(),
    );
  }

  nestedScrollView() {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.28,
              backgroundColor: primaryColor,
              pinned: true,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: whiteColor,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                  color: whiteColor,
                ),
              ],
              flexibleSpace: Hero(
                tag: widget.tag,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0,
                vertical: fixPadding,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: primaryColor15SemiBoldTextStyle,
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  InkWell(
                    onTap: () {
                      setState(() {
                        like = !like;
                      });
                    },
                    child: Icon(
                      like ? Icons.thumb_up : Icons.thumb_up_outlined,
                      color:
                          like ? primaryColor : primaryColor.withOpacity(0.6),
                      size: 16,
                    ),
                  ),
                  widthSpace,
                  InkWell(
                    onTap: () {
                      setState(() {
                        save = !save;
                      });
                    },
                    child: Icon(
                      save ? Icons.bookmark : Icons.bookmark_outline,
                      color:
                          save ? primaryColor : primaryColor.withOpacity(0.6),
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 1.5,
                    vertical: fixPadding / 2,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Technology',
                    style: whiteColor13SemiBoldTextStyle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  fixPadding * 2.0, fixPadding, fixPadding * 2.0, 0.0),
              child: Row(
                children: [
                  details(title: '10/07/2021', icon: Icons.access_time),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  details(title: '365', icon: Icons.visibility_outlined),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  details(title: 'Share', icon: Icons.share_outlined),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  details(title: '10Comments', icon: Icons.comment_outlined),
                ],
              ),
            ),
            descriptionWithLink(
              text1: 'E-commerce giant ',
              link: 'Amazon.com',
              text2:
                  ' Inc\'s online store was grappling with widespread outages on Sunday night, according to outage monitor- ing website Downdetector, the second broad disruption to services since late June.',
            ),
            description(
                'Its online store showed error messages on several regional domains. Reuters could not access product listing on its domains including, the United States, India, Canada, the United Kingdom, France and Singapore.'),
            description(
                'We\'re sorry that some customers may be experiencing issues while shopping.'),
            descriptionWithLink(
              text1: 'As of 0400 GMT, some of the domains were back up. ',
              link: 'Amazon',
              text2:
                  ' did not immediately respond to requests for comment about the extent of the recovery in services.',
            ),
            description(
                'More than 38,000 user reports indicated issues with Amazon\'s online store site, while nearly 500 users reported problems with the Amazon Web Services, according to Downdetector.'),
            description(
                'About 80% of the issues reported were with its website, while 15% were with log-ins and 5% with its check-out services, according to Downdetector.'),
            descriptionWithLink(
              text1: 'E-commerce giant ',
              link: 'Amazon.com',
              text2:
                  ' Inc\'s online store was grappling with widespread outages on Sunday night, according to outage monitor- ing website Downdetector, the second broad disruption to services since late June.',
            ),
            description(
                'More than 38,000 user reports indicated issues with Amazon\'s online store site, while nearly 500 users reported problems with the Amazon Web Services, according to Downdetector.'),
          ],
        ),
      ),
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

  descriptionWithLink({String link, String text1, String text2}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: const TextStyle(
                color: greyColor,
                fontSize: 10,
                fontWeight: FontWeight.w300,
                fontFamily: 'Kodchasan',
              ),
            ),
            TextSpan(
              text: link,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 10,
                fontWeight: FontWeight.w300,
                fontFamily: 'Kodchasan',
              ),
            ),
            TextSpan(
              text: text2,
              style: const TextStyle(
                color: greyColor,
                fontSize: 10,
                fontWeight: FontWeight.w300,
                fontFamily: 'Kodchasan',
              ),
            ),
          ],
        ),
      ),
    );
  }

  description(String details) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Text(
        details,
        style: greyColor10LightTextStyle,
      ),
    );
  }
}
