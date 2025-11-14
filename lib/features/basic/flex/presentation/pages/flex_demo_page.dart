import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// Flex布局演示组件
class FlexDemoPage extends StatelessWidget {
  const FlexDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex布局'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '基础Flex布局'),
            const SizedBox(height: 16),
            _buildBasicFlex(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '主轴对齐'),
            const SizedBox(height: 16),
            _buildMainAxisAlignment(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '交叉轴对齐'),
            const SizedBox(height: 16),
            _buildCrossAxisAlignment(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '弹性比例'),
            const SizedBox(height: 16),
            _buildFlexRatio(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '方向布局'),
            const SizedBox(height: 16),
            _buildDirectionLayout(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '实际应用场景'),
            const SizedBox(height: 16),
            _buildRealWorldExamples(context),
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

  Widget _buildBasicFlex(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Row 水平布局'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildFlexItem('项目1', AppColors.primary),
              const SizedBox(width: 8),
              _buildFlexItem('项目2', AppColors.secondary),
              const SizedBox(width: 8),
              _buildFlexItem('项目3', AppColors.success),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Column 垂直布局'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildFlexItem('项目A', AppColors.warning),
              const SizedBox(height: 8),
              _buildFlexItem('项目B', AppColors.danger),
              const SizedBox(height: 8),
              _buildFlexItem('项目C', AppColors.info),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainAxisAlignment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('MainAxisAlignment.start'),
        const SizedBox(height: 8),
        _buildAlignmentDemo(MainAxisAlignment.start),
        const SizedBox(height: 16),
        const Text('MainAxisAlignment.center'),
        const SizedBox(height: 8),
        _buildAlignmentDemo(MainAxisAlignment.center),
        const SizedBox(height: 16),
        const Text('MainAxisAlignment.end'),
        const SizedBox(height: 8),
        _buildAlignmentDemo(MainAxisAlignment.end),
        const SizedBox(height: 16),
        const Text('MainAxisAlignment.spaceBetween'),
        const SizedBox(height: 8),
        _buildAlignmentDemo(MainAxisAlignment.spaceBetween),
        const SizedBox(height: 16),
        const Text('MainAxisAlignment.spaceAround'),
        const SizedBox(height: 8),
        _buildAlignmentDemo(MainAxisAlignment.spaceAround),
      ],
    );
  }

  Widget _buildCrossAxisAlignment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('CrossAxisAlignment.start'),
        const SizedBox(height: 8),
        _buildCrossAlignmentDemo(CrossAxisAlignment.start),
        const SizedBox(height: 16),
        const Text('CrossAxisAlignment.center'),
        const SizedBox(height: 8),
        _buildCrossAlignmentDemo(CrossAxisAlignment.center),
        const SizedBox(height: 16),
        const Text('CrossAxisAlignment.end'),
        const SizedBox(height: 8),
        _buildCrossAlignmentDemo(CrossAxisAlignment.end),
        const SizedBox(height: 16),
        const Text('CrossAxisAlignment.stretch'),
        const SizedBox(height: 8),
        _buildCrossAlignmentDemo(CrossAxisAlignment.stretch),
      ],
    );
  }

  Widget _buildFlexRatio(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('等比例分配'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(child: _buildFlexItem('1:1:1', AppColors.primary)),
              const SizedBox(width: 8),
              Expanded(child: _buildFlexItem('1:1:1', AppColors.secondary)),
              const SizedBox(width: 8),
              Expanded(child: _buildFlexItem('1:1:1', AppColors.success)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('不等比例分配'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(flex: 1, child: _buildFlexItem('1', AppColors.warning)),
              const SizedBox(width: 8),
              Expanded(flex: 2, child: _buildFlexItem('2', AppColors.danger)),
              const SizedBox(width: 8),
              Expanded(flex: 3, child: _buildFlexItem('3', AppColors.info)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Flex组件'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Flexible(flex: 1, child: _buildFlexItem('Flexible 1', AppColors.primary)),
              const SizedBox(width: 8),
              Flexible(flex: 2, child: _buildFlexItem('Flexible 2', AppColors.secondary)),
              const SizedBox(width: 8),
              Flexible(flex: 1, child: _buildFlexItem('Flexible 1', AppColors.success)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDirectionLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Row - 水平方向'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              _buildFlexItem('左→右1', AppColors.primary),
              const SizedBox(width: 8),
              _buildFlexItem('左→右2', AppColors.secondary),
              const SizedBox(width: 8),
              _buildFlexItem('左→右3', AppColors.success),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Row - RTL 方向'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              _buildFlexItem('右→左1', AppColors.warning),
              const SizedBox(width: 8),
              _buildFlexItem('右→左2', AppColors.danger),
              const SizedBox(width: 8),
              _buildFlexItem('右→左3', AppColors.info),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('Column - 垂直方向'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              _buildFlexItem('上→下1', AppColors.primary),
              const SizedBox(height: 8),
              _buildFlexItem('上→下2', AppColors.secondary),
              const SizedBox(height: 8),
              _buildFlexItem('上→下3', AppColors.success),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRealWorldExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('卡片布局'),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, size: 40, color: AppColors.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '产品标题',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '这是产品的描述信息，可以包含多行文本内容。',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '¥299.00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.danger,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('购买'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('底部导航'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, '首页', true),
              _buildNavItem(Icons.widgets, '组件', false),
              _buildNavItem(Icons.add_circle, '发布', false, isLarge: true),
              _buildNavItem(Icons.notifications, '消息', false),
              _buildNavItem(Icons.person, '我的', false),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('表单布局'),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '姓',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '名',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: '邮箱',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '城市',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '邮编',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlexItem(String text, Color color) {
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

  Widget _buildAlignmentDemo(MainAxisAlignment alignment) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          _buildFlexItem('A', AppColors.primary),
          const SizedBox(width: 8),
          _buildFlexItem('B', AppColors.secondary),
          const SizedBox(width: 8),
          _buildFlexItem('C', AppColors.success),
        ],
      ),
    );
  }

  Widget _buildCrossAlignmentDemo(CrossAxisAlignment alignment) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: alignment,
        children: [
          _buildFlexItem('A', AppColors.warning),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.danger.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.danger.withOpacity(0.3)),
            ),
            child: Text(
              'B\n多行\n文本',
              style: TextStyle(
                color: AppColors.danger,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildFlexItem('C', AppColors.info),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String text, bool selected, {bool isLarge = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: selected ? AppColors.primary : Colors.grey,
          size: isLarge ? 32 : 24,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: selected ? AppColors.primary : Colors.grey,
            fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}