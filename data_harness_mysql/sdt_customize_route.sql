
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `sdt_customize_route` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人',
  `data_user_id` bigint DEFAULT NULL COMMENT '数据所属人',
  `data_dept_id` bigint DEFAULT NULL COMMENT '数据所属部门',
  `is_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `route_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址（不可重复）',
  `request_type` int DEFAULT NULL COMMENT '请求类型（1：GET。2：POST。默认为POST）',
  `state` int DEFAULT NULL COMMENT '状态（1：上线。-1：下线）',
  `project_id` bigint DEFAULT NULL COMMENT '存算引擎项目ID',
  `database_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标数据库名称',
  `sql_script` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SQL语句',
  `parameter` text COLLATE utf8mb4_unicode_ci COMMENT '参数集（JSON字符串形式存储）',
  `process_id` bigint DEFAULT NULL COMMENT '业务规程ID',
  `definition_index_id` bigint DEFAULT NULL COMMENT '指标ID（一对一，如果没有表示不为指标的API）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义动态路由表';;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;