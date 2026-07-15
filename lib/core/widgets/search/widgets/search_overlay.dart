import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/search/cubit/search_cubit.dart';
import 'package:ka3da/core/widgets/search/cubit/search_state.dart';
import 'package:ka3da/core/widgets/search/models/searchable.dart';

class SearchOverlay<T extends Searchable> extends StatelessWidget {
  const SearchOverlay({
    super.key,
    required this.layerLink,
    required this.controller,
    required this.overlayController,
    required this.itemBuilder,
    required this.onItemTap,
  });

  final LayerLink layerLink;
  final TextEditingController controller;
  final OverlayPortalController overlayController;

  final Widget Function(BuildContext context, T item) itemBuilder;
  final void Function(T item) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        targetAnchor: Alignment.bottomLeft,
        followerAnchor: Alignment.topLeft,
        offset: const Offset(0, 8),
        child: Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: BlocBuilder<SearchCubit<T>, SearchState<T>>(
              builder: (context, state) {
                final cubit = context.read<SearchCubit<T>>();

                final isRecent = controller.text.trim().isEmpty;

                final recent = state.recent;
                final suggestions = state.suggestions;

                final isEmpty = isRecent ? recent.isEmpty : suggestions.isEmpty;

                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450.h),
                  child: Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: const Color(0xffF5E8DF)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.14),
                          blurRadius: 35,
                          spreadRadius: 3,
                          offset: const Offset(0, 18),
                        ),
                      ],
                    ),
                    child: isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: AppColors.primary
                                      .withOpacity(.08),
                                  child: Icon(
                                    Icons.search_off_rounded,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  isRecent
                                      ? "No Recent Searches"
                                      : "No Results Found",
                                  style: AppTextStyles.captionMedium,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isRecent)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    18,
                                    16,
                                    18,
                                    12,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.history,
                                        color: AppColors.primary,
                                        size: 16.sp,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Recent Searches",
                                        style: AppTextStyles.captionlarge,
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: cubit.clearRecent,
                                        child: Text(
                                          "Clear All",
                                          style: AppTextStyles.captionMedium
                                              .copyWith(
                                                color: AppColors.primary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Flexible(
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: isRecent
                                      ? recent.length
                                      : suggestions.length,
                                  separatorBuilder: (_, __) => Divider(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  itemBuilder: (_, index) {
                                    if (isRecent) {
                                      final query = recent[index];

                                      return ListTile(
                                        leading: const Icon(
                                          Icons.history_rounded,
                                        ),
                                        title: Text(query),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            cubit.removeRecent(query);
                                          },
                                        ),
                                        onTap: () {
                                          controller.text = query;

                                          cubit.search(query);

                                          overlayController.hide();

                                          FocusScope.of(context).unfocus();
                                        },
                                      );
                                    }

                                    final item = suggestions[index];

                                    return InkWell(
                                      onTap: () {
                                        controller.text = item.title;

                                        cubit.selectSuggestion(item);

                                        overlayController.hide();

                                        FocusScope.of(context).unfocus();

                                        onItemTap(item);
                                      },
                                      child: itemBuilder(context, item),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
