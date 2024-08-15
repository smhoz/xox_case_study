part of '../home_view.dart';

class HomeGamesList extends GetView<HomeController> {
  const HomeGamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.gameDatas.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.gameDatas.length,
            itemBuilder: (context, index) {
              GameData gameData = controller.gameDatas[index];
              return HomeGameCard(gameData: gameData);
            },
          )
        : const SizedBox());
  }
}

class HomeGameCard extends GetView<HomeController> with HomeDialog {
  const HomeGameCard({super.key, required this.gameData});

  final GameData gameData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (((controller.userModel?.name ?? "").isEmpty)) {
          nameShowDialog(context, controller);
          return;
        } else {
          Get.toNamed(Routes.game, arguments: {"gameData": gameData});
        }
      },
      child: Container(
        padding: context.paddingMedium,
        margin: context.paddingLow,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: AppBorderRadius.circularSizeMediumValueRadius()),
        child: Column(
          children: [
            Text("${gameData.name}", style: context.textTheme.titleLarge),
            const AppSizedBox.onlyMediumHeightSizedBox(),
            Text("Oyundaki Kişi Sayısı: ${gameData.users?.length}", style: context.textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
