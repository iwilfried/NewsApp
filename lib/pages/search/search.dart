import 'package:news/pages/screens.dart';
import 'package:news/widget/column_builder.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();
  bool search = false;

  final recentSearchList = [
    {'search': 'Ronaldo'},
    {'search': 'COVID-19'},
    {'search': 'Test Ind - Aus'},
    {'search': 'Current affairs'},
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
        children: [
          searchTextField(),
          title(),
          recentSearchList.isEmpty ? noRecentSearch() : recentSearch(),
        ],
      ),
    );
  }

  noRecentSearch() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        const Icon(
          Icons.history,
          color: greyColor,
          size: 60.0,
        ),
        heightSpace,
        heightSpace,
        Text(
          'Recent search history is empty',
          style: greyColor13MediumTextStyle,
        ),
      ],
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
        onChanged: (value) {
          setState(() {
            searchController.text.isEmpty ? search = false : search = true;
          });
        },
        style: primaryColor14SemiBoldTextStyle,
        controller: searchController,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          hintText: 'Search News',
          hintStyle: greyColor11RegularTextStyle,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: InkWell(
            onTap: () {
              if (search) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchResult(search: searchController.text),
                  ),
                );
              }
            },
            child: Icon(
              search ? Icons.search : Icons.close,
              color: greyColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  title() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding / 2,
        fixPadding * 2.0,
        fixPadding * 1.5,
      ),
      child: Text(
        'Recent Searches',
        style: primaryColor13MediumTextStyle,
      ),
    );
  }

  recentSearch() {
    return ColumnBuilder(
      itemCount: recentSearchList.length,
      itemBuilder: (context, index) {
        final item = recentSearchList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResult(search: item['search']),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: greyColor,
                      size: 15,
                    ),
                    widthSpace,
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Text(
                        item['search'],
                        style: greyColor13MediumTextStyle,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          recentSearchList.removeAt(index);
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: greyColor,
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ),
              divider(),
            ],
          ),
        );
      },
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.only(bottom: fixPadding * 1.5, top: 8.0),
      color: greyColor.withOpacity(0.3),
      height: 1.0,
      width: double.infinity,
    );
  }
}
