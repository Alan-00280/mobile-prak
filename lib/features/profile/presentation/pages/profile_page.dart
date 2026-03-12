import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/core/widgets/common_widgets.dart';
import 'package:hello_flutter/features/profile/presentation/providers/profile_provider.dart';
import 'package:hello_flutter/features/profile/presentation/widgets/profile_widget.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Profile'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(profileNotifierProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: profileState.when(
        // State: Loading
        loading: () => const LoadingWidget(),

        // State: Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data profile: ${error.toString()}',
          onRetry: () {
            ref.read(profileNotifierProvider.notifier).refresh();
          },
        ),

        // State: Data
        data: (profileList) {
          return ProfileListView(
            profileList: profileList,
            onRefresh: () {
              ref.invalidate(profileNotifierProvider);
            },
            useModernCard: true, // Set to false for simple card
          );
        },
      ),
    );
  }
}
