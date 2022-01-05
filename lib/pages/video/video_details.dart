import 'package:chewie/chewie.dart';
import 'package:news/pages/screens.dart';
import 'package:news/widget/column_builder.dart';
import 'package:video_player/video_player.dart';

class VideoDetails extends StatefulWidget {
  final String title;
  const VideoDetails({Key key, this.title}) : super(key: key);

  @override
  _VideoDetailsState createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  bool like = false;
  ChewieController chewieController;

  final recommendedVideoList = [
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
  ];

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController:
          VideoPlayerController.asset('assets/video/video.mp4'),
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: whiteColor13MediumTextStyle,
            ),
          ),
        );
      },
      overlay: Padding(
        padding: const EdgeInsets.fromLTRB(
          fixPadding * 2.0,
          fixPadding * 1.5,
          fixPadding * 2.0,
          0.0,
        ),
        child: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          style: primaryColor12SemiBoldTextStyle,
        ),
      ),
      materialProgressColors: ChewieProgressColors(
        playedColor: whiteColor,
        handleColor: whiteColor,
        backgroundColor: primaryColor,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
    chewieController.videoPlayerController.dispose();
  }

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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: Chewie(
              controller: chewieController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding),
            child: Text(
              widget.title,
              style: primaryColor14SemiBoldTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
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
                details(title: '10Comments', icon: Icons.comment_outlined),
                widthSpace,
                widthSpace,
                widthSpace,
                widthSpace,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          like = !like;
                        });
                      },
                      child: Icon(
                        like ? Icons.thumb_up : Icons.thumb_up_outlined,
                        size: 15,
                        color: like ? primaryColor : greyColor,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '1159',
                      style: greyColor10RegularTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          divider(),
          description(
              'Lorem Ipsum is simply dummy text of the printing and type set- ting industry. Lorem Ipsum has been the industry\'s standar standard du dummy text ever since the 1500s, when an.'),
          description(
              'It has survived not only five centuries, but also the leap in into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheet sheets coi containing Lorem Ipsum passages, and more recently with desk desktop publishing software like Aldus PageMaker including ve versions of Lorem Ipsum.'),
          description(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sei sed do eiusmod tempor incididunt ut labore et dolore magna.'),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding),
            child: Text(
              'Recommended for you',
              style: primaryColor14SemiBoldTextStyle,
            ),
          ),
          recommendedList(),
        ],
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

  description(String description) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '         $description',
              style: greyColor11RegularTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  recommendedList() {
    return ColumnBuilder(
      itemCount: recommendedVideoList.length,
      itemBuilder: (context, index) {
        final item = recommendedVideoList[index];
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
                  ],
                ),
              ],
            ),
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
