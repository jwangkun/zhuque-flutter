import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';
import 'package:zhuque_flutter_demo/app/router/app_router.dart';
import '../widgets/feature_card.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('朱雀UI Flutter'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头部标题
              Text(
                '基础组件',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
              ),
              const SizedBox(height: 16),

              // 基础组件列表
              FeatureCard(
                title: '配色',
                description: '展示朱雀UI的完整配色体系，包含主色调、辅助色、功能色和中性色',
                icon: Icons.color_lens,
                route: AppRoutes.color,
                color: AppColors.primary,
              ),
              const SizedBox(height: 12),

              FeatureCard(
                title: '图标',
                description: '700+风格统一的图标展示，支持搜索和分类浏览',
                icon: Icons.emoji_emotions,
                route: AppRoutes.icon,
                color: AppColors.secondary,
              ),
              const SizedBox(height: 12),

              FeatureCard(
                title: '按钮',
                description: '多种按钮样式，包括基础按钮、边框按钮、虚线按钮、文字按钮等',
                icon: Icons.smart_button,
                route: AppRoutes.button,
                color: AppColors.success,
              ),
              const SizedBox(height: 12),

              FeatureCard(
                title: '字体',
                description: '字体样式展示，包括标题、正文、说明文字等字体规范',
                icon: Icons.text_fields,
                route: AppRoutes.typography,
                color: AppColors.warning,
              ),
              const SizedBox(height: 12),

              FeatureCard(
                title: '边框',
                description: '各种边框样式，包括实线、虚线、圆角、阴影等',
                icon: Icons.border_style,
                route: AppRoutes.border,
                color: AppColors.danger,
              ),
              const SizedBox(height: 12),

              FeatureCard(
                title: '阴影',
                description: '阴影效果展示，包括不同层级的阴影深度',
                icon: Icons.layers,
                route: AppRoutes.shadow,
                color: AppColors.info,
              ),
              const SizedBox(height: 12),

              FeatureCard(
                title: '布局',
                description: 'Flex布局示例，展示弹性盒子布局的各种用法',
                icon: Icons.view_comfy,
                route: AppRoutes.flex,
                color: AppColors.primary,
              ),
              const SizedBox(height: 12),

              FeatureCard(
                title: '标题',
                description: '标题组件演示，包括不同层级的标题样式',
                icon: Icons.title,
                route: AppRoutes.title,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
