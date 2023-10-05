import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_app/data/models/user_model.dart';
import 'package:voco_app/data/services/user_list_service.dart';
import 'package:voco_app/screens/home/widgets/profile_card_widget.dart';
import 'package:voco_app/screens/login/login_controller.dart';

final userListProvider = FutureProvider<List<UserData>>((ref) async {
  final userListService = UserListService();
  return await userListService.getAllUsers();
});

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListAsyncValue = ref.watch(userListProvider);
    final loginController = ref.read(loginControllerProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Katılımcılar Listesi'),
        actions: [
          IconButton(
              onPressed: () async {
                await loginController.logout(context);
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: userListAsyncValue.when(
        data: (userDataList) {
          return ListView.builder(
            itemCount: userDataList.length,
            itemBuilder: (context, index) {
              final userData = userDataList[index];
              return ProfileCardWidget(userData: userData);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return Center(
            child: Text('Veriler yüklenirken bir hata oluştu: $error'),
          );
        },
      ),
    );
  }
}
