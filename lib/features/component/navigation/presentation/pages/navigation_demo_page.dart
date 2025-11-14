import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 导航演示组件
class NavigationDemoPage extends StatefulWidget {
  const NavigationDemoPage({super.key});

  @override
  State<NavigationDemoPage> createState() => _NavigationDemoPageState();
}

class _NavigationDemoPageState extends State<NavigationDemoPage> {
  int _currentPage = 1;
  final int _totalPages = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('导航'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '导航栏'),
            const SizedBox(height: 16),
            _buildAppBars(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '标签页'),
            const SizedBox(height: 16),
            _buildTabs(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '面包屑导航'),
            const SizedBox(height: 16),
            _buildBreadcrumbs(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '步骤条'),
            const SizedBox(height: 16),
            _buildSteps(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '抽屉导航'),
            const SizedBox(height: 16),
            _buildDrawers(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '底部导航'),
            const SizedBox(height: 16),
            _buildBottomNavigation(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '分页导航'),
            const SizedBox(height: 16),
            _buildPagination(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '树形导航'),
            const SizedBox(height: 16),
            _buildTreeNavigation(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '锚点导航'),
            const SizedBox(height: 16),
            _buildAnchorNavigation(context),
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

  Widget _buildAppBars(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础导航栏'),
        const SizedBox(height: 12),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),
              const Expanded(
                child: Text(
                  '页面标题',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('带搜索的导航栏'),
        const SizedBox(height: 12),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(Icons.search, color: Colors.grey, size: 20),
                      SizedBox(width: 8),
                      Text(
                        '搜索',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_scanner),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('带标签的导航栏'),
        const SizedBox(height: 12),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '主标题',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '副标题',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础标签页'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      '标签一',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Center(
                    child: Text(
                      '标签二',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Center(
                    child: Text(
                      '标签三',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('底部指示器标签页'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: const Center(
                        child: Text(
                          '首页',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: const Center(
                        child: Text(
                          '分类',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: const Center(
                        child: Text(
                          '我的',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('胶囊标签页'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '选项一',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Center(
                    child: Text(
                      '选项二',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBreadcrumbs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础面包屑'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('首页'),
              ),
              const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
              TextButton(
                onPressed: () {},
                child: const Text('组件'),
              ),
              const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
              const Text(
                '按钮',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('带图标的面包屑'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.home, size: 20),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.widgets, size: 16),
                label: const Text('组件'),
              ),
              const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
              const Text(
                '表单',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('自定义分隔符'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('首页'),
              ),
              const Text(' / ', style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () {},
                child: const Text('产品'),
              ),
              const Text(' / ', style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () {},
                child: const Text('分类'),
              ),
              const Text(' / ', style: TextStyle(color: Colors.grey)),
              const Text(
                '详情',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSteps(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础步骤条'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  _buildStepItem('1', '步骤一', true, false),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: AppColors.primary,
                    ),
                  ),
                  _buildStepItem('2', '步骤二', true, false),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  _buildStepItem('3', '步骤三', false, false),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('点状步骤条'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              _buildDotStep(true, '开始'),
              Expanded(
                child: Container(
                  height: 2,
                  color: AppColors.primary,
                ),
              ),
              _buildDotStep(true, '进行中'),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey.shade300,
                ),
              ),
              _buildDotStep(false, '结束'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('自定义步骤条'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  _buildCustomStep(Icons.check_circle, '完成', AppColors.success, true),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: AppColors.success,
                    ),
                  ),
                  _buildCustomStep(Icons.adjust, '处理中', AppColors.primary, true),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  _buildCustomStep(Icons.radio_button_unchecked, '待处理', Colors.grey, false),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('提交订单', style: TextStyle(fontSize: 12)),
                  Text('支付订单', style: TextStyle(fontSize: 12)),
                  Text('完成配送', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDrawers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('抽屉导航'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              _buildDrawerItem(Icons.home, '首页', true),
              _buildDrawerItem(Icons.widgets, '组件', false),
              _buildDrawerItem(Icons.dashboard, '模板', false),
              _buildDrawerItem(Icons.settings, '设置', false),
              const Divider(),
              _buildDrawerItem(Icons.info, '关于', false),
              _buildDrawerItem(Icons.exit_to_app, '退出', false),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('分组导航'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '主要功能',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _buildDrawerItem(Icons.home, '首页', true),
              _buildDrawerItem(Icons.widgets, '组件库', false),
              _buildDrawerItem(Icons.dashboard, '模板中心', false),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '系统设置',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _buildDrawerItem(Icons.settings, '系统设置', false),
              _buildDrawerItem(Icons.person, '个人中心', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('底部导航'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.home, '首页', true),
              _buildBottomNavItem(Icons.widgets, '组件', false),
              _buildBottomNavItem(Icons.add_circle, '发布', false, isLarge: true),
              _buildBottomNavItem(Icons.notifications, '消息', false),
              _buildBottomNavItem(Icons.person, '我的', false),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('带徽章的底部导航'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItemWithBadge(Icons.home, '首页', true, 0),
              _buildBottomNavItemWithBadge(Icons.widgets, '组件', false, 3),
              _buildBottomNavItemWithBadge(Icons.shopping_cart, '购物车', false, 9),
              _buildBottomNavItemWithBadge(Icons.notifications, '消息', false, 99),
              _buildBottomNavItemWithBadge(Icons.person, '我的', false, 0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepItem(String number, String text, bool completed, bool isLast) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: completed ? AppColors.primary : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: completed ? Colors.white : Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: completed ? AppColors.primary : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDotStep(bool completed, String text) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: completed ? AppColors.primary : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: completed ? AppColors.primary : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomStep(IconData icon, String text, Color color, bool completed) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(IconData icon, String text, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? AppColors.primary : Colors.grey,
          size: 20,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: selected ? AppColors.primary : Colors.black87,
            fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        selected: selected,
        onTap: () {},
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String text, bool selected, {bool isLarge = false}) {
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

  Widget _buildBottomNavItemWithBadge(IconData icon, String text, bool selected, int badgeCount) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected ? AppColors.primary : Colors.grey,
              size: 24,
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
        ),
        if (badgeCount > 0)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Center(
                child: Text(
                  badgeCount > 99 ? '99+' : badgeCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPagination(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础分页'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _currentPage > 1
                    ? () {
                        setState(() {
                          _currentPage--;
                        });
                      }
                    : null,
              ),
              ...List.generate(5, (index) {
                int page = index + 1;
                return TextButton(
                  onPressed: () {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: page == _currentPage
                        ? AppColors.primary
                        : Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: const Size(40, 40),
                  ),
                  child: Text(
                    '$page',
                    style: TextStyle(
                      color: page == _currentPage ? Colors.white : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                );
              }),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _currentPage < _totalPages
                    ? () {
                        setState(() {
                          _currentPage++;
                        });
                      }
                    : null,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('简洁分页'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: _currentPage > 1
                    ? () {
                        setState(() {
                          _currentPage--;
                        });
                      }
                    : null,
                icon: const Icon(Icons.chevron_left, size: 16),
                label: const Text('上一页'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              Text(
                '第 $_currentPage 页，共 $_totalPages 页',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              ElevatedButton.icon(
                onPressed: _currentPage < _totalPages
                    ? () {
                        setState(() {
                          _currentPage++;
                        });
                      }
                    : null,
                label: const Text('下一页'),
                icon: const Icon(Icons.chevron_right, size: 16),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('页码跳转'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('跳转到'),
              const SizedBox(width: 8),
              SizedBox(
                width: 60,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '页码',
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (value) {
                    int? page = int.tryParse(value);
                    if (page != null && page > 0 && page <= _totalPages) {
                      setState(() {
                        _currentPage = page;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text('页 (共 $_totalPages 页)'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTreeNavigation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础树形导航'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              _buildTreeItem(Icons.folder, '文档管理', 0, true, isExpanded: true),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  children: [
                    _buildTreeItem(Icons.insert_drive_file, '用户手册.pdf', 1, false),
                    _buildTreeItem(Icons.insert_drive_file, '开发指南.pdf', 1, false),
                    _buildTreeItem(Icons.folder, '图片资源', 1, true),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        children: [
                          _buildTreeItem(Icons.image, 'logo.png', 2, false),
                          _buildTreeItem(Icons.image, 'banner.jpg', 2, false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildTreeItem(Icons.folder, '项目管理', 0, true),
              _buildTreeItem(Icons.folder, '系统设置', 0, true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnchorNavigation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('锚点导航'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '页面内容导航',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildAnchorItem('产品介绍', true),
                  _buildAnchorItem('功能特性', false),
                  _buildAnchorItem('使用指南', false),
                  _buildAnchorItem('技术规格', false),
                  _buildAnchorItem('常见问题', false),
                  _buildAnchorItem('联系我们', false),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    '滚动内容区域',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTreeItem(IconData icon, String text, int level, bool hasChildren, {bool isExpanded = false}) {
    return Container(
      padding: EdgeInsets.only(left: level * 16.0),
      child: ListTile(
        leading: Icon(icon, size: 20, color: Colors.grey),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: level == 0 ? Colors.black87 : Colors.grey.shade700,
            fontWeight: level == 0 ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        trailing: hasChildren
            ? Icon(
                isExpanded ? Icons.expand_more : Icons.chevron_right,
                size: 16,
                color: Colors.grey,
              )
            : null,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        onTap: () {},
      ),
    );
  }

  Widget _buildAnchorItem(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? AppColors.primary : Colors.grey.shade300,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: isActive ? AppColors.primary : Colors.grey.shade700,
          fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }
}