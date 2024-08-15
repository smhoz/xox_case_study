part of '../game_view.dart';

class GamePlayerText extends GetView<GameController> {
  const GamePlayerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.users.length,
          itemBuilder: (context, index) =>
              Text("Player $index : ${controller.users[index]}", style: context.textTheme.titleLarge),
        ),
      ),
    );
  }
}
