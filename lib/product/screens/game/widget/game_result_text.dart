part of '../game_view.dart';
class _ResultText extends StatelessWidget {
  const _ResultText({
    super.key,
    required this.controller,
  });

  final GameController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(controller.resultDeclaration,
                style: context.textTheme.headlineLarge?.copyWith(color: AppColors.primaryColor)),
          )
        ],
      ),
    );
  }
}