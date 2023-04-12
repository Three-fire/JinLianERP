#### 说明
1. ruoyi是一款开源的后台管理admin框架,jflow是一款经典的纯国产开源的工作流引擎,该版本是两者的完美结合.
1. 该版本的代码100%的开源.
1. 数据库sql安装  sql/jflow_ruoyi.sql导入。
1. 程序需要修改application-druid.yml 中的数据库连接。
1. QQ交流群：578842383
1. 安装步骤 https://gitee.com/opencc/JFlow-RuoYi/wikis/pages
1. 在线演示: http://101.42.243.212:7060/ry-jflow/login

#### 相关连接
- JFlow官网: http://ccflow.org
- 若依官网: http://ruoyi.vip

#### JFlow简介
1. 驰骋工作流引擎研发于2003年，具有.net与java两个版本，这两个版本代码结构，数据库结构，设计思想，功能组成， 操作手册，完全相同。 导入导出的流程模版，表单模版两个版本完全通用。
1. CCFlow是.net版本的简称，由济南驰骋团队负责研发，JFlow是java版本的简称，在CCFlow的基础上升级改造而来，公司联合易科德软件共同研发。两款产品向社会100%开源，
1. 十多年来，我们一直践行自己的诺言，真心服务中国IT产业，努力提高产品质量，成为了国内知名的老牌工作流引擎。
1. 驰骋工作流引擎操作简单、概念通俗易懂、操作手册完善（计:14万操作手册说明书）、代码注释完整、案例丰富翔实、单元测试完整。
1. 驰骋工作流引擎包含表单引擎与流程引擎两大部分，并且两块完美结合，协同高效工作.
1. 流程与表单界面可视化的设计，可配置程度高，适应于中国国情的多种场景的需要。
1. 在国内拥有最广泛的研究群体与应用客户群，是大型集团企业IT部门、软件公司、研究院、高校研究与应用的产品。
1. 驰骋工作流引擎不仅仅能够满足中小企业的需要，也能满足通信级用户的应用，先后在西门子、海南航空、中船、陕汽重卡、华电国际、江苏测绘院、厦门证券、天业集团、天津港等国内外大型企业政府单位服役。
1. 驰骋工作流引擎方便与您的开发框架嵌入式集成，与第三方组织机构视图化集成, 既有配置类型的开发适用于业务人员，IT维护人员， 也有面向程序员的高级引擎API开发。
1. 支持 oracle,sqlserver,mysql,pqsql等数据库.
1. 流程引擎设计支持所见即所得的设计：节点设计、表单设计、单据设计、报表定义设计、以及用户菜单设计。
1. 流程模式简洁，只有4种容易理解：线性流程、同表单分合流、异表单分合流、父子流程，没有复杂的概念。
1. 配置参数丰富，支持流程的基础功能：前进、后退、转向、转发、撤销、抄送、挂起、草稿、任务池共享，也支持高级功能取回审批、项目组、外部用户等等。
 
## 快速运行安装

### 1.安装步骤.
1. 下载JFlow，可以使用svn，Git下载.
2. 创建空白的数据库. 
3. 设置数据库参数：/jflow-web/src/main/resources/application.properties
    
```
### 导入属性配置
spring.profiles.active=mysql
```
4. 然后设置数据库连接：/jflow-web/src/main/resources/application-mysql.properties文件中的数据库连接

```
spring.datasource.url=jdbc:mysql://127.0.0.1:3307/testjflowboot?useUnicode=true&characterEncoding=utf-8&useOldAliasMetadataBehavior=true&serverTimezone=Asia/Shanghai&allowMultiQueries=true
spring.datasource.username=test
spring.datasource.password=test
spring.datasource.hikari.connection-test-query=select 'a'
spring.datasource.hikari.minimum-idle=3
spring.datasource.hikari.maximum-pool-size=20
spring.datasource.hikari.idle-timeout=180000
```
5. 启动项目。 访问地址：http://localhost:8089/ry-jflow/login 	管理员账号：admin  密码：admin123 其他用户密码：123456
6. 更多的帮助下载信息，请参考. https://gitee.com/opencc/JFlow/wikis/Home

### 2.注意事项.
1. 第一次运行相对比较慢，请等待一会，因为需要下载jar类库，等待时间和本机网络速度有关。
2. 如果你想减少等待时间，jflow已自带repository，你只需解压 bin 文件夹下的 win_bin.part1.rar 文件包即可获得。
3. 如果你本机没有安装maven和jdk，你可以使用jflow自带的，也可以解压 bin 文件夹下的 win_bin.part1.rar 文件包即可获得。
4. 如果你是用SVN检出的项目，bat文件会丢失换行符，还请解压 win_bin.part1.rar 文件覆盖当前文件，即可。 
5. 启动成功后，即可通过浏览器进行访问
