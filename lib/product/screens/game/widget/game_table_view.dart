part of '../game_view.dart';

class GameTableView extends GetView<GameController> {
  const GameTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Obx(
          () => controller.displayXO.isNotEmpty
              ? GridView.builder(
                  itemCount: controller.displayXO.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => controller.tapped(index),
                      child: GameTableCard(controller: controller, index: index),
                    );
                  })
              : const SizedBox(),
        ));
  }
}

class GameTableCard extends StatelessWidget {
  const GameTableCard({super.key, required this.controller, required this.index});

  final GameController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingLow,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.circularSizeMediumValueRadius(),
        border: Border.all(width: 2, color: AppColors.primaryColor),
      ),
      child: Center(
        child: Text(
          controller.displayXO[index],
          style: const TextStyle(
            fontSize: 64,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
