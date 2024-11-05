import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginatedGridViewWidget extends StatefulWidget {
  const PaginatedGridViewWidget({
    super.key,
    required this.items,
    required this.onPageChanged,
    required this.isFetchingData,
    required this.hasReachedToMax,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 20,
    this.childAspectRatio = 0.8,
  });
  final List<Widget> items;
  final Function(int) onPageChanged;
  final bool isFetchingData;
  final bool hasReachedToMax;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double childAspectRatio;

  @override
  State<PaginatedGridViewWidget> createState() =>
      _PaginatedGridViewWidgetState();
}

class _PaginatedGridViewWidgetState extends State<PaginatedGridViewWidget> {
  final scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!widget.isFetchingData && !widget.hasReachedToMax) {
          page++;
          widget.onPageChanged(page);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: widget.crossAxisSpacing,
        childAspectRatio: widget.childAspectRatio,
        mainAxisSpacing: 20,
      ),
      padding: EdgeInsets.all(20.w),
      itemBuilder: (context, index) => widget.items[index],
      itemCount: widget.items.length,
    );
  }
}
