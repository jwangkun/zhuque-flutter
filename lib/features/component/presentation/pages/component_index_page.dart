import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';
import 'package:zhuque_flutter_demo/features/index/presentation/widgets/feature_card.dart';

/// 组件演示首页
class ComponentIndexPage extends StatelessWidget {
  const ComponentIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组件'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 基础组件
            Text(
              '基础组件',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: 16),

            FeatureCard(
              title: '表单',
              description: '输入框、选择器、开关等表单组件，支持验证和自定义样式',
              icon: Icons.edit_note,
              route: '/component/form',
              color: AppColors.primary,
            ),
            const SizedBox(height: 12),

            FeatureCard(
              title: '导航',
              description: '导航栏、标签页、面包屑、步骤条等导航组件',
              icon: Icons.navigation,
              route: '/component/navigation',
              color: AppColors.secondary,
            ),
            const SizedBox(height: 12),

            FeatureCard(
              title: '数据展示',
              description: '列表、卡片、表格、图表等数据展示组件',
              icon: Icons.table_chart,
              route: '/component/data-display',
              color: AppColors.success,
            ),
            const SizedBox(height: 12),

            // 反馈组件
            const SizedBox(height: 24),
            Text(
              '反馈组件',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: 16),

            FeatureCard(
              title: '提示',
              description: '消息提示、确认对话框、通知提醒等反馈组件',
              icon: Icons.notifications,
              route: '/component/feedback',
              color: AppColors.warning,
            ),
            const SizedBox(height: 12),

            FeatureCard(
              title: '加载',
              description: '加载动画、骨架屏、进度条等加载状态组件',
              icon: Icons.refresh,
              route: '/component/loading',
              color: AppColors.danger,
            ),
            const SizedBox(height: 12),

            // 其他组件
            const SizedBox(height: 24),
            Text(
              '其他组件',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: 16),

            FeatureCard(
              title: '弹出层',
              description: '模态框、弹出菜单、下拉选择等弹出层组件',
              icon: Icons.layers,
              route: '/component/overlay',
              color: AppColors.info,
            ),
            const SizedBox(height: 12),

            FeatureCard(
              title: '布局',
              description: '栅格系统、分割线、间距等布局相关组件',
              icon: Icons.dashboard,
              route: '/component/layout',
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}