import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 布局组件演示页面
class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '栅格系统'),
            const SizedBox(height: 16),
            _buildGridSystem(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '分割线'),
            const SizedBox(height: 16),
            _buildDividers(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '间距系统'),
            const SizedBox(height: 16),
            _buildSpacingSystem(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '对齐方式'),
            const SizedBox(height: 16),
            _buildAlignmentSystem(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '响应式布局'),
            const SizedBox(height: 16),
            _buildResponsiveLayout(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '布局容器'),
            const SizedBox(height: 16),
            _buildLayoutContainers(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildGridSystem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础栅格'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildGridItem('1/2', AppColors.primary)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildGridItem('1/2', AppColors.secondary)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _buildGridItem('1/3', AppColors.success)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildGridItem('1/3', AppColors.warning)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildGridItem('1/3', AppColors.danger)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(flex: 1, child: _buildGridItem('1/4', AppColors.info)),
                    const SizedBox(width: 8),
                    Expanded(flex: 2, child: _buildGridItem('2/4', AppColors.primary)),
                    const SizedBox(width: 8),
                    Expanded(flex: 1, child: _buildGridItem('1/4', AppColors.secondary)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('响应式栅格'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    children: [
                      Expanded(flex: 2, child: _buildGridItem('大屏主内容', AppColors.primary)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildGridItem('大屏侧边栏', AppColors.secondary)),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildGridItem('小屏主内容', AppColors.primary),
                      const SizedBox(height: 8),
                      _buildGridItem('小屏侧边栏', AppColors.secondary),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDividers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础分割线'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('上方内容'),
                const Divider(),
                const Text('下方内容'),
                const SizedBox(height: 16),
                const Text('左侧内容'),
                const Divider(),
                const Text('右侧内容'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('自定义分割线'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('自定义颜色分割线'),
                Divider(color: AppColors.primary, thickness: 2),
                const Text('自定义粗细分割线'),
                Divider(color: Colors.grey.shade300, thickness: 4),
                const Text('自定义间距分割线'),
                const SizedBox(height: 16),
                Divider(color: Colors.grey.shade200, thickness: 1),
                const SizedBox(height: 16),
                const Text('带文字的分割线'),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '或',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                const Text('垂直分割线'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildGridItem('左侧', AppColors.success)),
                    VerticalDivider(color: Colors.grey.shade300, thickness: 1),
                    Expanded(child: _buildGridItem('右侧', AppColors.warning)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpacingSystem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('间距大小'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSpacingItem('XS (4px)', 4, AppColors.primary),
                _buildSpacingItem('SM (8px)', 8, AppColors.secondary),
                _buildSpacingItem('MD (16px)', 16, AppColors.success),
                _buildSpacingItem('LG (24px)', 24, AppColors.warning),
                _buildSpacingItem('XL (32px)', 32, AppColors.danger),
                _buildSpacingItem('XXL (48px)', 48, AppColors.info),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('间距应用'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('紧凑间距'),
                      const SizedBox(height: 4),
                      const Text('内容之间的间距较小'),
                      const SizedBox(height: 4),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('按钮'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('宽松间距'),
                      const SizedBox(height: 16),
                      const Text('内容之间的间距较大'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('按钮'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlignmentSystem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('水平对齐'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildAlignmentItem('左对齐', AppColors.primary),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAlignmentItem('居中对齐', AppColors.secondary),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildAlignmentItem('右对齐', AppColors.success),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAlignmentItem('左', AppColors.warning),
                      _buildAlignmentItem('中', AppColors.danger),
                      _buildAlignmentItem('右', AppColors.info),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('垂直对齐'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildVerticalAlignmentItem('顶部对齐', AppColors.primary)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _buildVerticalAlignmentItem('居中对齐', AppColors.secondary)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: _buildVerticalAlignmentItem('底部对齐', AppColors.success)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResponsiveLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('断点响应式'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Text(
                      '当前屏幕宽度: ${constraints.maxWidth.toStringAsFixed(0)}px',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    if (constraints.maxWidth > 600)
                      Row(
                        children: [
                          Expanded(child: _buildResponsiveItem('大屏布局', AppColors.primary)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildResponsiveItem('大屏布局', AppColors.secondary)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildResponsiveItem('大屏布局', AppColors.success)),
                        ],
                      )
                    else
                      Column(
                        children: [
                          _buildResponsiveItem('小屏布局', AppColors.primary),
                          const SizedBox(height: 12),
                          _buildResponsiveItem('小屏布局', AppColors.secondary),
                          const SizedBox(height: 12),
                          _buildResponsiveItem('小屏布局', AppColors.success),
                        ],
                      ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('自适应组件'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildAdaptiveChip('自适应标签', constraints.maxWidth),
                    _buildAdaptiveChip('响应式组件', constraints.maxWidth),
                    _buildAdaptiveChip('弹性布局', constraints.maxWidth),
                    _buildAdaptiveChip('流式布局', constraints.maxWidth),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLayoutContainers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('布局容器'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Container 容器'),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(child: Text('SizedBox 固定尺寸')),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(child: Text('Expanded 弹性尺寸')),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 60,
                    maxHeight: 120,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.warning.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('ConstrainedBox 约束尺寸')),
                  ),
                ),
                const SizedBox(height: 16),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.danger.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('AspectRatio 固定比例')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSpacingItem(String label, double size, Color color) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(size / 4),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text('${size.toStringAsFixed(0)}px'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAlignmentItem(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildVerticalAlignmentItem(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildResponsiveItem(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildAdaptiveChip(String text, double maxWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: maxWidth > 400 ? 16 : 12,
        vertical: maxWidth > 400 ? 8 : 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(maxWidth > 400 ? 16 : 12),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: maxWidth > 400 ? 14 : 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}