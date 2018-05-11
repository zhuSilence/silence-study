 酷开广告平台 - 蔬菜沙拉（code name）
========================
创建时间：2016.09.19

### 创建时广告组开发成员列表
- 许建新 xujianxin@coocaa.com
- 兰沙   lansha@coocaa.com
- 陈雪峰 chenxuefeng@coocaa.com
- 朱翔   zhuxiang@coocaa.com
- 常华亭 changhuating@coocaa.com

***
1. **admin模块(java)**
广告统计后台管理系统，主要进行广告计划单信息的统计，提供报表导出功能

***
2. **adx-core模块(java)**
整个green-salad项目的核心数据，包括基本的entity，mapper，mapping，service

***
3. **adx-stat模块(java)**
计划单统计模块，主要完成从kafka中获取消息，对数据进行清洗，保存到日志文件中，
再定时同步数据到数据库中(ad_result表)

***
4. **adx-task模块(java)**
整个green-salad项目的任务调度模块，完成广告系统的定时任务
包括
每分钟执行广告计划单任务
每二分钟处理升级策略列表
定时处理升级策略列表
定时缓存应用排行标签
定时同步ad_result数据到ad_result_statistic表中

***
5. **eurybia模块(java)**
作为工具项目，提供工具支持

***
6. **tv-device-lib模块(NodeJS)**
设备库项目，主要针对广协提供的ip库进行清洗，并且当有tv进行请求的时候进行高速匹配，
实时解析位置信息（省份，城市）

***
7. **tv-engine模块(NodeJS)**
核心项目，主要针对tv请求资源进行处理

