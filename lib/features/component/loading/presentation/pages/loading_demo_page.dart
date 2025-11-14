import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 加载组件演示页面
class LoadingDemoPage extends StatefulWidget {
  const LoadingDemoPage({super.key});

  @override
  State<LoadingDemoPage> createState() => _LoadingDemoPageState();
}

class _LoadingDemoPageState extends State<LoadingDemoPage> {
  bool _isLoading = false;
  double _progress = 0.0;
  bool _showSkeleton = false;

  @override
  void initState() {
    super.initState();
    // 模拟进度更新
    Future.delayed(const Duration(milliseconds: 100), () {
      _updateProgress();
    });
  }

  void _updateProgress() async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        setState(() {
          _progress += 0.01;
          if (_progress >= 1.0) {
            _progress = 0.0;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('加载'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '加载动画'),
            const SizedBox(height: 16),
            _buildLoadingAnimations(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '进度条'),
            const SizedBox(height: 16),
            _buildProgressBars(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '骨架屏'),
            const SizedBox(height: 16),
            _buildSkeletonScreens(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '加载状态'),
            const SizedBox(height: 16),
            _buildLoadingStates(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '刷新加载'),
            const SizedBox(height: 16),
            _buildRefreshLoading(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '分页加载'),
            const SizedBox(height: 16),
            _buildPaginationLoading(context),
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

  Widget _buildLoadingAnimations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础加载动画'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(),
                ),
                const SizedBox(height: 8),
                const Text('默认样式'),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('主色样式'),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('细线样式'),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('粗线样式'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('线性加载动画'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  width: 60,
                  height: 4,
                  child: LinearProgressIndicator(),
                ),
                const SizedBox(height: 8),
                const Text('默认线性'),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 4,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.success),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('成功颜色'),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 6,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.danger),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('错误颜色'),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 8,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.warning),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('警告颜色'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('自定义加载动画'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCustomLoadingAnimation('圆点动画'),
            _buildCustomLoadingAnimation('脉冲动画'),
            _buildCustomLoadingAnimation('波浪动画'),
            _buildCustomLoadingAnimation('旋转动画'),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBars(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础进度条'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('文件上传进度'),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: _progress),
                const SizedBox(height: 8),
                Text('${(_progress * 100).toStringAsFixed(1)}%'),
                const SizedBox(height: 16),
                const Text('下载进度'),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
                const SizedBox(height: 8),
                Text('${(_progress * 100).toStringAsFixed(1)}%'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('带标签的进度条'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('安装进度'),
                    Text('${(_progress * 100).toStringAsFixed(0)}%'),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: _progress),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('处理进度'),
                    Text('${(_progress * 100).toStringAsFixed(0)}%'),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: AppColors.success.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.success),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('圆形进度指示器'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCircularProgress('50%', 0.5),
            _buildCircularProgress('75%', 0.75),
            _buildCircularProgress('90%', 0.9),
            _buildCircularProgress('100%', 1.0),
          ],
        ),
      ],
    );
  }

  Widget _buildSkeletonScreens(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础骨架屏'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showSkeleton = !_showSkeleton;
                });
              },
              child: Text(_showSkeleton ? '隐藏骨架屏' : '显示骨架屏'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _showSkeleton ? _buildSkeletonContent() : _buildRealContent(),
          ),
        ),
        const SizedBox(height: 16),
        const Text('列表骨架屏'),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _buildListSkeletonItem(),
              const Divider(height: 1),
              _buildListSkeletonItem(),
              const Divider(height: 1),
              _buildListSkeletonItem(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('卡片骨架屏'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildCardSkeleton()),
            const SizedBox(width: 12),
            Expanded(child: _buildCardSkeleton()),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingStates(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('加载状态切换'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = !_isLoading;
                });
              },
              child: Text(_isLoading ? '停止加载' : '开始加载'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _isLoading
                ? const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('正在加载数据...'),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      const Text('数据加载完成'),
                      const SizedBox(height: 16),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(Icons.check_circle, size: 48, color: AppColors.primary),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('这里是加载完成后的内容'),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('按钮加载状态'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildLoadingButton('提交中...'),
            _buildLoadingButton('保存中...'),
            _buildLoadingButton('上传中...'),
          ],
        ),
      ],
    );
  }

  Widget _buildRefreshLoading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('下拉刷新'),
        const SizedBox(height: 12),
        Container(
          height: 200,
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('刷新完成')),
              );
            },
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: Icon(Icons.person, color: AppColors.primary),
                  ),
                  title: Text('用户 ${index + 1}'),
                  subtitle: Text('最后活跃: ${DateTime.now().subtract(Duration(minutes: index * 5)).toString().substring(11, 16)}'),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('上拉加载更多'),
        const SizedBox(height: 12),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index == 9) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 8),
                        const Text('加载更多...'),
                      ],
                    ),
                  ),
                );
              }
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.secondary.withOpacity(0.1),
                  child: Icon(Icons.article, color: AppColors.secondary),
                ),
                title: Text('文章 ${index + 1}'),
                subtitle: Text('发布时间: ${DateTime.now().subtract(Duration(hours: index)).toString().substring(5, 16)}'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPaginationLoading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('分页加载状态'),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.success.withOpacity(0.1),
                  child: Icon(Icons.check_circle, color: AppColors.success),
                ),
                title: const Text('加载完成'),
                subtitle: const Text('数据已全部加载'),
                trailing: Icon(Icons.check, color: AppColors.success),
              ),
              const Divider(height: 1),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.warning.withOpacity(0.1),
                  child: Icon(Icons.warning, color: AppColors.warning),
                ),
                title: const Text('加载失败'),
                subtitle: const Text('点击重试'),
                trailing: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('正在重试...')),
                    );
                  },
                ),
              ),
              const Divider(height: 1),
              Container(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 8),
                      const Text('正在加载...'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomLoadingAnimation(String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCircularProgress(String label, double value) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Stack(
            children: [
              SizedBox.expand(
                child: CircularProgressIndicator(
                  value: value,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
              Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSkeletonContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 200,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  Widget _buildRealContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '真实数据标题',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          '这里是真实的数据内容，展示了加载完成后的状态。',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          '数据加载成功，现在可以正常显示内容了。',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(Icons.image, size: 48, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildListSkeletonItem() {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      title: Container(
        height: 16,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      subtitle: Container(
        height: 14,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildCardSkeleton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 150,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingButton(String text) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isLoading = false;
        return ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(const Duration(seconds: 3), () {
                    if (mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  });
                },
          child: isLoading
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 8),
                    Text(text),
                  ],
                )
              : Text(text),
        );
      },
    );
  }
}