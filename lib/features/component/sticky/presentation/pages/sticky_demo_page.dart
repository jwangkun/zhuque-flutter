import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/theme/app_colors.dart';

class StickyDemoPage extends StatefulWidget {
  const StickyDemoPage({Key? key}) : super(key: key);

  @override
  State<StickyDemoPage> createState() => _StickyDemoPageState();
}

class _StickyDemoPageState extends State<StickyDemoPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky 吸顶组件'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // 普通内容区域
            Container(
              height: 200,
              color: AppColors.gray1,
              child: const Center(
                child: Text(
                  '向上滚动查看吸顶效果',
                  style: TextStyle(fontSize: 18, color: AppColors.gray6),
                ),
              ),
            ),

            // 第一个吸顶区域
            TnSticky(
              child: Container(
                height: 60,
                color: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.category, color: Colors.white),
                    const SizedBox(width: 12),
                    const Text(
                      '商品分类',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            // 商品列表
            ...List.generate(5, (index) => _buildProductCard('商品 ${index + 1}')),

            // 第二个吸顶区域
            TnSticky(
              offset: 60, // 偏移60像素
              child: Container(
                height: 50,
                color: AppColors.success,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.local_offer, color: Colors.white),
                    const SizedBox(width: 12),
                    const Text(
                      '优惠活动',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '更多',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
            ),

            // 优惠内容
            ...List.generate(3, (index) => _buildPromotionCard(index)),

            // 第三个吸顶区域（横向吸顶）
            TnSticky(
              direction: AxisDirection.right,
              child: Container(
                width: 80,
                height: double.infinity,
                color: AppColors.warning,
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                    child: Text(
                      '热门推荐',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 推荐内容
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  const SizedBox(width: 80), // 为横向吸顶留出空间
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        5,
                        (index) => Container(
                          width: 150,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.gray2,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text('推荐 ${index + 1}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 更多内容
            Container(
              height: 400,
              color: AppColors.gray1,
              child: const Center(
                child: Text('更多内容区域'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String name) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray4.withValues(opacity: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(opacity: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.shopping_bag, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '商品描述信息',
                    style: TextStyle(color: AppColors.gray6),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '¥${99 + int.parse(name.split(' ').last) * 10}',
                    style: TextStyle(
                      color: AppColors.danger,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_shopping_cart, color: AppColors.primary),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionCard(int index) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.warning.withValues(opacity: 0.1),
            AppColors.warning.withValues(opacity: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.warning.withValues(opacity: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.warning,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  '优惠',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '优惠活动 ${index + 1}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '满${(index + 1) * 100}减${(index + 1) * 20}',
                    style: TextStyle(color: AppColors.gray6),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '有效期至：2024-12-${index + 10}',
                    style: TextStyle(
                      color: AppColors.gray6,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warning,
                foregroundColor: Colors.white,
              ),
              child: const Text('立即使用'),
            ),
          ],
        ),
      ),
    );
  }
}

// Sticky吸顶组件实现
class TnSticky extends StatefulWidget {
  final Widget child;
  final double stickyOffset;
  final AxisDirection direction;

  const TnSticky({
    Key? key,
    required this.child,
    this.stickyOffset = 0.0,
    this.direction = AxisDirection.down,
  }) : super(key: key);

  @override
  State<TnSticky> createState() => _TnStickyState();
}

class _TnStickyState extends State<TnSticky> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

// 简化的Sticky实现，实际项目中应该使用更复杂的逻辑
// 这里为了演示效果，使用Container包装
class TnStickyContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double elevation;

  const TnStickyContainer({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(opacity: 0.1),
                  blurRadius: elevation,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}

// 实际项目中应该使用这个更完整的实现
class TnStickyView extends StatefulWidget {
  final List<Widget> children;
  final ScrollController? controller;

  const TnStickyView({
    Key? key,
    required this.children,
    this.controller,
  }) : super(key: key);

  @override
  State<TnStickyView> createState() => _TnStickyViewState();
}

class _TnStickyViewState extends State<TnStickyView> {
  late ScrollController _controller;
  final List<double> _stickyOffsets = [];
  final List<bool> _isStickyStates = [];

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ScrollController();
    _controller.addListener(_onScroll);

    // 初始化状态
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateOffsets();
    });
  }

  void _onScroll() {
    // 处理滚动事件，更新吸顶状态
    setState(() {
      // 简化的吸顶逻辑
    });
  }

  void _calculateOffsets() {
    // 计算每个sticky组件的位置
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onScroll);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _controller,
      children: widget.children,
    );
  }
}