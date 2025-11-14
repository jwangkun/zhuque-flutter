import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 数据展示演示组件
class DataDisplayDemoPage extends StatefulWidget {
  const DataDisplayDemoPage({super.key});

  @override
  State<DataDisplayDemoPage> createState() => _DataDisplayDemoPageState();
}

class _DataDisplayDemoPageState extends State<DataDisplayDemoPage> {
  double _sliderValue = 50.0;
  double _rangeStart = 20.0;
  double _rangeEnd = 80.0;
  int _currentStep = 0;
  double _progressValue = 0.7;
  int _rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数据展示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '进度条'),
            const SizedBox(height: 16),
            _buildProgressBars(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '评分组件'),
            const SizedBox(height: 16),
            _buildRatingComponents(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '滑动条'),
            const SizedBox(height: 16),
            _buildSliders(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '步骤条'),
            const SizedBox(height: 16),
            _buildSteppers(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '列表展示'),
            const SizedBox(height: 16),
            _buildListDisplay(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '卡片展示'),
            const SizedBox(height: 16),
            _buildCardDisplay(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '表格展示'),
            const SizedBox(height: 16),
            _buildTableDisplay(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '统计展示'),
            const SizedBox(height: 16),
            _buildStatisticsDisplay(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '图表展示'),
            const SizedBox(height: 16),
            _buildChartDisplay(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '标签展示'),
            const SizedBox(height: 16),
            _buildTagDisplay(context),
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

  Widget _buildListDisplay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础列表'),
        const SizedBox(height: 12),
        Card(
          elevation: 1,
          child: Column(
            children: [
              _buildListItem(Icons.person, '张三', '产品经理', '在线'),
              const Divider(height: 1),
              _buildListItem(Icons.person, '李四', 'UI设计师', '忙碌'),
              const Divider(height: 1),
              _buildListItem(Icons.person, '王五', '前端开发', '离线'),
              const Divider(height: 1),
              _buildListItem(Icons.person, '赵六', '后端开发', '在线'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('带图片的列表'),
        const SizedBox(height: 12),
        Card(
          elevation: 1,
          child: Column(
            children: [
              _buildImageListItem(
                'https://via.placeholder.com/48',
                '商品名称',
                '¥99.00',
                '已售出 128 件',
              ),
              const Divider(height: 1),
              _buildImageListItem(
                'https://via.placeholder.com/48',
                '产品标题',
                '¥199.00',
                '已售出 86 件',
              ),
              const Divider(height: 1),
              _buildImageListItem(
                'https://via.placeholder.com/48',
                '服务名称',
                '¥299.00',
                '已售出 64 件',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('可展开的列表'),
        const SizedBox(height: 12),
        Card(
          elevation: 1,
          child: ExpansionTile(
            title: const Text('订单详情'),
            subtitle: const Text('订单号：202312010001'),
            leading: const Icon(Icons.shopping_cart),
            trailing: const Text('¥299.00'),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('商品名称', '智能手机'),
                    _buildDetailRow('数量', '1 件'),
                    _buildDetailRow('单价', '¥299.00'),
                    _buildDetailRow('运费', '¥0.00'),
                    _buildDetailRow('总价', '¥299.00', isTotal: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardDisplay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础卡片'),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '卡片标题',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '这是卡片的内容描述，可以包含多行文本，用于展示详细信息。',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('取消'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('确认'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('媒体卡片'),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.image, size: 48, color: Colors.grey),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '美丽的景色',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '这是一段描述文字，介绍这个美丽的景色。',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '2023-12-01',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('128', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('信息卡片'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildInfoCard('总用户数', '12,345', Icons.people, AppColors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildInfoCard('订单数', '2,468', Icons.shopping_cart, AppColors.success),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildInfoCard('销售额', '¥89,432', Icons.attach_money, AppColors.warning),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildInfoCard('转化率', '12.5%', Icons.trending_up, AppColors.danger),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableDisplay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础表格'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: const [
                    Expanded(child: Text('姓名', style: TextStyle(fontWeight: FontWeight.w600))),
                    Expanded(child: Text('年龄', style: TextStyle(fontWeight: FontWeight.w600))),
                    Expanded(child: Text('城市', style: TextStyle(fontWeight: FontWeight.w600))),
                    Expanded(child: Text('状态', style: TextStyle(fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
              _buildTableRow('张三', '28', '北京', '在线', Colors.green),
              const Divider(height: 1),
              _buildTableRow('李四', '32', '上海', '忙碌', Colors.orange),
              const Divider(height: 1),
              _buildTableRow('王五', '25', '广州', '离线', Colors.grey),
              const Divider(height: 1),
              _buildTableRow('赵六', '30', '深圳', '在线', Colors.green),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('斑马纹表格'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: const [
                    Expanded(child: Text('产品', style: TextStyle(fontWeight: FontWeight.w600))),
                    Expanded(child: Text('价格', style: TextStyle(fontWeight: FontWeight.w600))),
                    Expanded(child: Text('库存', style: TextStyle(fontWeight: FontWeight.w600))),
                    Expanded(child: Text('销量', style: TextStyle(fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
              _buildZebraTableRow('iPhone 14', '¥5999', '100', '856', 0),
              _buildZebraTableRow('MacBook Pro', '¥12999', '50', '234', 1),
              _buildZebraTableRow('AirPods Pro', '¥1999', '200', '1567', 2),
              _buildZebraTableRow('iPad Air', '¥4399', '80', '432', 3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatisticsDisplay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('统计数字'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('总访问量', '1,234,567', Icons.visibility, Colors.blue),
            _buildStatItem('用户数', '89,432', Icons.people, Colors.green),
            _buildStatItem('订单量', '12,345', Icons.shopping_cart, Colors.orange),
          ],
        ),
        const SizedBox(height: 16),
        const Text('趋势指示'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTrendItem('本周', '+12.5%', true),
            _buildTrendItem('本月', '+8.3%', true),
            _buildTrendItem('本季度', '-2.1%', false),
          ],
        ),
        const SizedBox(height: 16),
        const Text('进度指示'),
        const SizedBox(height: 12),
        Column(
          children: [
            _buildProgressItem('项目进度', 75, Colors.blue),
            const SizedBox(height: 12),
            _buildProgressItem('销售目标', 60, Colors.green),
            const SizedBox(height: 12),
            _buildProgressItem('用户增长', 90, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildChartDisplay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('柱状图'),
        const SizedBox(height: 12),
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBar('1月', 80, Colors.blue),
              _buildBar('2月', 120, Colors.blue),
              _buildBar('3月', 90, Colors.blue),
              _buildBar('4月', 150, Colors.blue),
              _buildBar('5月', 110, Colors.blue),
              _buildBar('6月', 140, Colors.blue),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('折线图'),
        const SizedBox(height: 12),
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: CustomPaint(
            painter: LineChartPainter(),
            size: const Size(double.infinity, 200),
          ),
        ),
        const SizedBox(height: 16),
        const Text('饼图'),
        const SizedBox(height: 12),
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomPaint(
                  painter: PieChartPainter(),
                  size: const Size(150, 150),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLegendItem(Colors.blue, '移动端'),
                  _buildLegendItem(Colors.green, 'PC端'),
                  _buildLegendItem(Colors.orange, '平板'),
                  _buildLegendItem(Colors.red, '其他'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTagDisplay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础标签'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildTag('默认', Colors.grey),
            _buildTag('主要', AppColors.primary),
            _buildTag('成功', AppColors.success),
            _buildTag('警告', AppColors.warning),
            _buildTag('错误', AppColors.danger),
          ],
        ),
        const SizedBox(height: 16),
        const Text('不同大小'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildTag('小标签', AppColors.primary, size: 'small'),
            _buildTag('中标签', AppColors.success, size: 'medium'),
            _buildTag('大标签', AppColors.warning, size: 'large'),
          ],
        ),
        const SizedBox(height: 16),
        const Text('可关闭标签'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildClosableTag('可关闭1', AppColors.primary),
            _buildClosableTag('可关闭2', AppColors.success),
            _buildClosableTag('可关闭3', AppColors.warning),
          ],
        ),
        const SizedBox(height: 16),
        const Text('圆形标签'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildCircularTag('1', AppColors.primary),
            _buildCircularTag('2', AppColors.success),
            _buildCircularTag('3', AppColors.warning),
            _buildCircularTag('99+', AppColors.danger),
          ],
        ),
        const SizedBox(height: 16),
        const Text('状态标签'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildStatusTag('在线', Colors.green),
            _buildStatusTag('忙碌', Colors.orange),
            _buildStatusTag('离线', Colors.grey),
            _buildStatusTag('禁用', Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _buildListItem(IconData icon, String name, String role, String status) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.grey),
      ),
      title: Text(name),
      subtitle: Text(role),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: status == '在线' ? Colors.green.withOpacity(0.1) :
                status == '忙碌' ? Colors.orange.withOpacity(0.1) :
                Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: status == '在线' ? Colors.green :
                  status == '忙碌' ? Colors.orange :
                  Colors.grey,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildImageListItem(String imageUrl, String title, String price, String sales) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.image, color: Colors.grey),
      ),
      title: Text(title),
      subtitle: Text(sales),
      trailing: Text(
        price,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.danger,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String name, String age, String city, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(child: Text(name)),
          Expanded(child: Text(age)),
          Expanded(child: Text(city)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZebraTableRow(String product, String price, String stock, String sales, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: index % 2 == 0 ? Colors.white : Colors.grey.shade50,
      child: Row(
        children: [
          Expanded(child: Text(product)),
          Expanded(child: Text(price)),
          Expanded(child: Text(stock)),
          Expanded(child: Text(sales)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendItem(String period, String trend, bool isUp) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUp ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            period,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isUp ? Icons.trending_up : Icons.trending_down,
                color: isUp ? Colors.green : Colors.red,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                trend,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isUp ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(String label, int progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text('$progress%'),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress / 100,
          backgroundColor: color.withOpacity(0.1),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildBar(String label, double height, Color color) {
    return Column(
      children: [
        Container(
          width: 30,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTag(String text, Color color, {String size = 'medium'}) {
    double fontSize = size == 'small' ? 10 : size == 'large' ? 14 : 12;
    EdgeInsets padding = size == 'small'
        ? const EdgeInsets.symmetric(horizontal: 6, vertical: 2)
        : size == 'large'
          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
          : const EdgeInsets.symmetric(horizontal: 8, vertical: 4);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildClosableTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.close,
              size: 14,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildStatusTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBars(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础进度条'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildProgressIndicator('50%', 0.5, AppColors.primary),
            _buildProgressIndicator('75%', 0.75, AppColors.success),
            _buildProgressIndicator('30%', 0.3, AppColors.warning),
            _buildProgressIndicator('90%', 0.9, AppColors.danger),
          ],
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
                    const Text('文件上传'),
                    Text('${(_progressValue * 100).toStringAsFixed(0)}%'),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: _progressValue),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('数据处理'),
                    Text('${(_progressValue * 100).toStringAsFixed(0)}%'),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _progressValue,
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
            _buildCircularProgress('25%', 0.25),
            _buildCircularProgress('50%', 0.5),
            _buildCircularProgress('75%', 0.75),
            _buildCircularProgress('100%', 1.0),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingComponents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('星级评分'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStarRating(1, '很差'),
            _buildStarRating(2, '较差'),
            _buildStarRating(3, '一般'),
            _buildStarRating(4, '良好'),
            _buildStarRating(5, '优秀'),
          ],
        ),
        const SizedBox(height: 16),
        const Text('交互式评分'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('请为本次服务评分'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: AppColors.warning,
                        size: 32,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                    );
                  }),
                ),
                const SizedBox(height: 8),
                Text(
                  _getRatingText(_rating),
                  style: TextStyle(
                    color: AppColors.warning,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('其他评分样式'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildHeartRating(),
            _buildThumbRating(),
            _buildNumberRating(),
          ],
        ),
      ],
    );
  }

  Widget _buildSliders(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础滑动条'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('音量调节'),
                    Text('${_sliderValue.toStringAsFixed(0)}%'),
                  ],
                ),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: '${_sliderValue.toStringAsFixed(0)}%',
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('亮度调节'),
                    Text('${_sliderValue.toStringAsFixed(0)}%'),
                  ],
                ),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.primary.withOpacity(0.3),
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('范围滑动条'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('价格范围选择'),
                const SizedBox(height: 8),
                Text('¥${_rangeStart.toStringAsFixed(0)} - ¥${_rangeEnd.toStringAsFixed(0)}'),
                RangeSlider(
                  values: RangeValues(_rangeStart, _rangeEnd),
                  min: 0,
                  max: 100,
                  divisions: 100,
                  labels: RangeLabels(
                    '¥${_rangeStart.toStringAsFixed(0)}',
                    '¥${_rangeEnd.toStringAsFixed(0)}',
                  ),
                  onChanged: (values) {
                    setState(() {
                      _rangeStart = values.start;
                      _rangeEnd = values.end;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSteppers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('水平步骤条'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Stepper(
                  currentStep: _currentStep,
                  onStepContinue: () {
                    if (_currentStep < 2) {
                      setState(() {
                        _currentStep += 1;
                      });
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep -= 1;
                      });
                    }
                  },
                  steps: [
                    Step(
                      title: const Text('填写信息'),
                      content: const Text('请填写基本信息'),
                      isActive: _currentStep >= 0,
                    ),
                    Step(
                      title: const Text('验证身份'),
                      content: const Text('请进行身份验证'),
                      isActive: _currentStep >= 1,
                    ),
                    Step(
                      title: const Text('完成注册'),
                      content: const Text('注册成功'),
                      isActive: _currentStep >= 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('自定义步骤条'),
        const SizedBox(height: 12),
        _buildCustomStepper(),
      ],
    );
  }

  Widget _buildProgressIndicator(String label, double value, Color color) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            value: value,
            backgroundColor: color.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
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

  Widget _buildStarRating(int rating, String label) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: AppColors.warning,
              size: 16,
            );
          }),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }

  Widget _buildHeartRating() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              index < 3 ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 16,
            );
          }),
        ),
        const SizedBox(height: 4),
        const Text('点赞', style: TextStyle(fontSize: 11)),
      ],
    );
  }

  Widget _buildThumbRating() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.thumb_up, color: AppColors.primary, size: 20),
            const SizedBox(width: 4),
            const Text('128', style: TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 4),
        const Text('点赞', style: TextStyle(fontSize: 11)),
      ],
    );
  }

  Widget _buildNumberRating() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            '9.5分',
            style: TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text('评分', style: TextStyle(fontSize: 11)),
      ],
    );
  }

  Widget _buildCustomStepper() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _buildStepCircle(1, '下单', _currentStep >= 0),
                Expanded(child: _buildStepLine(_currentStep >= 1)),
                _buildStepCircle(2, '支付', _currentStep >= 1),
                Expanded(child: _buildStepLine(_currentStep >= 2)),
                _buildStepCircle(3, '完成', _currentStep >= 2),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _currentStep > 0
                      ? () {
                          setState(() {
                            _currentStep--;
                          });
                        }
                      : null,
                  child: const Text('上一步'),
                ),
                ElevatedButton(
                  onPressed: _currentStep < 2
                      ? () {
                          setState(() {
                            _currentStep++;
                          });
                        }
                      : null,
                  child: const Text('下一步'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(int step, String label, bool isActive) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              step.toString(),
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? AppColors.primary : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(bool isActive) {
    return Container(
      height: 2,
      color: isActive ? AppColors.primary : Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  String _getRatingText(int rating) {
    switch (rating) {
      case 1:
        return '很差';
      case 2:
        return '较差';
      case 3:
        return '一般';
      case 4:
        return '良好';
      case 5:
        return '优秀';
      default:
        return '未评分';
    }
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final points = [
      Offset(0, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.6),
      Offset(size.width * 0.4, size.height * 0.4),
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.2),
      Offset(size.width, size.height * 0.35),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);

    // Draw points
    final pointPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (final point in points) {
      canvas.drawCircle(point, 4, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final data = [
      {'color': Colors.blue, 'value': 40},
      {'color': Colors.green, 'value': 30},
      {'color': Colors.orange, 'value': 20},
      {'color': Colors.red, 'value': 10},
    ];

    var startAngle = -Math.pi / 2;
    final total = data.fold<int>(0, (sum, item) => sum + (item['value'] as int));

    for (final item in data) {
      final sweepAngle = (item['value'] as int) / total * 2 * Math.pi;
      final paint = Paint()
        ..color = item['color'] as Color
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

