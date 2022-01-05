import 'package:news/pages/screens.dart';

class Category extends StatelessWidget {
  Category({Key key}) : super(key: key);

  final categoryList = [
    {
      'image': 'assets/category/world.png',
      'category': 'WORLD',
    },
    {
      'image': 'assets/category/entertainment.png',
      'category': 'Entertainment',
    },
    {
      'image': 'assets/category/technology.png',
      'category': 'Technology',
    },
    {
      'image': 'assets/category/health.png',
      'category': 'Health',
    },
    {
      'image': 'assets/category/business.png',
      'category': 'Business',
    },
    {
      'image': 'assets/category/travel.png',
      'category': 'Travel',
    },
    {
      'image': 'assets/category/food.png',
      'category': 'Food',
    },
    {
      'image': 'assets/category/science.png',
      'category': 'Science',
    },
    {
      'image': 'assets/category/sports.png',
      'category': 'Sports',
    },
    {
      'image': 'assets/category/other.png',
      'category': 'Other',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Category',
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
      body: category(),
    );
  }

  category() {
    return GridView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
      ),
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        final item = categoryList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding,
            index % 2 == 0 ? fixPadding : fixPadding * 2.0,
            fixPadding,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TopNews()),
            ),
            child: Container(
              padding: const EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: primaryColor.withOpacity(0.1),
                    blurRadius: 1.5,
                    spreadRadius: 1.5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    item['image'],
                    height: 50.0,
                    width: 50.0,
                  ),
                  heightSpace,
                  Text(
                    item['category'].toUpperCase(),
                    style: primaryColor14BoldTextStyle,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
