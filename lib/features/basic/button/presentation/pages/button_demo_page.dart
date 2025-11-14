import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 按钮演示组件
class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('按钮'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '基础按钮'),
            const SizedBox(height: 16),
            _buildBasicButtons(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '按钮尺寸'),
            const SizedBox(height: 16),
            _buildButtonSizes(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '按钮状态'),
            const SizedBox(height: 16),
            _buildButtonStates(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '图标按钮'),
            const SizedBox(height: 16),
            _buildIconButtons(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '按钮组'),
            const SizedBox(height: 16),
            _buildButtonGroups(context),
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

  Widget _buildBasicButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('主要按钮'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('主要按钮'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
              ),
              child: const Text('辅色按钮'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
              ),
              child: const Text('成功按钮'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warning,
              ),
              child: const Text('警告按钮'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
              ),
              child: const Text('危险按钮'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text('次要按钮'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text('次要按钮'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.secondary,
              ),
              child: const Text('辅色边框'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text('文字按钮'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('文字按钮'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: AppColors.secondary,
              ),
              child: const Text('辅色文字'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonSizes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('大按钮'),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('大按钮'),
          ),
        ),
        const SizedBox(height: 16),
        const Text('中按钮（默认）'),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('中按钮'),
          ),
        ),
        const SizedBox(height: 16),
        const Text('小按钮'),
        const SizedBox(height: 12),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('小按钮'),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('小边框'),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('小文字'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonStates(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('正常状态'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('正常'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('正常'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('正常'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('禁用状态'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: null,
              child: const Text('禁用'),
            ),
            OutlinedButton(
              onPressed: null,
              child: const Text('禁用'),
            ),
            TextButton(
              onPressed: null,
              child: const Text('禁用'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('加载状态'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 8),
                  Text('加载中'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('图标按钮'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('图标文字按钮'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('下载'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.upload),
              label: const Text('上传'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text('保存'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonGroups(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('按钮组合'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('取消'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('确定'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('分段按钮'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                      ),
                    ),
                  ),
                  child: const Text('选项一'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('选项二'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('选项三'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}