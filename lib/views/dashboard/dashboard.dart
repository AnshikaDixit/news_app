import 'dart:math';
import 'package:flutter/material.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/utils/app_text_style.dart';
import 'package:news_app/widgets/new_card.dart';
import 'package:news_app/widgets/spacing.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = "dashboard_screen";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedCountry = "US";// Default selected value

  // Map of countries and their abbreviations
  final Map<String, String> countryMap = {
    'USA': 'US',
    'India': 'IN',
    'UK': 'GB',
    'Canada': 'CA',
  };

  @override
  void initState() {
    super.initState();
    // Fetch the initial news for the default country (India)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false)
          .fetchNews(selectedCountry);
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        automaticallyImplyLeading: false,
        title: Text(AppStrings.appNameMyNews,
            textAlign: TextAlign.left,
            style: AppTextStyles.bold.copyWith(color: Colors.white)),
        actions: [
          Row(
            children: [
              Transform.rotate(
                angle: pi / 4, // Rotate by 45 degrees (pi / 4 radians)
                child: const Icon(
                  Icons.navigation,
                  color: Colors.white,
                  size: 17,
                ),
              ),
              5.pw,
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: DropdownButton<String>(
                  value: selectedCountry,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                      newsProvider.fetchNews(selectedCountry);
                    });
                  },
                  underline: Container(color: kcPrimaryColor),
                  icon: const SizedBox.shrink(),
                  items: countryMap.entries.map<DropdownMenuItem<String>>(
                      (MapEntry<String, String> entry) {
                    return DropdownMenuItem<String>(
                      value: entry.value,

                      child: Text(
                        entry.value, 
                        style: const TextStyle(
                            color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: newsProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            :Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          AppStrings.topHeadlines,
                          style: AppTextStyles.bold
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: newsProvider.articles.length,
                          itemBuilder: (context, index) {
                            final article = newsProvider.articles[index];
                            return NewsCard(
                              title: article['source']['name'] ?? "Unknown",
                              description: article['description'] ?? "",
                              img: article['urlToImage'] ??
                                  "https://via.placeholder.com/150",
                              timeAgo: article['publishedAt'] ?? "Unknown",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
