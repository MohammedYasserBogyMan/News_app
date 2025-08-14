import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_new_training/Presentation/screens/news_detils_view.dart';
import 'package:news_app_new_training/Presentation/widgets/news_image_text_shado.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSliderImage extends StatefulWidget {
  const CustomSliderImage({
    super.key,
    required this.newsList,
  });
  final List<NewsModel> newsList;

  @override
  State<CustomSliderImage> createState() => _CustomSliderImageState();
}

class _CustomSliderImageState extends State<CustomSliderImage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              final int index = activeIndex; // استخدام activeIndex
              final NewsModel newsItem = widget.newsList[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetilsView(newsitem: newsItem),
                ),
              );
            },
            child: CarouselSlider.builder(
              itemCount: widget.newsList.length > 7
                  ? 7
                  : widget.newsList.length, // عرض 7 عناصر كحد أقصى
              itemBuilder: (context, index, realIndex) {
                final urlImage =
                    widget.newsList[index].image; // الحصول على صورة الخبر
                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 200,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index; // تحديث activeIndex عند تغيير الصفحة
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 12,
          dotColor: Colors.blue.withOpacity(0.2),
          activeDotColor: Colors.blue[300]!,
        ),
        activeIndex: activeIndex,
        count: widget.newsList.length > 7
            ? 7
            : widget.newsList.length, // عرض 7 عناصر كحد أقصى
      );
  Widget buildImage(String? urlImage, int index) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Stack(
        children: [
          Image.network(
            urlImage ??
                'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
            fit: BoxFit.cover, // استخدم BoxFit.cover
            width: double.infinity,
            height: double.infinity, // تأكد من تحديد العرض والارتفاع
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return Image.network(
                'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
                fit: BoxFit.cover, // استخدم BoxFit.cover أيضًا هنا
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),
          const Positioned(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: newsTextImageShado(),
          ),
          Positioned(
            bottom: 25,
            right: 25,
            child: SizedBox(
              width: 240,
              child: Text(
                widget.newsList[index].titel ?? 'لا يوجد عنوان متاح',
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: const Offset(3, 3),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
