import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/Presentation/screens/all_news_view.dart';
import 'package:news_app_new_training/Presentation/widgets/build_breaking_news.dart';
import 'package:news_app_new_training/Presentation/widgets/build_new_recommendation.dart';
import 'package:news_app_new_training/Presentation/widgets/custom_appbar.dart';
import 'package:news_app_new_training/Presentation/widgets/custom_heding_widget.dart';
import 'package:news_app_new_training/logic/cubit/cubit/breaking_news_cubit.dart';
import 'package:news_app_new_training/logic/cubit/news/news_cubit.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  Future<void> _refreshContent() async {
    BlocProvider.of<BreakingNewsCubit>(context).getBreakingNews();
    BlocProvider.of<NewsCubit>(context).getNews();
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshContent,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(height: 20),
              CustomHedingWeidget(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AllNewsView();
                  }));
                },
                text: 'أخبار عاجلة',
              ),
              const SizedBox(height: 15),
              buildBreakingNews(),
              const SizedBox(height: 25),
              CustomHedingWeidget(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AllNewsView();
                  }));
                },
                text: 'المقترح',
              ),
              const SizedBox(height: 20),
              buildNewsRecommendations(),
            ],
          ),
        ),
      ),
    );
  }
}
