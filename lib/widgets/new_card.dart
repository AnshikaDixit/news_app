import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/utils/app_text_style.dart';
import 'package:news_app/widgets/spacing.dart';

class NewsCard extends StatefulWidget {
  final String? title;
  final String? description;
  final String? img;
  final String? timeAgo; 
  const NewsCard({
    super.key, 
    required this.title, 
    required this.description, 
    required this.img, 
    required this.timeAgo
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  String getTimeAgo(String publishedAt) {
    DateTime publishedDate = DateTime.parse(publishedAt);
    return timeago.format(publishedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0, right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? "news_title",
                      style: AppTextStyles.bold,
                    ),
                    10.ph,
                    Text(
                      widget.description ?? "news_description",
                      style: AppTextStyles.regular,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    10.ph,
                    Text(
                      // Call getTimeAgo method to convert timeAgo to "time ago" format
                      widget.timeAgo != null ? getTimeAgo(widget.timeAgo!) : "Unknown",
                      style: AppTextStyles.regular.copyWith(color: kcGreyColor, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.img ?? "https://via.placeholder.com/150",
                fit: BoxFit.fill,
                height: 100,
                width: 100, 
              ),
            ),
            10.pw,
          ],
        ),
      ),
    );
  }
}
