import 'package:flutter/material.dart';

class PaginatedListViewWidget extends StatefulWidget {
  const PaginatedListViewWidget({
    super.key,
    required this.items,
    required this.onPageChanged,
    required this.isFetchingData,
    required this.hasReachedToMax,
  });

  final List<Widget> items;
  final Function(int) onPageChanged;
  final bool isFetchingData;
  final bool hasReachedToMax;

  @override
  State<PaginatedListViewWidget> createState() =>
      _PaginatedListViewWidgetState();
}

class _PaginatedListViewWidgetState extends State<PaginatedListViewWidget> {
  final scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!widget.isFetchingData && !widget.hasReachedToMax) {
          page = page + 1;

          widget.onPageChanged(page);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return widget.items[index];
      },
    );
  }
}
