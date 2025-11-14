import 'package:flutter/material.dart';

/// 图标演示组件
class IconDemoPage extends StatelessWidget {
  const IconDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图标'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '基础图标'),
            const SizedBox(height: 16),
            _buildBasicIcons(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '系统图标'),
            const SizedBox(height: 16),
            _buildSystemIcons(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '图标样式'),
            const SizedBox(height: 16),
            _buildIconStyles(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '图标大小'),
            const SizedBox(height: 16),
            _buildIconSizes(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '图标颜色'),
            const SizedBox(height: 16),
            _buildIconColors(context),
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

  Widget _buildBasicIcons(BuildContext context) {
    return _buildIconGrid([
      IconInfo('home', Icons.home),
      IconInfo('search', Icons.search),
      IconInfo('settings', Icons.settings),
      IconInfo('person', Icons.person),
      IconInfo('favorite', Icons.favorite),
      IconInfo('star', Icons.star),
      IconInfo('delete', Icons.delete),
      IconInfo('edit', Icons.edit),
      IconInfo('add', Icons.add),
      IconInfo('remove', Icons.remove),
      IconInfo('close', Icons.close),
      IconInfo('check', Icons.check),
    ]);
  }

  Widget _buildSystemIcons(BuildContext context) {
    return _buildIconGrid([
      IconInfo('menu', Icons.menu),
      IconInfo('arrow_back', Icons.arrow_back),
      IconInfo('arrow_forward', Icons.arrow_forward),
      IconInfo('arrow_upward', Icons.arrow_upward),
      IconInfo('arrow_downward', Icons.arrow_downward),
      IconInfo('chevron_left', Icons.chevron_left),
      IconInfo('chevron_right', Icons.chevron_right),
      IconInfo('expand_more', Icons.expand_more),
      IconInfo('expand_less', Icons.expand_less),
      IconInfo('refresh', Icons.refresh),
      IconInfo('sync', Icons.sync),
      IconInfo('more_vert', Icons.more_vert),
    ]);
  }

  Widget _buildIconStyles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('填充样式'),
        const SizedBox(height: 12),
        _buildIconGrid([
          IconInfo('filled', Icons.home),
          IconInfo('outlined', Icons.home_outlined),
          IconInfo('rounded', Icons.home_rounded),
          IconInfo('sharp', Icons.home_sharp),
        ]),
        const SizedBox(height: 16),
        const Text('装饰样式'),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildDecoratedIcon(Icons.notifications, '角标'),
            const SizedBox(width: 16),
            _buildDecoratedIcon(Icons.mail, '红点'),
            const SizedBox(width: 16),
            _buildDecoratedIcon(Icons.shopping_cart, '数量'),
          ],
        ),
      ],
    );
  }

  Widget _buildIconSizes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('标准大小'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.home, size: 18),
                const SizedBox(height: 4),
                Text('18px', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Column(
              children: [
                Icon(Icons.home, size: 24),
                const SizedBox(height: 4),
                Text('24px', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Column(
              children: [
                Icon(Icons.home, size: 36),
                const SizedBox(height: 4),
                Text('36px', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Column(
              children: [
                Icon(Icons.home, size: 48),
                const SizedBox(height: 4),
                Text('48px', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('自定义大小'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.favorite, size: 16, color: Colors.red),
            Icon(Icons.favorite, size: 20, color: Colors.red),
            Icon(Icons.favorite, size: 28, color: Colors.red),
            Icon(Icons.favorite, size: 32, color: Colors.red),
            Icon(Icons.favorite, size: 40, color: Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _buildIconColors(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('主题色'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.circle, color: Theme.of(context).colorScheme.primary, size: 32),
            Icon(Icons.circle, color: Theme.of(context).colorScheme.secondary, size: 32),
            Icon(Icons.circle, color: Theme.of(context).colorScheme.tertiary, size: 32),
            Icon(Icons.circle, color: Theme.of(context).colorScheme.error, size: 32),
          ],
        ),
        const SizedBox(height: 16),
        const Text('功能色'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 32),
                const SizedBox(height: 4),
                Text('成功', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Column(
              children: [
                Icon(Icons.warning, color: Colors.orange, size: 32),
                const SizedBox(height: 4),
                Text('警告', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Column(
              children: [
                Icon(Icons.error, color: Colors.red, size: 32),
                const SizedBox(height: 4),
                Text('错误', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            Column(
              children: [
                Icon(Icons.info, color: Colors.blue, size: 32),
                const SizedBox(height: 4),
                Text('信息', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('渐变色'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildGradientIcon(Icons.favorite),
            _buildGradientIcon(Icons.star),
            _buildGradientIcon(Icons.lightbulb),
          ],
        ),
      ],
    );
  }

  Widget _buildIconGrid(List<IconInfo> icons) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1,
      children: icons.map((icon) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon.iconData, size: 32),
              const SizedBox(height: 8),
              Text(
                icon.name,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDecoratedIcon(IconData iconData, String label) {
    return Column(
      children: [
        Stack(
          children: [
            Icon(iconData, size: 32),
            if (label == '角标')
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '新',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            else if (label == '红点')
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            else if (label == '数量')
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildGradientIcon(IconData iconData) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Icon(iconData, size: 48, color: Colors.white),
    );
  }
}

class IconInfo {
  final String name;
  final IconData iconData;

  IconInfo(this.name, this.iconData);
}