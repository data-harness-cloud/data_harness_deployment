SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zz_area_code
-- ----------------------------
DROP TABLE IF EXISTS `zz_area_code`;
CREATE TABLE `zz_area_code`  (
    `area_id` bigint UNSIGNED NOT NULL COMMENT '行政区划主键Id',
    `area_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '行政区划名称',
    `area_level` int NOT NULL COMMENT '行政区划级别 (1: 省级别 2: 市级别 3: 区级别)',
    `parent_id` bigint NULL DEFAULT NULL COMMENT '父级行政区划Id',
    PRIMARY KEY (`area_id`) USING BTREE,
    INDEX `idx_level`(`area_level` ASC) USING BTREE,
    INDEX `idx_area_name`(`area_name` ASC) USING BTREE,
    INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '行政区划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_base_business_dict
-- ----------------------------
DROP TABLE IF EXISTS `sdt_base_business_dict`;
CREATE TABLE `sdt_base_business_dict`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `parent_id` bigint NULL DEFAULT NULL COMMENT '父级id',
    `bind_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定类型',
    `dict_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典名称',
    `dict_desc` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典描述',
    `show_order` int NULL DEFAULT NULL COMMENT '显示顺序',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-基础附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_base_business_file
-- ----------------------------
DROP TABLE IF EXISTS `sdt_base_business_file`;
CREATE TABLE `sdt_base_business_file`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `bind_id` bigint NULL DEFAULT NULL COMMENT '绑定id',
    `bind_str_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定字符id',
    `bind_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '绑定类型',
    `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
    `file_json` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'json字段',
    `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
    `file_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-基础附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_customize_route
-- ----------------------------
DROP TABLE IF EXISTS `sdt_customize_route`;
CREATE TABLE `sdt_customize_route`  (
    `id` bigint NOT NULL COMMENT '主键ID',
    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `route_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
    `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址（不可重复）',
    `request_type` int NULL DEFAULT NULL COMMENT '请求类型（1：GET。2：POST。默认为POST）',
    `state` int NULL DEFAULT NULL COMMENT '状态（1：上线。-1：下线）',
    `project_id` bigint NULL DEFAULT NULL COMMENT '存算引擎项目ID',
    `database_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目标数据库名称',
    `sql_script` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'SQL语句',
    `parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '参数集（JSON字符串形式存储）',
    `process_id` bigint NULL DEFAULT NULL COMMENT '业务规程ID',
    `definition_index_id` bigint NULL DEFAULT NULL COMMENT '指标ID（一对一，如果没有表示不为指标的API）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自定义动态路由表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_definition_dimension
-- ----------------------------
DROP TABLE IF EXISTS `sdt_definition_dimension`;
CREATE TABLE `sdt_definition_dimension`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `process_id` bigint NULL DEFAULT NULL COMMENT '关联业务过程id',
    `dimension_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维度类型',
    `dimension_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维度名称',
    `dimension_en_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维度英文名称',
    `dimension_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维度编码',
    `dimension_describe` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '维度描述',
    `dimension_directory_id` bigint NULL DEFAULT NULL COMMENT '维度目录id',
    `is_auto_create_table` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自动建表',
    `dimension_period_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '周期类型',
    `dimension_period_start_date` datetime NULL DEFAULT NULL COMMENT '周期开始日期',
    `dimension_period_end_date` datetime NULL DEFAULT NULL COMMENT '周期结束日期',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据标准-维度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_definition_dimension_level
-- ----------------------------
DROP TABLE IF EXISTS `sdt_definition_dimension_level`;
CREATE TABLE `sdt_definition_dimension_level`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `dimension_id` bigint NULL DEFAULT NULL COMMENT '维度表id',
    `level_number` int NULL DEFAULT NULL COMMENT '层级数字',
    `level_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '层级名称',
    `level_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '层级编码',
    `level_scale` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预计规模',
    `level_enable` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否启用',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划_数据标准-维度层级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_definition_dimension_property_column
-- ----------------------------
DROP TABLE IF EXISTS `sdt_definition_dimension_property_column`;
CREATE TABLE `sdt_definition_dimension_property_column`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `dimension_id` bigint NULL DEFAULT NULL COMMENT '维度表id',
    `property_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性名称',
    `property_en_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性英文名称',
    `property_data_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据类型',
    `property_description` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务描述',
    `property_decimal_length` int NULL DEFAULT NULL COMMENT '小数点',
    `is_primary` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划_数据标准-维度属性字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_definition_dimension_publish_record
-- ----------------------------
DROP TABLE IF EXISTS `sdt_definition_dimension_publish_record`;
CREATE TABLE `sdt_definition_dimension_publish_record`  (
    `id` bigint NOT NULL COMMENT '编号',
    `str_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字符编号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `dimension_id` bigint NULL DEFAULT NULL COMMENT '维度表id',
    `publish_database` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库',
    `publish_database_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库类型',
    `publish_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布类型',
    `physics_table_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物理表名',
    `publish_description` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述信息',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务定义-数据维度发布记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_definition_index
-- ----------------------------
DROP TABLE IF EXISTS `sdt_definition_index`;
CREATE TABLE `sdt_definition_index`  (
    `id` bigint NOT NULL COMMENT '编号',
    `str_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字符编号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `index_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '指标类型',
    `index_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '指标名称',
    `index_en_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '指标英文名称',
    `index_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '指标编码',
    `index_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '指标等级;核心、重要、一般、临时',
    `process_id` bigint NULL DEFAULT NULL COMMENT '业务过程id',
    `index_description` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务描述',
    `customize_route_id` bigint NOT NULL COMMENT '动态路由ID（一对一）',
    `model_desgin_field_id` bigint NULL DEFAULT NULL COMMENT '关联字段',
    `data_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据类型',
    `product_period` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生产周期',
    `project_id` bigint NULL DEFAULT NULL COMMENT '所属项目id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务定义-指标管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_definition_index_model_field_relation
-- ----------------------------
DROP TABLE IF EXISTS `sdt_definition_index_model_field_relation`;
CREATE TABLE `sdt_definition_index_model_field_relation`  (
    `id` bigint NOT NULL COMMENT '编号',
    `str_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字符编号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `index_id` bigint NULL DEFAULT NULL COMMENT '指标id',
    `index_process_id` bigint NULL DEFAULT NULL COMMENT '指标业务过程id',
    `model_id` bigint NULL DEFAULT NULL COMMENT '模型id',
    `model_field_id` bigint NULL DEFAULT NULL COMMENT '模型字段id',
    `model_process_id` bigint NULL DEFAULT NULL COMMENT '模型业务过程id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务定义-指标管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_dev_ai_chat_dialogue
-- ----------------------------
DROP TABLE IF EXISTS `sdt_dev_ai_chat_dialogue`;
CREATE TABLE `sdt_dev_ai_chat_dialogue`  (
    `id` bigint NOT NULL COMMENT '主表控制台id',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `dialogue_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对话名称',
    `dialogue_question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '对话问题',
    `dialogue_answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '相应答案',
    `dialogue_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '问答类型：对话、工具调用、代码执行',
    `dialogue_data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据应用类型：数据探源、生成图表、归因总结等等',
    `dialogue_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '问答角色',
    `dialogue_prompt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '问答预设提示语',
    `dialogue_str_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对话标识ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '查询控制台子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_dev_console
-- ----------------------------
DROP TABLE IF EXISTS `sdt_dev_console`;
CREATE TABLE `sdt_dev_console`  (
    `id` bigint NOT NULL COMMENT '主表控制台id',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `query_console_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '查询控制台名称',
    `query_statements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '查询语句',
    `response_results` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应结果',
    `query_database` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所选数据库',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '查询控制台子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_dev_liteflow_log
-- ----------------------------
DROP TABLE IF EXISTS `sdt_dev_liteflow_log`;
CREATE TABLE `sdt_dev_liteflow_log`  (
    `id` bigint NOT NULL COMMENT '主键ID',
    `ruler_id` bigint NOT NULL COMMENT '规则链ID',
    `scheduling_tasks_id` bigint NOT NULL COMMENT '任务ID',
    `run_version` int NULL DEFAULT NULL COMMENT '运行版本',
    `run_time` datetime NULL DEFAULT NULL COMMENT '运行时间',
    `run_result` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运行结果',
    `run_result_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '运行结果信息',
    `log_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志文件名称（rulerId_version_nowDate.log）',
    `log_file_json` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志文件Json字段',
    `log_file_size` bigint NULL DEFAULT NULL COMMENT '日志文件大小',
    `is_delete` int NOT NULL COMMENT '逻辑删除',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '修改者ID',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'LiteFlow流程执行日志（任务执行日志）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_dev_liteflow_node
-- ----------------------------
DROP TABLE IF EXISTS `sdt_dev_liteflow_node`;
CREATE TABLE `sdt_dev_liteflow_node`  (
    `id` bigint NOT NULL COMMENT '主键id',
    `ruler_id` bigint NOT NULL COMMENT '规则链ID（EL-ID）',
    `node_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件ID',
    `node_tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件标签',
    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '节点名称',
    `status` int NULL DEFAULT NULL COMMENT '节点状态（1：启用。0：停用）',
    `field_json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '字段值数据（JSON数据）',
    `execution_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '上一次执行结果信息',
    `is_delete` int NOT NULL COMMENT '逻辑删除',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '修改者ID',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人ID',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '流程规则组件属性值存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_dev_liteflow_ruler
-- ----------------------------
DROP TABLE IF EXISTS `sdt_dev_liteflow_ruler`;
CREATE TABLE `sdt_dev_liteflow_ruler`  (
    `id` bigint NOT NULL COMMENT '编号',
    `str_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字符编号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `application_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用名称',
    `chain_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程chain名称',
    `chain_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程chain描述',
    `el_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '规则表达式',
    `chain_structure_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '流程结构JSON数据',
    `online_type` int NULL DEFAULT NULL COMMENT '上线类型（0：开发中。1：发布上线）',
    `previous_version_id` bigint NULL DEFAULT NULL COMMENT '上一个版本的ID',
    `process_id` bigint NULL DEFAULT NULL COMMENT '过程ID',
    `project_id` bigint NULL DEFAULT NULL COMMENT '所属项目ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据开发-流程编排-liteflow规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_dev_liteflow_script
-- ----------------------------
DROP TABLE IF EXISTS `sdt_dev_liteflow_script`;
CREATE TABLE `sdt_dev_liteflow_script`  (
    `id` bigint NOT NULL COMMENT '编号',
    `str_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '字符编号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `application_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用名称',
    `script_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '脚本id',
    `script_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '脚本名称',
    `script_data` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '脚本内容',
    `script_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '脚本种类',
    `script_language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '脚本语言',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据开发-流程编排-liteflow脚本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_external_app
-- ----------------------------
DROP TABLE IF EXISTS `sdt_external_app`;
CREATE TABLE `sdt_external_app`  (
    `id` bigint NOT NULL COMMENT '主键ID',
    `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用名称',
    `app_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'App描述',
    `app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'AppKey',
    `authentication_method` int NOT NULL COMMENT '认证方式（1：key认证。2：无认证）',
    `process_id` bigint NULL DEFAULT NULL COMMENT '业务过程ID',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '外部App表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_external_app_customize_route
-- ----------------------------
DROP TABLE IF EXISTS `sdt_external_app_customize_route`;
CREATE TABLE `sdt_external_app_customize_route`  (
    `id` bigint NOT NULL COMMENT '主键ID',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `customize_route_id` bigint NOT NULL COMMENT '动态路由ID',
    `external_app_id` bigint NOT NULL COMMENT '外部APP ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '外部APP与动态路由对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_model_desgin_field
-- ----------------------------
DROP TABLE IF EXISTS `sdt_model_desgin_field`;
CREATE TABLE `sdt_model_desgin_field`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `model_field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段名称',
    `model_field_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段代码',
    `model_field_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段类型',
    `model_field_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段指标',
    `model_field_meta_standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联元数据标准',
    `model_field_value_standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联值域校验',
    `model_field_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段描述',
    `model_field_length` int NULL DEFAULT NULL COMMENT '长度',
    `model_field_decimal_point` int NULL DEFAULT NULL COMMENT '小数点（小数点<=长度）',
    `model_field_is_null` int NULL DEFAULT NULL COMMENT '是否为空（0：可为空。1：不为空）',
    `model_field_default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '默认值',
    `model_field_key` int NULL DEFAULT 0 COMMENT '主键字段（0：非主键。1：主键）',
    `model_field_ppartition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段分区',
    `model_field_source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型表来源字段名',
    `model_field_source_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型表来源字段类型',
    `model_field_source_id` bigint NULL DEFAULT NULL COMMENT '模型表来源字段ID',
    `model_field_source_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段来源表',
    `model_field_mapping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '业务映射字段Json数据',
    `model_id` bigint NULL DEFAULT NULL COMMENT '模型id',
    `process_id` bigint NULL DEFAULT NULL COMMENT '业务过程id',
    `model_quote_standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型引用的标准',
    `model_field_script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '字段计算脚本，仅展示关系',
    `show_order` int NULL DEFAULT NULL COMMENT '显示顺序',
    `standard_main_id` bigint NULL DEFAULT NULL COMMENT '数据标准主表ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-模型设计-模型字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_model_logical_main
-- ----------------------------
DROP TABLE IF EXISTS `sdt_model_logical_main`;
CREATE TABLE `sdt_model_logical_main`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `process_id` bigint NULL DEFAULT NULL COMMENT '关联业务过程id',
    `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型名称',
    `model_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型代码',
    `model_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型状态',
    `model_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型描述',
    `model_datasource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型数据源类型',
    `model_class_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型业务分类',
    `model_theme_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型主题域类型',
    `model_layer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型分层类型',
    `model_table_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型表类型，字典表',
    `model_update_cycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型更新周期，字典类型，对应命名',
    `model_warehouse_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型数仓表类型',
    `model_table_permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型表权限类型，个人还是项目共享',
    `model_table_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型表别名',
    `model_table_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型表等级，字典表',
    `model_life_cycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型表生命周期，字典',
    `model_publish_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型发布状态',
    `model_sql_script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '模型SQL脚本',
    `model_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型版本',
    `model_physical_database` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型发布物理库',
    `model_datasource_id` bigint NULL DEFAULT NULL COMMENT '模型数据源',
    `model_public_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型发布类型，新建表、覆盖表',
    `model_public_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型发布描述',
    `warehouse_layer_id` bigint NULL DEFAULT NULL COMMENT '数据分层id',
    `model_table_custom_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自定义表名',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-模型设计-模型逻辑表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_model_physics_script
-- ----------------------------
DROP TABLE IF EXISTS `sdt_model_physics_script`;
CREATE TABLE `sdt_model_physics_script`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `model_id` bigint NULL DEFAULT NULL COMMENT '模型id',
    `model_physics_database` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '物理模型建库语句',
    `model_physics_table_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物理模型表名称',
    `model_physics_table` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '物理模型建表语句',
    `model_physics_state` int NULL DEFAULT NULL COMMENT '物理模型状态（1、未建表。2、已建表）',
    `model_physics_datasource_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物理模型数据源',
    `model_physics_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '物理模型描述',
    `model_physics_premise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型权限：是否项目共享',
    `model_physics_header_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
    `show_order` int NULL DEFAULT NULL COMMENT '显示顺序',
    `planning_warehouse_layer_id` bigint NOT NULL COMMENT '分层id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-模型设计-模型物理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_planning_classification
-- ----------------------------
DROP TABLE IF EXISTS `sdt_planning_classification`;
CREATE TABLE `sdt_planning_classification`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '关联项目id',
    `classification_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
    `classification_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类代码',
    `classification_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类状态',
    `classification_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据架构-业务分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_planning_process
-- ----------------------------
DROP TABLE IF EXISTS `sdt_planning_process`;
CREATE TABLE `sdt_planning_process`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `classification_id` bigint NULL DEFAULT NULL COMMENT '关联分类id',
    `process_theme_id` bigint NULL DEFAULT NULL COMMENT '关联主题域id',
    `process_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务过程名称',
    `process_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务过程代码',
    `process_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务过程状态',
    `process_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务过程描述',
    `process_parent_id` bigint NULL DEFAULT NULL COMMENT '父过程id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据架构-业务过程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_planning_theme
-- ----------------------------
DROP TABLE IF EXISTS `sdt_planning_theme`;
CREATE TABLE `sdt_planning_theme`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `classification_id` bigint NULL DEFAULT NULL COMMENT '关联分类id',
    `theme_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题名称',
    `theme_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题代码',
    `theme_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题状态',
    `theme_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题描述',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据架构-主题域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_planning_warehouse_layer
-- ----------------------------
DROP TABLE IF EXISTS `sdt_planning_warehouse_layer`;
CREATE TABLE `sdt_planning_warehouse_layer`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `house_layer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分层名称',
    `house_layer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分层编码',
    `house_layer_status` int NULL DEFAULT NULL COMMENT '分层状态',
    `house_layer_database` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分层关联库',
    `house_layer_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分层描述',
    `house_layer_header_user_id` bigint NULL DEFAULT NULL COMMENT '分层负责人id',
    `house_layer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分层类型：是否为维度层',
    `house_layer_datasource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分层数据源类型',
    `datasource_id` bigint NULL DEFAULT NULL COMMENT '数据源id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据仓库分层表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_project_datasource
-- ----------------------------
DROP TABLE IF EXISTS `sdt_project_datasource`;
CREATE TABLE `sdt_project_datasource`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `datasource_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据源名称',
    `datasource_type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据源类型',
    `datasource_show_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据源显示名称',
    `datasource_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '数据源描述',
    `datasource_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '数据源连接信息存储为json字段',
    `datasource_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据源图标',
    `datasource_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据源分组',
    `datasource_connect` int NULL DEFAULT NULL COMMENT '数据源连通性',
    `is_meta_collect` int NULL DEFAULT NULL COMMENT '是否采集元数据',
    `project_id` bigint NULL DEFAULT NULL COMMENT '所属项目ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-数据源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_project_datasource_relation
-- ----------------------------
DROP TABLE IF EXISTS `sdt_project_datasource_relation`;
CREATE TABLE `sdt_project_datasource_relation`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '项目id',
    `datasource_id` bigint NULL DEFAULT NULL COMMENT '数据源id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-项目数据源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_project_datasource_template_dict
-- ----------------------------
DROP TABLE IF EXISTS `sdt_project_datasource_template_dict`;
CREATE TABLE `sdt_project_datasource_template_dict`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `template_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模板类型',
    `template_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模板名称',
    `template_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'source配置',
    `template_sink` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'sink配置',
    `template_trans` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '转换配置',
    `template_icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-项目数据源模板字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_project_engine
-- ----------------------------
DROP TABLE IF EXISTS `sdt_project_engine`;
CREATE TABLE `sdt_project_engine`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `engine_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎名称',
    `engine_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎类型',
    `engine_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎地址',
    `engine_port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎端口',
    `engine_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎用户名',
    `engine_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎密码',
    `engine_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎位置',
    `engine_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎配置i文件',
    `engine_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '引擎状态',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-存算引擎表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_project_host_relation
-- ----------------------------
DROP TABLE IF EXISTS `sdt_project_host_relation`;
CREATE TABLE `sdt_project_host_relation`  (
    `id` bigint NOT NULL COMMENT '主键',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '项目id',
    `host_id` bigint NULL DEFAULT NULL COMMENT '主机id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-项目数据源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_project_main
-- ----------------------------
DROP TABLE IF EXISTS `sdt_project_main`;
CREATE TABLE `sdt_project_main`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目名称',
    `project_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目描述',
    `project_engine_id` bigint NULL DEFAULT NULL COMMENT '项目存算引擎',
    `project_currents_status` int NULL DEFAULT NULL COMMENT '项目状态',
    `project_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目组名称',
    `project_header_id` bigint NULL DEFAULT NULL COMMENT '项目负责人',
    `project_flow_status` bigint NULL DEFAULT NULL COMMENT '项目流程状态',
    `project_flow_approve_status` bigint NULL DEFAULT NULL COMMENT '项目审批状态字段',
    `project_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '项目英文名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目—项目管理主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_project_member
-- ----------------------------
DROP TABLE IF EXISTS `sdt_project_member`;
CREATE TABLE `sdt_project_member`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `member_user_id` bigint NULL DEFAULT NULL COMMENT '成员关联用户表id',
    `member_project_id` bigint NULL DEFAULT NULL COMMENT '关联项目id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据项目-项目成员关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_remote_host
-- ----------------------------
DROP TABLE IF EXISTS `sdt_remote_host`;
CREATE TABLE `sdt_remote_host`  (
    `id` bigint NOT NULL COMMENT '主键ID',
    `show_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示名称',
    `host_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'SSH-IP地址',
    `host_port` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '端口',
    `host_key_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ssh-key文件存储路径',
    `login_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录名',
    `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '修改者ID',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人ID',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门ID',
    `project_id` bigint NULL DEFAULT NULL COMMENT '项目关联id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '远程主机配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_scheduling_tasks
-- ----------------------------
DROP TABLE IF EXISTS `sdt_scheduling_tasks`;
CREATE TABLE `sdt_scheduling_tasks`  (
    `id` bigint NOT NULL COMMENT '主键ID',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '修改者ID',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门ID',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人ID',
    `is_delete` int NOT NULL DEFAULT 1 COMMENT '逻辑删除',
    `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
    `task_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务所属分组',
    `task_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务描述',
    `task_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务状态（未上线、正常、暂停、出错、阻塞、已下线）',
    `task_class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务执行类',
    `configuration_type` int NULL DEFAULT NULL COMMENT '配置类型（1：常规，2：crontab\n）',
    `cron_expression` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'cron表达式',
    `cron_analytic_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'cron解析信息',
    `start_time` datetime NULL DEFAULT NULL COMMENT '起始时间',
    `end_time` datetime NULL DEFAULT NULL COMMENT '截止时间',
    `task_data_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务参数Map类型数据',
    `ruler_id` bigint NULL DEFAULT NULL COMMENT '任务规则链ID',
    `run_type` int NOT NULL COMMENT '任务执行类型（1：单次执行、2：周期执行）',
    `run_number` int NULL DEFAULT NULL COMMENT '任务运行次数',
    `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '错误信息',
    `error_number` int NULL DEFAULT NULL COMMENT '运行失败次数',
    `success_number` int NULL DEFAULT NULL COMMENT '运行成功次数',
    `process_id` bigint NULL DEFAULT NULL COMMENT '过程ID',
    `project_id` bigint NULL DEFAULT NULL COMMENT '所属项目ID',
    `classification_id` bigint NULL DEFAULT NULL COMMENT '业务分类ID',
    `process_theme_id` bigint NULL DEFAULT NULL COMMENT '主题域ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_seatunnel_config
-- ----------------------------
DROP TABLE IF EXISTS `sdt_seatunnel_config`;
CREATE TABLE `sdt_seatunnel_config`  (
    `id` bigint NOT NULL COMMENT '主键ID',
    `show_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示名称',
    `call_mode` int NULL DEFAULT NULL COMMENT 'Seatunnel 的调用方式（1：接口。2：ssh。默认为1）',
    `localhost_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Seatunnel 根地址',
    `submit_job_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Seatunnel 的提交job的地址（默认为版本2.3.3的Submit Job地址：/hazelcast/rest/maps/submit-job）',
    `remote_host_id` bigint NULL DEFAULT NULL COMMENT '远程主机ID',
    `seatunnel_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'seatunnel安装路径',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '修改者ID',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人ID',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门ID',
    `project_id` bigint NULL DEFAULT NULL COMMENT '关联项目id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'seatunnel配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_standard_directory
-- ----------------------------
DROP TABLE IF EXISTS `sdt_standard_directory`;
CREATE TABLE `sdt_standard_directory`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `directory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准目录名称',
    `directory_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准目录编码',
    `directory_parent_id` bigint NULL DEFAULT NULL COMMENT '父目录id',
    `directory_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目录分类',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据标准-目录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_standard_field
-- ----------------------------
DROP TABLE IF EXISTS `sdt_standard_field`;
CREATE TABLE `sdt_standard_field`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `staidard_id` bigint NULL DEFAULT NULL COMMENT '标准主表id',
    `standard_field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段标准名称',
    `standard_field_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段标准编码',
    `standard_field_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据类型',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据标准-数据字段标准' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_standard_field_quality
-- ----------------------------
DROP TABLE IF EXISTS `sdt_standard_field_quality`;
CREATE TABLE `sdt_standard_field_quality`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `staidard_id` bigint NULL DEFAULT NULL COMMENT '标准主表id',
    `staidard_field_id` bigint NULL DEFAULT NULL COMMENT '标准字段id',
    `staidard_quality_id` bigint NULL DEFAULT NULL COMMENT '质量校验id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据标准-数据字段质量关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_standard_main
-- ----------------------------
DROP TABLE IF EXISTS `sdt_standard_main`;
CREATE TABLE `sdt_standard_main`  (
    `id` bigint NOT NULL COMMENT '主键',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `project_id` bigint NULL DEFAULT NULL COMMENT '分层关联项目id',
    `standard_directory_id` bigint NULL DEFAULT NULL COMMENT '标准目录id',
    `standard_header_id` bigint NULL DEFAULT NULL COMMENT '标准负责人id',
    `standard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准名称',
    `standard_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准编码',
    `standard_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准分类',
    `standard_english` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准英语名称',
    `standard_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准描述',
    `standard_input_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准录入方式',
    `standard_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标准状态',
    `standard_regular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '正则表达式',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据标准-主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_standard_quality
-- ----------------------------
DROP TABLE IF EXISTS `sdt_standard_quality`;
CREATE TABLE `sdt_standard_quality`  (
    `id` bigint NOT NULL COMMENT '租户号',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建人',
    `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新人',
    `data_user_id` bigint NULL DEFAULT NULL COMMENT '数据所属人',
    `data_dept_id` bigint NULL DEFAULT NULL COMMENT '数据所属部门',
    `is_delete` int NULL DEFAULT NULL COMMENT '逻辑删除',
    `standard_quality_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '质量标准名称',
    `standard_quality_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '质量标准编码',
    `staidard_quality_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '质量标准分类',
    `standard_quality_parent_id` bigint NULL DEFAULT NULL COMMENT '质量标准父id',
    `standard_qaulity_re` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '质量校验正则',
    `standard_quality_lang` int NULL DEFAULT NULL COMMENT '质量校验长度限制（正数->大等于。负数->小等于）',
    `standard_quality_not_null` int NULL DEFAULT NULL COMMENT '质量校验不为空（1：不为空。0：可为空）',
    `custom_judgment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SQL条件',
    `standard_quality_quality_center_id` bigint NULL DEFAULT NULL COMMENT '质量校验中心关联规则',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据规划-数据标准-数据质量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_data_perm
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_data_perm`;
CREATE TABLE `sdt_sys_data_perm`  (
    `data_perm_id` bigint NOT NULL COMMENT '主键',
    `data_perm_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '显示名称',
    `rule_type` tinyint NOT NULL COMMENT '数据权限规则类型(0: 全部可见 1: 只看自己 2: 只看本部门 3: 本部门及子部门 4: 多部门及子部门 5: 自定义部门列表)。',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`data_perm_id`) USING BTREE,
    INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_data_perm_dept
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_data_perm_dept`;
CREATE TABLE `sdt_sys_data_perm_dept`  (
    `data_perm_id` bigint NOT NULL COMMENT '数据权限Id',
    `dept_id` bigint NOT NULL COMMENT '部门Id',
    PRIMARY KEY (`data_perm_id`, `dept_id`) USING BTREE,
    INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据权限和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_data_perm_menu
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_data_perm_menu`;
CREATE TABLE `sdt_sys_data_perm_menu`  (
    `data_perm_id` bigint NOT NULL COMMENT '数据权限Id',
    `menu_id` bigint NOT NULL COMMENT '菜单Id',
    PRIMARY KEY (`data_perm_id`, `menu_id`) USING BTREE,
    INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据权限和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_data_perm_user
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_data_perm_user`;
CREATE TABLE `sdt_sys_data_perm_user`  (
    `data_perm_id` bigint NOT NULL COMMENT '数据权限Id',
    `user_id` bigint NOT NULL COMMENT '用户Id',
    PRIMARY KEY (`data_perm_id`, `user_id`) USING BTREE,
    INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据权限和用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_dept`;
CREATE TABLE `sdt_sys_dept`  (
    `dept_id` bigint NOT NULL COMMENT '部门Id',
    `parent_id` bigint NULL DEFAULT NULL COMMENT '父部门Id',
    `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门名称',
    `show_order` int NOT NULL COMMENT '兄弟部分之间的显示顺序，数字越小越靠前',
    `mark` bigint NOT NULL COMMENT '测试字段',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`dept_id`) USING BTREE,
    INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
    INDEX `idx_show_order`(`show_order` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门管理表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_dept_post
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_dept_post`;
CREATE TABLE `sdt_sys_dept_post`  (
    `dept_post_id` bigint NOT NULL COMMENT '主键Id',
    `dept_id` bigint NOT NULL COMMENT '部门Id',
    `post_id` bigint NOT NULL COMMENT '岗位Id',
    `post_show_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门岗位显示名称',
    PRIMARY KEY (`dept_post_id`) USING BTREE,
    INDEX `idx_post_id`(`post_id` ASC) USING BTREE,
    INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_dept_relation`;
CREATE TABLE `sdt_sys_dept_relation`  (
    `parent_dept_id` bigint NOT NULL COMMENT '父部门Id',
    `dept_id` bigint NOT NULL COMMENT '部门Id',
    PRIMARY KEY (`parent_dept_id`, `dept_id`) USING BTREE,
    INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门关联关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_menu`;
CREATE TABLE `sdt_sys_menu`  (
    `menu_id` bigint NOT NULL COMMENT '主键Id',
    `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单Id，目录菜单的父菜单为null',
    `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单显示名称',
    `str_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字符id',
    `menu_type` int NOT NULL COMMENT '(0: 目录 1: 菜单 2: 按钮 3: UI片段)',
    `form_router_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '前端表单路由名称，仅用于menu_type为1的菜单类型',
    `online_form_id` bigint NULL DEFAULT NULL COMMENT '在线表单主键Id',
    `online_menu_perm_type` int NULL DEFAULT NULL COMMENT '在线表单菜单的权限控制类型',
    `report_page_id` bigint NULL DEFAULT NULL COMMENT '统计页面主键Id',
    `online_flow_entry_id` bigint NULL DEFAULT NULL COMMENT '仅用于在线表单的流程Id',
    `show_order` int NOT NULL COMMENT '菜单显示顺序 (值越小，排序越靠前)',
    `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单图标',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除标记(1: 正常 -1: 已删除)',
    `extra_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '附加信息',
    PRIMARY KEY (`menu_id`) USING BTREE,
    INDEX `idx_show_order`(`show_order` ASC) USING BTREE,
    INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
    INDEX `idx_menu_type`(`menu_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单和操作权限管理表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_menu_perm_code
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_menu_perm_code`;
CREATE TABLE `sdt_sys_menu_perm_code`  (
    `menu_id` bigint NOT NULL COMMENT '关联菜单Id',
    `perm_code_id` bigint NOT NULL COMMENT '关联权限字Id',
    PRIMARY KEY (`menu_id`, `perm_code_id`) USING BTREE,
    INDEX `idx_perm_code_id`(`perm_code_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单和权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_perm`;
CREATE TABLE `sdt_sys_perm`  (
    `perm_id` bigint NOT NULL COMMENT '权限id',
    `module_id` bigint NOT NULL DEFAULT 0 COMMENT '权限所在的权限模块id',
    `perm_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '权限名称',
    `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '关联的url',
    `show_order` int NOT NULL DEFAULT 0 COMMENT '权限在当前模块下的顺序，由小到大',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`perm_id`) USING BTREE,
    INDEX `idx_show_order`(`show_order` ASC) USING BTREE,
    INDEX `idx_module_id`(`module_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_perm_code
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_perm_code`;
CREATE TABLE `sdt_sys_perm_code`  (
    `perm_code_id` bigint NOT NULL COMMENT '主键Id',
    `parent_id` bigint NULL DEFAULT NULL COMMENT '上级权限字Id',
    `perm_code` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '权限字标识(一般为有含义的英文字符串)',
    `perm_code_type` int NOT NULL COMMENT '类型(0: 表单 1: UI片段 2: 操作)',
    `show_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '显示名称',
    `show_order` int NOT NULL COMMENT '显示顺序(数值越小，越靠前)',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`perm_code_id`) USING BTREE,
    UNIQUE INDEX `uk_perm_code`(`perm_code` ASC, `deleted_flag` ASC) USING BTREE,
    INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
    INDEX `idx_show_order`(`show_order` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统权限资源表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_perm_code_perm
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_perm_code_perm`;
CREATE TABLE `sdt_sys_perm_code_perm`  (
    `perm_code_id` bigint NOT NULL COMMENT '权限字Id',
    `perm_id` bigint NOT NULL COMMENT '权限id',
    PRIMARY KEY (`perm_code_id`, `perm_id`) USING BTREE,
    INDEX `idx_perm_id`(`perm_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统权限字和权限资源关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_perm_module
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_perm_module`;
CREATE TABLE `sdt_sys_perm_module`  (
    `module_id` bigint NOT NULL COMMENT '权限模块id',
    `parent_id` bigint NULL DEFAULT 0 COMMENT '上级权限模块id',
    `module_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '权限模块名称',
    `module_type` int NOT NULL COMMENT '模块类型(0: 普通模块 1: Controller模块)',
    `show_order` int NOT NULL DEFAULT 0 COMMENT '权限模块在当前层级下的顺序，由小到大',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`module_id`) USING BTREE,
    INDEX `idx_show_order`(`show_order` ASC) USING BTREE,
    INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
    INDEX `idx_module_type`(`module_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统权限模块表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_perm_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_perm_whitelist`;
CREATE TABLE `sdt_sys_perm_whitelist`  (
    `perm_url` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '权限资源的url',
    `module_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '权限资源所属模块名字(通常是Controller的名字)',
    `perm_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '权限的名称',
    PRIMARY KEY (`perm_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '权限资源白名单表(认证用户均可访问的url资源)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_post`;
CREATE TABLE `sdt_sys_post`  (
    `post_id` bigint NOT NULL COMMENT '岗位Id',
    `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
    `post_level` int NOT NULL COMMENT '岗位层级，数值越小级别越高',
    `leader_post` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否领导岗位',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_role`;
CREATE TABLE `sdt_sys_role`  (
    `role_id` bigint NOT NULL COMMENT '主键Id',
    `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_role_menu`;
CREATE TABLE `sdt_sys_role_menu`  (
    `role_id` bigint NOT NULL COMMENT '角色Id',
    `menu_id` bigint NOT NULL COMMENT '菜单Id',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
    INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色与菜单对应关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_user`;
CREATE TABLE `sdt_sys_user`  (
    `user_id` bigint NOT NULL COMMENT '主键Id',
    `login_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户登录名称',
    `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
    `show_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户显示名称',
    `dept_id` bigint NOT NULL COMMENT '用户所在部门Id',
    `head_image_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户头像的Url',
    `user_type` int NOT NULL COMMENT '用户类型(0: 管理员 1: 系统管理用户 2: 系统业务用户)',
    `user_status` int NOT NULL COMMENT '状态(0: 正常 1: 锁定)',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `uk_login_name`(`login_name` ASC) USING BTREE,
    INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE,
    INDEX `idx_status`(`user_status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_user`;
CREATE TABLE `sdt_sys_user`  (
    `user_id` bigint NOT NULL COMMENT '主键Id',
    `login_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户登录名称',
    `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
    `show_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户显示名称',
    `dept_id` bigint NOT NULL COMMENT '用户所在部门Id',
    `head_image_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户头像的Url',
    `user_type` int NOT NULL COMMENT '用户类型(0: 管理员 1: 系统管理用户 2: 系统业务用户)',
    `user_status` int NOT NULL COMMENT '状态(0: 正常 1: 锁定)',
    `create_user_id` bigint NOT NULL COMMENT '创建者Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新者Id',
    `update_time` datetime NOT NULL COMMENT '最后更新时间',
    `deleted_flag` int NOT NULL COMMENT '删除标记(1: 正常 -1: 已删除)',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `uk_login_name`(`login_name` ASC) USING BTREE,
    INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE,
    INDEX `idx_status`(`user_status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sdt_sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_user_post`;
CREATE TABLE `sdt_sys_user_post`  (
    `user_id` bigint NOT NULL COMMENT '用户Id',
    `dept_post_id` bigint NOT NULL COMMENT '部门岗位Id',
    `post_id` bigint NOT NULL COMMENT '岗位Id',
    PRIMARY KEY (`user_id`, `dept_post_id`) USING BTREE,
    INDEX `idx_post_id`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sdt_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sdt_sys_user_role`;
CREATE TABLE `sdt_sys_user_role`  (
    `user_id` bigint NOT NULL COMMENT '用户Id',
    `role_id` bigint NOT NULL COMMENT '角色Id',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
    INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与角色对应关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for zz_sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `zz_sys_operation_log`;
CREATE TABLE `zz_sys_operation_log`  (
    `log_id` bigint NOT NULL COMMENT '主键Id',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志描述',
    `operation_type` int NULL DEFAULT NULL COMMENT '操作类型',
    `service_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接口所在服务名称',
    `api_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '调用的controller全类名',
    `api_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '调用的controller中的方法',
    `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户会话sessionId',
    `trace_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '每次请求的Id',
    `elapse` int NULL DEFAULT NULL COMMENT '调用时长',
    `request_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'HTTP 请求方法，如GET',
    `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'HTTP 请求地址',
    `request_arguments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'controller接口参数',
    `response_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'controller应答结果',
    `request_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '请求IP',
    `success` bit(1) NULL DEFAULT NULL COMMENT '应答状态',
    `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '错误信息',
    `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户Id',
    `operator_id` bigint NULL DEFAULT NULL COMMENT '操作员Id',
    `operator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作员名称',
    `operation_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
    PRIMARY KEY (`log_id`) USING BTREE,
    INDEX `idx_trace_id_idx`(`trace_id` ASC) USING BTREE,
    INDEX `idx_operation_type_idx`(`operation_type` ASC) USING BTREE,
    INDEX `idx_operation_time_idx`(`operation_time` ASC) USING BTREE,
    INDEX `idx_success`(`success` ASC) USING BTREE,
    INDEX `idx_elapse`(`elapse` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
-- Table structure for zz_global_dict
-- ----------------------------
DROP TABLE IF EXISTS `zz_global_dict`;
CREATE TABLE `zz_global_dict`  (
    `dict_id` bigint NOT NULL COMMENT '主键Id',
    `dict_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字典编码',
    `dict_name` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字典中文名称',
    `create_user_id` bigint NOT NULL COMMENT '创建用户Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新用户名',
    `update_time` datetime NOT NULL COMMENT '更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除字段',
    PRIMARY KEY (`dict_id`) USING BTREE,
    INDEX `idx_dict_code`(`dict_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '全局字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zz_global_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `zz_global_dict_item`;
CREATE TABLE `zz_global_dict_item`  (
    `id` bigint NOT NULL COMMENT '主键Id',
    `dict_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字典编码',
    `item_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字典数据项Id',
    `item_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字典数据项名称',
    `show_order` int NOT NULL COMMENT '显示顺序',
    `status` int NOT NULL COMMENT '字典状态',
    `create_user_id` bigint NOT NULL COMMENT '创建用户Id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_user_id` bigint NOT NULL COMMENT '更新用户名',
    `update_time` datetime NOT NULL COMMENT '更新时间',
    `deleted_flag` int NOT NULL COMMENT '逻辑删除字段',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `idx_show_order`(`show_order` ASC) USING BTREE,
    INDEX `idx_dict_code_item_id`(`dict_code` ASC, `item_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '全局字典项目表' ROW_FORMAT = Dynamic;


-- ====================================================================================
-- 以下开始初始化基础数据
-- ====================================================================================


INSERT INTO `sdt_sys_data_perm_user` VALUES (1658771793151791104, 1658772117908361216), (1658771793151791104, 1658772234317074432), (1658771793151791104, 1658772346028167168), (1658771793151791104, 1658772481692930048), (1658771793151791104, 1658772603159973888), (1658771793151791104, 1658772704838291456), (1658771793151791104, 1663839969971539968), (1658771793151791104, 1681601052618526720), (1658771793151791104, 1681602866273325056);
INSERT INTO `sdt_sys_perm_module` VALUES (1326769584031666179, NULL, '用户权限', 0, 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1326769584052637696, NULL, '系统配置', 0, 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1326769584170078208, 1326769584031666179, '用户管理', 1, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1326943267933130752, 1326769584031666179, '部门管理', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400625106979393536, NULL, '在线表单', 0, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400625224646397952, 1400625106979393536, '数据库连接', 1, 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400625338886656000, 1400625106979393536, '页面管理', 1, 6, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400625585851469824, 1400625106979393536, '在线表单字典管理', 1, 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400625906245963776, 1400625106979393536, '数据表字段', 1, 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400626018774945792, 1400625106979393536, '字段验证规则', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400626192725315584, 1400625106979393536, '数据源管理', 1, 7, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400626237478539264, 1400625106979393536, '数据源关联', 1, 8, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400626463740268544, 1400625106979393536, '表单管理', 1, 9, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1413404952566435840, 1400625106979393536, '虚拟字段管理', 1, 10, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418028920103505920, NULL, '流程管理', 0, 6, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418029566533832704, 1418028920103505920, '流程分类', 1, 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418029615040958464, 1418028920103505920, '流程设计', 1, 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418030256765276160, 1418028920103505920, '流程操作', 1, 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418031999276290048, 1418028920103505920, '流程变量', 1, 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418038955105849344, NULL, '工单列表', 0, 7, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418051228918616064, 1418028920103505920, '启动流程', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418051634793025536, 1418028920103505920, '审批流程', 1, 6, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418054414190514176, 1418028920103505920, '流程审批数据', 1, 7, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1423635643371622400, 1418028920103505920, '已办任务', 1, 8, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966722, 1326769584031666179, '角色管理', 1, 10, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966734, 1326769584031666179, '菜单管理', 1, 25, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966742, 1326769584031666179, '权限字管理', 1, 30, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966750, 1326769584031666179, '权限模块管理', 1, 35, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966756, 1326769584031666179, '权限资源管理', 1, 40, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966765, 1326769584052637696, '字典管理', 0, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966766, 1326769584052637696, '操作日志', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966768, 1326769584052637696, '在线用户', 1, 10, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1524093415359254813, 1455562837739966765, '编码字典', 1, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554710378980577280, NULL, '报表管理', 0, 8, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554710446135578624, 1554710378980577280, '数据库链接', 1, 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554710477739659264, 1554710378980577280, '数据集', 1, 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554710511973568512, 1554710378980577280, '报表字典', 1, 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554710548925386752, 1554710378980577280, '页面管理', 1, 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554710587806584832, 1554710378980577280, '打印管理', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585837562100977664, NULL, '项目中心', 0, 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585837652362399744, NULL, '数据传输中心', 0, 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585939176879034368, 1585837652362399744, '数据源类型基础表', 1, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585939585983057920, 1585837652362399744, '离线传输登记数据源表', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585939688206635008, 1585837652362399744, '数据传输中心传输任务基础表', 1, 10, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585939793768878080, 1585837652362399744, '数据传输已选择表', 1, 15, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585939870029713408, 1585837652362399744, '数据传输单张表配置', 1, 20, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585939934454222848, 1585837652362399744, '数据传输传输任务模板', 1, 25, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585940223236247552, 1585837652362399744, '任务引用数据源表', 1, 30, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585940296338771968, 1585837562100977664, '报警组表', 1, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1585940341708558336, 1585837562100977664, '报警规则', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496380760184, 1326769584031666179, '数据权限管理', 1, 15, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496380760194, 1326769584031666179, '岗位管理', 1, 20, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1587337565957001216, NULL, '数据离线开发中心', 0, 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1587337997513134080, 1587337565957001216, '数据离线开发中心-流程编排表', 1, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1589117407291510784, 1587337565957001216, '离线开发中心-文件树', 1, 10, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1589117509540253696, 1587337565957001216, '离线开发中心-任务表', 1, 15, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1589117591664726016, 1587337565957001216, '离线开发中心-任务节点表', 1, 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1593109674872279040, 1585837652362399744, '数据传输-数据传输引擎配置', 1, 35, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1597438621466497024, 1585837652362399744, '数据传输中心Datax传输日志表', 1, 40, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1597439254462468096, 1585837652362399744, '数据传输中心Datax传输日志详情表', 1, 45, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1597801027908669440, 1585837562100977664, '项目管理表', 1, 10, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1597801114147753984, 1585837562100977664, '项目人员关联表', 1, 15, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658376516855140352, 1585837562100977664, '数据项目—项目管理主表', 1, 20, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658376657146220544, 1585837562100977664, '数据项目-数据源表', 1, 25, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658376735256743936, 1585837562100977664, '数据项目-项目数据源关联表', 1, 30, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658376796426473472, 1585837562100977664, '数据项目-项目数据源模板字典表', 1, 35, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658376872318210048, 1585837562100977664, '数据项目-存算引擎表', 1, 40, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658376939573874688, 1585837562100977664, '数据项目-项目成员关联表', 1, 45, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350385856512, 1326769584052637696, '数据项目-基础附件表', 1, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1714148776878280704, 1587337565957001216, '数据开发-流程编排-liteflow规则表', 1, 0, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848286306304, 1587337565957001216, '数据开发-流程编排-liteflow脚本表', 1, 5, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714903881084833792, 1585837652362399744, '数据开发-流程编排-liteflow组件字段表', 1, 0, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417856999424, 1587337565957001216, '数据开发-liteflow节点表', 1, 5, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506163875840, 1587337565957001216, '数据开发-liteflow表达式规则表', 1, 0, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560266203136, 1587337565957001216, '数据开发-liteflow脚本表', 1, 10, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715309748485623808, 1587337565957001216, '数据开发-任务调度-任务表', 1, 5, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715964130600423424, 1585837562100977664, '项目中心-基础信息配置-远程主机', 1, 125, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216931782656, 1585837562100977664, '项目中心-数据传输引擎配置', 1, 130, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1717465853236088832, 1587337565957001216, '数据开发-自助开发控制台', 1, 20, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1719179965473230848, 1587337565957001216, '数据开发-liteflow-日志表', 1, 15, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719987882657058816, 1587337565957001216, '数据开发-AI模块-对话记录', 1, 35, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1);
INSERT INTO `sdt_sys_role_menu` VALUES (1658771613165817856, 1664572160829558784), (1658771613165817856, 1665566526628958208), (1658771613165817856, 1665566747341623296), (1658771613165817856, 1665566891147530240), (1658771613165817856, 1665567015475089408), (1658771613165817856, 1665567299299446784), (1658771613165817856, 1665616986341642240), (1658771613165817856, 1666374553430921216), (1658771613165817856, 1668917890876706816), (1658771613165817856, 1669614150491312128), (1658771613165817856, 1670982300298383360), (1658771613165817856, 1671337272374464512), (1658771613165817856, 1672809060434448384), (1658771613165817856, 1672861490132029440), (1658771613165817856, 1672861925144268800), (1666341316360933376, 1664103923784355840), (1666341316360933376, 1664571115021799424), (1666341316360933376, 1664571255686172672), (1666341316360933376, 1664571916037394432), (1666341316360933376, 1664571996865826816), (1666341316360933376, 1664572076326916096), (1666341316360933376, 1664572160829558784), (1666341316360933376, 1665566526628958208), (1666341316360933376, 1665566747341623296), (1666341316360933376, 1665566891147530240), (1666341316360933376, 1665567015475089408), (1666341316360933376, 1665567299299446784), (1666341316360933376, 1665616986341642240), (1666341488956542976, 1664571115021799424), (1666341488956542976, 1664571255686172672), (1666341488956542976, 1664571916037394432), (1666341488956542976, 1664571996865826816), (1666341488956542976, 1664572076326916096);
INSERT INTO `sdt_sys_perm_code_perm` VALUES (1400638885750378496, 1400626748101496832), (1400638885750378496, 1400626963806162944), (1400638885750378496, 1400627109692444672), (1400638885750378496, 1400632108514283520), (1400638885750378496, 1400632216169484288), (1400638885750378496, 1400632326538399744), (1400638885750378496, 1400632438635368448), (1400638885750378496, 1400632511620452352), (1400639252747784192, 1400626748101496832), (1400639252747784192, 1400626963806162944), (1400639252747784192, 1400627109692444672), (1400639252747784192, 1400632108514283520), (1400639252747784192, 1400632216169484288), (1400639252747784192, 1400633375525441536), (1400639252747784192, 1400633437093629952), (1400639252747784192, 1400633529678696448), (1400639252747784192, 1400633568027217920), (1400639252747784192, 1400633612201627648), (1400639252747784192, 1400633713376628736), (1400639252747784192, 1400633798403559424), (1400639252747784192, 1400633922085195776), (1400639252747784192, 1400634012745076736), (1400639252747784192, 1400634100498305024), (1400639252747784192, 1400634280308117504), (1400639252747784192, 1400634354593435648), (1400639252747784192, 1400634559896227840), (1400639252747784192, 1400634613151305728), (1400639252747784192, 1400634651944423424), (1400639252747784192, 1400634693472227328), (1400639252747784192, 1400634735549485056), (1400639252747784192, 1400635131969933312), (1400639252747784192, 1400635267726970880), (1400639252747784192, 1400635341274091520), (1400639252747784192, 1400635378506928128), (1400639252747784192, 1400635426808532992), (1400639252747784192, 1400635527698321408), (1400639252747784192, 1400635581532213248), (1400639252747784192, 1400635661106548736), (1400639252747784192, 1400635757332271104), (1400639252747784192, 1400635827347787776), (1400639252747784192, 1400635896461529088), (1400639252747784192, 1400635963469729792), (1400639252747784192, 1400636031752998912), (1400639252747784192, 1400636182936686592), (1400639252747784192, 1400636217728438272), (1400639252747784192, 1400636258107002880), (1400639252747784192, 1400636301480300544), (1400639252747784192, 1400636338838966272), (1400639252747784192, 1400636501900922880), (1400639252747784192, 1400636535371468800), (1400639252747784192, 1400636571165659136), (1400639252747784192, 1400636610403373056), (1400639252747784192, 1400636656679129088), (1400639252747784192, 1400637740705386496), (1400639252747784192, 1400637775962705920), (1400639252747784192, 1400637822737584128), (1400639252747784192, 1400637858414333952), (1400639252747784192, 1400637895328403456), (1400639252747784192, 1400637970863624192), (1400639252747784192, 1400637970863624193), (1400639252747784192, 1413405061278601216), (1400639252747784192, 1413405166471745536), (1400639252747784192, 1413405224021790720), (1400639252747784192, 1413405313788284928), (1400639252747784192, 1413405352866615296), (1418046848794365952, 1418030338508066816), (1418046986677915648, 1418030386436378624), (1418047095188754432, 1418030437971791872), (1418047095188754432, 1418030533757112320), (1418047182946177024, 1418030477918343168), (1418048205177753600, 1418031006660694016), (1418048335343783936, 1326769584216215552), (1418048335343783936, 1400633375525441536), (1418048335343783936, 1400635131969933312), (1418048335343783936, 1400635661106548736), (1418048335343783936, 1400636501900922880), (1418048335343783936, 1400637740705386496), (1418048335343783936, 1413405061278601216), (1418048335343783936, 1418026612762349580), (1418048335343783936, 1418031078391681024), (1418048335343783936, 1418031120481521664), (1418048335343783936, 1418031174604820480), (1418048335343783936, 1418031219706171392), (1418048335343783936, 1418031304779239424), (1418048335343783936, 1418031515207471104), (1418048335343783936, 1418031648351457280), (1418048335343783936, 1418031712788549632), (1418048335343783936, 1418031801271586816), (1418048335343783936, 1418032222232907776), (1418048335343783936, 1418032258429751296), (1418048335343783936, 1418032300414734336), (1418048335343783936, 1418032344064856064), (1418048335343783936, 1418032382409183232), (1418048335343783936, 1418054519798894592), (1418049164754817024, 1418033804987076608), (1418049164754817024, 1418034243434450944), (1418049164754817024, 1418035997727264768), (1418049164754817024, 1418054519798894592), (1418049164754817024, 1418054792965525504), (1418049287106859008, 1418040510253109248), (1418049287106859008, 1418040574245605377), (1418049398776008704, 1418040574245605376), (1418050322282057728, 1400637970863624192), (1418050322282057728, 1418026612762349572), (1418050322282057728, 1418051693639110656), (1418050322282057728, 1418054128097038336), (1418050322282057728, 1418054519798894592), (1418050322282057728, 1418054618176294912), (1418050322282057728, 1418054792965525504), (1418050322282057728, 1418055060981551104), (1418050322282057728, 1418056212146032640), (1418050322282057728, 1418079603167072256), (1418050322282057728, 1418079670594703360), (1418050797706416128, 1400637970863624192), (1418050797706416128, 1418026612762349572), (1418050797706416128, 1418051334564745215), (1418050797706416128, 1418051334564745216), (1418050797706416128, 1418051485324808192), (1418050797706416128, 1418054519798894592), (1418050797706416128, 1418079603167072256), (1418050797706416128, 1418079670594703360), (1418057346877231104, 1400637970863624192), (1418057346877231104, 1418033889183535104), (1418057346877231104, 1418034243434450944), (1418057346877231104, 1418035997727264768), (1418057346877231104, 1418054519798894592), (1418057346877231104, 1418054618176294912), (1418057346877231104, 1418054792965525504), (1418057346877231104, 1418079670594703360), (1423637544578322432, 1400637775962705920), (1423637544578322432, 1400637970863624192), (1423637544578322432, 1418034243434450944), (1423637544578322432, 1418054519798894592), (1423637544578322432, 1418054618176294912), (1423637544578322432, 1418054792965525504), (1423637544578322432, 1423635764486344704), (1423637544578322432, 1423635851312631808), (1423637544578322432, 1423636091033882624), (1455562837739966780, 1326769584216215552), (1455562837739966780, 1326769584216215557), (1455562837739966781, 1326769584195244032), (1455562837739966781, 1326943267958296576), (1455562837739966781, 1455562837739966726), (1455562837739966781, 1586348496380760188), (1455562837739966782, 1326769584199438344), (1455562837739966782, 1326769584216215562), (1455562837739966782, 1326769584216215564), (1455562837739966782, 1326943267958296576), (1455562837739966782, 1455562837739966726), (1455562837739966782, 1586348496380760188), (1455562837739966783, 1326769584199438357), (1455562837739966784, 1326769584228798464), (1455562837739966785, 1455562837735772177), (1455562837739966785, 1455562837735772178), (1455562837739966785, 1455562837735772179), (1455562837739966798, 1455562837739966726), (1455562837739966799, 1455562837739966730), (1455562837739966800, 1455562837739966723), (1455562837739966800, 1455562837739966738), (1455562837739966801, 1455562837739966724), (1455562837739966801, 1455562837739966727), (1455562837739966801, 1455562837739966738), (1455562837739966802, 1455562837739966725), (1455562837739966803, 1455562837739966732), (1455562837739966803, 1455562837739966733), (1455562837739966804, 1455562837739966728), (1455562837739966804, 1455562837739966731), (1455562837739966805, 1455562837739966729), (1455562837744160775, 1455562837739966738), (1455562837744160776, 1455562837739966735), (1455562837744160776, 1455562837739966746), (1455562837744160777, 1455562837739966737), (1455562837744160777, 1455562837739966739), (1455562837744160777, 1455562837739966746), (1455562837744160778, 1455562837739966736), (1455562837744160779, 1455562837739966740), (1455562837744160779, 1455562837739966741), (1455562837744160787, 1455562837739966746), (1455562837744160788, 1455562837739966743), (1455562837744160788, 1455562837739966755), (1455562837744160789, 1455562837739966744), (1455562837744160789, 1455562837739966747), (1455562837744160789, 1455562837739966755), (1455562837744160790, 1455562837739966745), (1455562837744160791, 1455562837739966748), (1455562837744160791, 1455562837739966749), (1455562837744160802, 1455562837739966754), (1455562837744160802, 1455562837739966755), (1455562837744160802, 1455562837739966760), (1455562837744160803, 1455562837739966751), (1455562837744160804, 1455562837739966752), (1455562837744160805, 1455562837739966753), (1455562837744160806, 1455562837739966757), (1455562837744160807, 1455562837739966758), (1455562837744160807, 1455562837739966761), (1455562837744160808, 1455562837739966759), (1455562837744160809, 1455562837739966762), (1455562837744160809, 1455562837739966763), (1455562837744160809, 1455562837739966764), (1455562837744160817, 1524093415359254814), (1455562837744160817, 1524093415359254815), (1455562837744160817, 1524093415359254816), (1455562837744160817, 1524093415359254817), (1455562837744160817, 1524093415359254818), (1455562837744160817, 1524093415359254819), (1455562837744160817, 1524093415359254820), (1455562837744160817, 1524093415359254821), (1455562837744160817, 1524093415359254822), (1455562837744160829, 1326943267958296576), (1455562837744160829, 1326943267958296579), (1455562837744160830, 1326943267945713664), (1455562837744160831, 1326943267945713673), (1455562837744160831, 1326943267958296582), (1455562837744160831, 1326943267958296584), (1455562837744160832, 1326943267945713683), (1455562837744160857, 1455562837739966767), (1455562837752549380, 1455562837739966769), (1455562837752549381, 1455562837739966770), (1554726340651913216, 1554717427672027136), (1554726340651913216, 1554717622459699200), (1554726340651913216, 1554717789288140800), (1554726340651913216, 1554717855218405376), (1554726340651913216, 1554717978610634752), (1554726340651913216, 1554718073343184896), (1554726340651913216, 1554718132738723840), (1554726553307320320, 1554718534498521088), (1554726553307320320, 1554718632628457472), (1554726553307320320, 1554718738668851200), (1554726553307320320, 1554718811645546496), (1554726553307320320, 1554718884211200000), (1554726553307320320, 1554718940217741312), (1554726553307320320, 1554719078365532160), (1554726553307320320, 1554719652452503552), (1554726553307320320, 1554719744387452928), (1554726553307320320, 1554719885425119232), (1554726553307320320, 1554719953398009856), (1554726553307320320, 1554720039972638720), (1554726553307320320, 1554720095681384448), (1554726553307320320, 1554720171346628608), (1554726553307320320, 1554720240657502208), (1554726553307320320, 1554720307367907328), (1554726553307320320, 1554720458106998784), (1554726553307320320, 1554720524880318464), (1554726553307320320, 1554720603116670976), (1554726553307320320, 1554720870532911104), (1554726553307320320, 1554721025319505920), (1554726553307320320, 1554721109998309376), (1554726553307320320, 1554721183985831936), (1554726553307320320, 1554721246254469120), (1554726553307320320, 1554721309169029120), (1554726790662983680, 1554721479340331008), (1554726790662983680, 1554721528308830208), (1554726790662983680, 1554721583023525888), (1554726790662983680, 1554721637834690560), (1554726790662983680, 1554721677357617152), (1554726790662983680, 1554721712493301760), (1554727015674810368, 1554722515568300032), (1554727015674810368, 1554722594861617152), (1554727015674810368, 1554722654299099136), (1554727015674810368, 1554722702600704000), (1554727015674810368, 1554722766639337472), (1554727015674810368, 1554723275840425984), (1554727015674810368, 1554723330630619136), (1554727015674810368, 1554723401271087104), (1554727015674810368, 1554723478400143360), (1554727015674810368, 1554723557882204160), (1554727015674810368, 1554723557882204161), (1554727372329062400, 1554723681328959488), (1554727372329062400, 1554723744721670144), (1554727372329062400, 1554723827257184256), (1554727372329062400, 1554723874053033984), (1554727372329062400, 1554723926486028288), (1554727372329062400, 1554724415441211392), (1554727372329062400, 1554724461742133248), (1554727372329062400, 1554724517337632768), (1554727372329062400, 1554724561985998848), (1554727372329062400, 1554724697793368064), (1586348496418508813, 1586348496376565786), (1586348496418508813, 1586348496376565787), (1586348496418508813, 1586348496380760064), (1586348496418508813, 1586348496380760065), (1586348496418508813, 1586348496380760066), (1586348496418508813, 1586348496380760067), (1586348496418508814, 1586348496380760065), (1586348496418508814, 1586348496380760067), (1586348496422703123, 1586348496380760188), (1586348496422703124, 1586348496380760192), (1586348496422703125, 1586348496380760185), (1586348496422703126, 1586348496380760186), (1586348496422703126, 1586348496380760189), (1586348496422703127, 1586348496380760187), (1586348496426897408, 1586348496380760190), (1586348496426897408, 1586348496380760193), (1586348496426897409, 1586348496380760191), (1586348496426897417, 1586348496380760198), (1586348496426897418, 1586348496380760195), (1586348496426897419, 1586348496380760196), (1586348496426897419, 1586348496380760199), (1586348496426897420, 1586348496380760197), (1639622659975155712, 1400626748101496832), (1639622659975155712, 1639621697092980736), (1639622659975155712, 1639621809328361472), (1639622659975155712, 1639621889154355200), (1639622659975155712, 1639621941444743168), (1639625791975198720, 1639625448801439744), (1664177339526811648, 1658376516884500480), (1664177339526811648, 1658376516884500514), (1664177339526811648, 1658376516884500516), (1664177339526811648, 1658377283083177984), (1664177339526811648, 1658377283095760899), (1664177339526811648, 1658377283095760918), (1664177339526811648, 1658377283095760925), (1664177339526811648, 1658377609643298816), (1664177339526811648, 1658377609655881731), (1664177339526811648, 1658377609655881750), (1664177339526811648, 1658377609655881769), (1664177339526811648, 1658378740524126259), (1664177339526811648, 1658378740524126260), (1664177339526811648, 1658378740524126261), (1664177631362289664, 1658376516863528960), (1664177631362289664, 1658376516863528995), (1664177631362289664, 1658377283095760896), (1664177631362289664, 1658377609655881728), (1664177631362289664, 1658378740524126208), (1664177631362289664, 1658378740524126210), (1664177631362289664, 1658378740524126226), (1664177957574283264, 1658376516863528976), (1664177957574283264, 1658377283095760902), (1664177957574283264, 1658377609655881734), (1664177957574283264, 1658378740524126242), (1664178230367621120, 1658376516863528993), (1664178230367621120, 1658376516863528996), (1664178230367621120, 1658377283095760913), (1664178230367621120, 1658377283095760916), (1664178230367621120, 1658377609655881745), (1664178230367621120, 1658377609655881748), (1664190027812311040, 1658376657179774976), (1664190027812311040, 1658376657179775012), (1664190027812311040, 1658376735281909760), (1664190027812311040, 1658376735281909780), (1664190349288935424, 1658376872351764480), (1664190349288935424, 1658376872351764510);
INSERT INTO `sdt_sys_user` VALUES (1326769583993917440, 'admin', '$2a$10$Kww1yvN9rXWk1UXCmdnEh.HNG6o4lTMsaeQ3AlAYVFqRifxFT/Ys6', '管理员', 1326769584031666179, NULL, 0, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1);
INSERT INTO `sdt_sys_role` VALUES (1658771613165817856, '默认角色', 1326769583993917440, '2023-05-17 17:49:06', 1326769583993917440, '2023-06-26 14:45:24', 1);
INSERT INTO `sdt_sys_dept` VALUES (1326769584031666179, NULL, '公司总部', 1, 0, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1);
INSERT INTO `sdt_sys_data_perm` VALUES (1658771793151791104, '查看全部', 0, 1326769583993917440, '2023-05-17 17:49:49', 1326769583993917440, '2023-06-02 17:56:48', 1);
INSERT INTO `sdt_sys_perm_code` VALUES (1400638673195634688, NULL, 'formOnlineDict', 0, '在线表单字典管理', 12000, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400638885750378496, 1400638673195634688, 'formOnlineDict:fragmentOnlineDict', 1, '在线表单字典管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400639030462255104, NULL, 'formOnlinePage', 0, '在线表单表单管理', 12100, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1400639252747784192, 1400639030462255104, 'formOnlinePage:fragmentOnlinePage', 1, '在线表单表单管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418046729906819072, NULL, 'formFlowCategory', 0, '流程分类', 13000, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418046848794365952, 1418046729906819072, 'formFlowCategory:formFlowCategory', 1, '流程分类', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418046986677915648, 1418046848794365952, 'formFlowCategory:formFlowCategory:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418047095188754432, 1418046848794365952, 'formFlowCategory:formFlowCategory:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418047182946177024, 1418046848794365952, 'formFlowCategory:formFlowCategory:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418048134759583744, NULL, 'formFlowEntry', 0, '流程设计', 13100, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418048205177753600, 1418048134759583744, 'formFlowEntry:formFlowEntry', 1, '流程设计', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418048335343783936, 1418048205177753600, 'formFlowEntry:formFlowEntry:update', 2, '编辑', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418048872671875072, NULL, 'formAllInstance', 0, '流程实例', 13200, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418049164754817024, 1418048872671875072, 'formAllInstance:formAllInstance', 1, '流程实例', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418049287106859008, 1418049164754817024, 'formAllInstance:formAllInstance:stop', 2, '终止', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418049398776008704, 1418049164754817024, 'formAllInstance:formAllInstance:delete', 2, '删除', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418050031436435456, NULL, 'formMyTask', 0, '我的待办', 13300, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418050322282057728, 1418050031436435456, 'formMyTask:formMyTask', 1, '我的待办', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418050797706416128, 1418048205177753600, 'formFlowEntry:formFlowEntry:start', 2, '启动', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418057020824621056, NULL, 'formMyHistoryTask', 0, '历史流程', 13400, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1418057346877231104, 1418057020824621056, 'formMyHistoryTask:formMyHistoryTask', 1, '历史流程', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1423636498195943424, NULL, 'formMyApprovedTask', 0, '已办任务', 13500, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1423637544578322432, 1423636498195943424, 'formMyApprovedTask:formMyApprovedTask', 1, '已办任务', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966779, NULL, 'formSysUser', 0, '用户管理', 10000, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966780, 1455562837739966779, 'formSysUser:fragmentSysUser', 1, '用户管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966781, 1455562837739966780, 'formSysUser:fragmentSysUser:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966782, 1455562837739966780, 'formSysUser:fragmentSysUser:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966783, 1455562837739966780, 'formSysUser:fragmentSysUser:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966784, 1455562837739966780, 'formSysUser:fragmentSysUser:resetPassword', 2, '重置密码', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966785, 1455562837739966780, 'formSysUser:fragmentSysUser:listSysUserPermDetail', 2, '权限详情', 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966797, NULL, 'formSysRole', 0, '角色管理', 10200, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966798, 1455562837739966797, 'formSysRole:fragmentSysRole', 1, '角色管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966799, 1455562837739966797, 'formSysRole:fragmentSysRoleUser', 1, '用户授权', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966800, 1455562837739966798, 'formSysRole:fragmentSysRole:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966801, 1455562837739966798, 'formSysRole:fragmentSysRole:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966802, 1455562837739966798, 'formSysRole:fragmentSysRole:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966803, 1455562837739966798, 'formSysRole:fragmentSysRole:listSysRolePermDetail', 2, '权限详情', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966804, 1455562837739966799, 'formSysRole:fragmentSysRoleUser:addUserRole', 2, '授权用户', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837739966805, 1455562837739966799, 'formSysRole:fragmentSysRoleUser:deleteUserRole', 2, '移除用户', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160774, NULL, 'formSysMenu', 0, '菜单管理', 10600, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160775, 1455562837744160774, 'formSysMenu:fragmentSysMenu', 1, '菜单管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160776, 1455562837744160775, 'formSysMenu:fragmentSysMenu:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160777, 1455562837744160775, 'formSysMenu:fragmentSysMenu:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160778, 1455562837744160775, 'formSysMenu:fragmentSysMenu:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160779, 1455562837744160775, 'formSysMenu:fragmentSysMenu:listSysMenuPermDetail', 2, '权限详情', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160786, NULL, 'formSysPermCode', 0, '权限字管理', 10700, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160787, 1455562837744160786, 'formSysPermCode:fragmentSysPermCode', 1, '权限字管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160788, 1455562837744160787, 'formSysPermCode:fragmentSysPermCode:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160789, 1455562837744160787, 'formSysPermCode:fragmentSysPermCode:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160790, 1455562837744160787, 'formSysPermCode:fragmentSysPermCode:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160791, 1455562837744160787, 'formSysPermCode:fragmentSysPermCode:listSysPermCodePermDetail', 2, '权限详情', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160801, NULL, 'formSysPerm', 0, '权限管理', 10800, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160802, 1455562837744160801, 'formSysPerm:fragmentSysPerm', 1, '权限管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160803, 1455562837744160802, 'formSysPerm:fragmentSysPerm:addPermModule', 2, '新增模块', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160804, 1455562837744160802, 'formSysPerm:fragmentSysPerm:updatePermModule', 2, '编辑模块', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160805, 1455562837744160802, 'formSysPerm:fragmentSysPerm:deletePermModule', 2, '删除模块', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160806, 1455562837744160802, 'formSysPerm:fragmentSysPerm:addPerm', 2, '新增权限', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160807, 1455562837744160802, 'formSysPerm:fragmentSysPerm:updatePerm', 2, '编辑权限', 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160808, 1455562837744160802, 'formSysPerm:fragmentSysPerm:deletePerm', 2, '删除权限', 6, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160809, 1455562837744160802, 'formSysPerm:fragmentSysPerm:listSysPermPermDetail', 2, '权限详情', 7, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160816, NULL, 'formSysDict', 0, '字典管理', 10900, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160817, 1455562837744160816, 'formSysDict:fragmentSysDict', 1, '字典管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160818, 1455562837744160817, 'formSysDict:fragmentSysDict:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160819, 1455562837744160817, 'formSysDict:fragmentSysDict:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160820, 1455562837744160817, 'formSysDict:fragmentSysDict:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160821, 1455562837744160817, 'formSysDict:fragmentSysDict:reloadCache', 2, '同步缓存', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160828, NULL, 'formSysDept', 0, '部门管理', 10100, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160829, 1455562837744160828, 'formSysDept:fragmentSysDept', 1, '部门管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160830, 1455562837744160829, 'formSysDept:fragmentSysDept:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160831, 1455562837744160829, 'formSysDept:fragmentSysDept:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160832, 1455562837744160829, 'formSysDept:fragmentSysDept:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160856, NULL, 'formSysOperationLog', 0, '操作日志', 11100, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837744160857, 1455562837744160856, 'formSysOperationLog:fragmentSysOperationLog', 1, '操作日志', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837752549379, NULL, 'formSysLoginUser', 0, '在线用户', 11200, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837752549380, 1455562837752549379, 'formSysLoginUser:fragmentLoginUser', 1, '在线用户', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1455562837752549381, 1455562837752549380, 'formSysLoginUser:fragmentLoginUser:delete', 2, '强制下线', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554726081183879168, NULL, 'formReportDblink', 0, '报表数据库链接', 14000, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554726340651913216, 1554726081183879168, 'formReportDblink:formReportDblink', 1, '报表数据库链接', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554726466460061696, NULL, 'formReportDataset', 0, '报表数据集', 14100, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554726553307320320, 1554726466460061696, 'formReportDataset:formReportDataset', 1, '报表数据集', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554726716440580096, NULL, 'formReportDict', 0, '报表字典', 14200, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554726790662983680, 1554726716440580096, 'formReportDict:formReportDict', 1, '报表字典', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554726893167579136, NULL, 'formReportPage', 0, '报表页面管理', 14300, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554727015674810368, 1554726893167579136, 'formReportPage:formReportPage', 1, '报表页面管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554727289671913472, NULL, 'formPrint', 0, '打印管理', 14400, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1554727372329062400, 1554727289671913472, 'formPrint:formPrint', 1, '打印管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496418508813, 1455562837744160829, 'formSysDept:fragmentSysDept:editPost', 2, '设置岗位', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496418508814, 1455562837744160829, 'formSysDept:fragmentSysDept:viewPost', 2, '查看岗位', 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496422703122, NULL, 'formSysDataPerm', 0, '数据权限管理', 10400, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496422703123, 1586348496422703122, 'formSysDataPerm:fragmentSysDataPerm', 1, '数据权限管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496422703124, 1586348496422703122, 'formSysDataPerm:fragmentSysDataPermUser', 1, '用户授权', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496422703125, 1586348496422703123, 'formSysDataPerm:fragmentSysDataPerm:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496422703126, 1586348496422703123, 'formSysDataPerm:fragmentSysDataPerm:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496422703127, 1586348496422703123, 'formSysDataPerm:fragmentSysDataPerm:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496426897408, 1586348496422703124, 'formSysDataPerm:fragmentSysDataPermUser:addDataPermUser', 2, '授权用户', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496426897409, 1586348496422703124, 'formSysDataPerm:fragmentSysDataPermUser:deleteDataPermUser', 2, '移除用户', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496426897416, NULL, 'formSysPost', 0, '岗位管理', 10150, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496426897417, 1586348496426897416, 'formSysPost:fragmentSysPost', 1, '岗位管理', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496426897418, 1586348496426897417, 'formSysPost:fragmentSysPost:add', 2, '新增', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496426897419, 1586348496426897417, 'formSysPost:fragmentSysPost:update', 2, '编辑', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1586348496426897420, 1586348496426897417, 'formSysPost:fragmentSysPost:delete', 2, '删除', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1639622363244924928, NULL, 'formOnlineDblink', 0, '在线表单数据库链接', 12200, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1639622659975155712, 1639622363244924928, 'formOnlineDblink:fragmentOnlineDblink', 1, '在线表单数据库链接', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1639625791975198720, 1418049164754817024, 'formAllInstance:formAllInstance:fixBusinessData', 2, '数据补偿', 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1664176553283555328, NULL, 'ProjectCenter', 0, '项目中心', 1, 1326769583993917440, '2023-06-01 15:46:24', 1326769583993917440, '2023-06-01 15:46:24', 1), (1664177339526811648, 1664176553283555328, 'ProjectCenter::ProjectMain', 1, '项目主表', 1, 1326769583993917440, '2023-06-01 15:49:31', 1326769583993917440, '2023-06-01 16:16:47', 1), (1664177631362289664, 1664177339526811648, 'ProjectCenter::ProjectMain::add', 2, '新增', 1, 1326769583993917440, '2023-06-01 15:50:41', 1326769583993917440, '2023-06-01 15:53:26', 1), (1664177957574283264, 1664177339526811648, 'ProjectCenter::ProjectMain::update', 2, '编辑', 2, 1326769583993917440, '2023-06-01 15:51:59', 1326769583993917440, '2023-06-01 15:51:59', 1), (1664178230367621120, 1664177339526811648, 'ProjectCenter::ProjectMain::delete', 2, '删除', 3, 1326769583993917440, '2023-06-01 15:53:04', 1326769583993917440, '2023-06-01 15:53:04', 1), (1664190027812311040, 1664176553283555328, 'ProjectCenter:ProjectDatasource', 1, '数据源表', 2, 1326769583993917440, '2023-06-01 16:39:56', 1326769583993917440, '2023-06-01 16:40:04', 1), (1664190349288935424, 1664176553283555328, 'ProjectCenter:projectEngine', 1, '存储引擎表', 3, 1326769583993917440, '2023-06-01 16:41:13', 1326769583993917440, '2023-06-01 16:41:13', 1);
INSERT INTO `sdt_base_business_dict` VALUES (1669617501014593536, '2023-06-16 16:06:47', '2023-06-16 16:06:47', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableType', '明细表', '模型表类型', 1), (1669617918213623808, '2023-06-16 16:08:26', '2023-06-16 16:08:26', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableType', '汇总表', '模型表类型', 2), (1669618095691403264, '2023-06-16 16:09:09', '2023-06-16 16:09:09', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableType', '维度表', '模型表类型', 3), (1669618551696134144, '2023-06-16 16:10:57', '2023-06-16 16:10:57', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableLevel', '核心', '模型表等级', 1), (1669618629567582208, '2023-06-16 16:11:16', '2023-06-16 16:11:16', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableLevel', '重要', '模型表等级', 2), (1669618690544373760, '2023-06-16 16:11:30', '2023-06-16 16:11:30', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableLevel', '普通', '模型表等级', 3), (1669618748316717056, '2023-06-16 16:11:44', '2023-06-16 16:11:44', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableLevel', '临时', '模型表等级', 4), (1669618850833895424, '2023-06-16 16:12:09', '2023-06-16 16:12:09', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelTableLevel', '备份', '模型表等级', 5), (1669619063728377856, '2023-06-16 16:16:02', '2023-06-16 16:12:59', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelUpdateCycle', '年', '模型表更新周期', 1), (1669619207882412032, '2023-06-16 16:15:52', '2023-06-16 16:13:34', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelUpdateCycle', '月', '模型表更新周期', 2), (1669619507624153088, '2023-06-16 16:14:45', '2023-06-16 16:14:45', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelUpdateCycle', '周', '模型表更新周期', 3), (1669619665803939840, '2023-06-16 16:15:23', '2023-06-16 16:15:23', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelUpdateCycle', '日', '模型表更新周期', 4), (1669619944016318464, '2023-06-16 16:16:29', '2023-06-16 16:16:29', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelUpdateCycle', '小时', '模型表更新周期', 5), (1669620013272666112, '2023-06-16 16:16:46', '2023-06-16 16:16:46', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelUpdateCycle', '无', '模型表更新周期', 6), (1669620264767328256, '2023-06-16 16:17:46', '2023-06-16 16:17:46', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelLifeCycle', '一个月（30天）', '模型表生命周期', 1), (1669620378420383744, '2023-06-16 16:18:13', '2023-06-16 16:18:13', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelLifeCycle', '三个月（90天）', '模型表生命周期', 2), (1669620985977901056, '2023-06-16 16:20:38', '2023-06-16 16:20:38', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelLifeCycle', '半年（180天）', '模型表生命周期', 3), (1669621101291900928, '2023-06-16 16:21:05', '2023-06-16 16:21:05', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelLifeCycle', '一年（365天）', '模型表生命周期', 4), (1669621158149885952, '2023-07-24 15:26:30', '2023-06-16 16:21:19', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelLifeCycle', '永久', '模型表生命周期', 5), (1670610227428331520, '2023-11-04 10:51:46', '2023-06-19 09:51:31', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelWarehouseType', 'FL', '全量', 1), (1670610319870791680, '2023-11-04 10:51:32', '2023-06-19 09:51:53', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelWarehouseType', 'IL', '增量', 2), (1670610377819295744, '2023-11-04 10:51:19', '2023-06-19 09:52:07', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelWarehouseType', 'SCD', '拉链', 3), (1670610426460639232, '2023-10-27 14:45:46', '2023-06-19 09:52:19', NULL, NULL, 1326769583993917440, 1326769584031666179, -1, NULL, 'modelWarehouseType', 'snapshot', '快照', 4), (1670610485147340800, '2023-10-27 14:45:33', '2023-06-19 09:52:33', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelWarehouseType', 'none', '无', 5), (1678613257755037696, '2023-07-11 11:52:42', '2023-07-11 11:52:42', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardCLass', 'metadataStandards', '元数据标准', 0), (1678667301404020736, '2023-07-11 15:27:27', '2023-07-11 15:27:27', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardCLass', 'newStandards', '新标准', 0), (1683377638011310080, '2023-07-24 15:24:39', '2023-07-24 15:24:39', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, -1, NULL, 'modelLifeCycle', '123', '123', 0), (1715216167938822144, '2023-10-20 11:59:36', '2023-10-20 11:59:36', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, -1, NULL, 'modelWarehouseType', '测试', '11111', NULL), (1715216455793905664, '2023-10-20 12:05:00', '2023-10-20 12:00:45', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, -1, NULL, 'modelWarehouseType', '测试', '按时打发', NULL), (1715224708552593408, '2023-10-20 12:33:33', '2023-10-20 12:33:33', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, -1, NULL, 'modelWarehouseType', '啊手动阀手动阀', '撒打发', NULL), (1715231068182810624, '2023-10-20 12:58:49', '2023-10-20 12:58:49', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, -1, NULL, 'modelWarehouseType', '啊手动阀手动阀', '撒打发', NULL), (1715275117476450304, '2023-10-20 15:53:51', '2023-10-20 15:53:51', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, -1, NULL, 'modelWarehouseType', '啊手动阀手动阀', '撒打发', 2), (1715309569422397440, '2023-10-27 16:35:49', '2023-10-20 18:10:45', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'bigint', 'bigint', 0), (1716718634350415872, '2023-10-24 15:29:52', '2023-10-24 15:29:52', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardFieldQuatityTaskState', '未上线', '未上线', 0), (1716718670551453696, '2023-10-24 15:30:01', '2023-10-24 15:30:01', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardFieldQuatityTaskState', '正常', '正常', 0), (1716718697516634112, '2023-10-24 15:30:07', '2023-10-24 15:30:07', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardFieldQuatityTaskState', '暂停', '暂停', 0), (1716718726612520960, '2023-10-24 15:30:14', '2023-10-24 15:30:14', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardFieldQuatityTaskState', '出错', '出错', 0), (1716718753200214016, '2023-10-24 15:30:21', '2023-10-24 15:30:21', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardFieldQuatityTaskState', '阻塞', '阻塞', 0), (1716718786268106752, '2023-10-24 15:30:28', '2023-10-24 15:30:28', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'standardFieldQuatityTaskState', '已下线', '已下线', 0), (1716747229038907392, '2023-10-24 17:23:30', '2023-10-24 17:23:30', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'databaseType', 'MySQL', '', 0), (1716747346559111168, '2023-10-24 17:24:03', '2023-10-24 17:23:58', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'databaseType', 'PostgreSQL', '', 1), (1716747439286784000, '2023-10-24 17:24:20', '2023-10-24 17:24:20', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'databaseType', 'Qracle', '', 0), (1716747535160184832, '2023-10-24 17:24:43', '2023-10-24 17:24:43', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'databaseType', 'SQLServer', '', 4), (1716747566294503424, '2023-10-24 17:24:50', '2023-10-24 17:24:50', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'databaseType', 'Doris', '', 0), (1716747613769830400, '2023-10-24 17:25:01', '2023-10-24 17:25:01', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'databaseType', 'ClickHouse', '', 0), (1716747646556704768, '2023-10-24 17:25:09', '2023-10-24 17:25:09', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'databaseType', 'Hive', '', 0), (1717822473849802752, '2023-10-27 16:36:08', '2023-10-27 16:36:08', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'binary', 'binary', 0), (1717822521769725952, '2023-10-27 16:36:19', '2023-10-27 16:36:19', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'bit', 'bit', 0), (1717822566434869248, '2023-10-27 16:36:30', '2023-10-27 16:36:30', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'blob', 'blob', 0), (1717822610571530240, '2023-10-27 16:36:41', '2023-10-27 16:36:41', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'char', 'char', 0), (1717822663121965056, '2023-10-27 16:36:53', '2023-10-27 16:36:53', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'date', 'date', 0), (1717822802200891392, '2023-10-27 16:37:26', '2023-10-27 16:37:26', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'datetime', 'datetime', 0), (1717822884719628288, '2023-10-27 16:37:46', '2023-10-27 16:37:46', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'decimal', 'decimal', 0), (1717822995747049472, '2023-10-27 16:38:12', '2023-10-27 16:38:12', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'double', 'double', 0), (1717823051283828736, '2023-10-27 16:38:26', '2023-10-27 16:38:26', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'enum', 'enum', 0), (1717823108364111872, '2023-10-27 16:38:39', '2023-10-27 16:38:39', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'float', 'float', 0), (1717823182573932544, '2023-10-27 16:38:57', '2023-10-27 16:38:57', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'geometry', 'geometry', 0), (1717823366552883200, '2023-10-27 16:40:08', '2023-10-27 16:39:41', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'geometrycollection', 'geometrycollection', 0), (1717823548354990080, '2023-10-27 16:40:24', '2023-10-27 16:40:24', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'int', 'int', 0), (1717823633654550528, '2023-10-27 16:40:45', '2023-10-27 16:40:45', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'integer', 'integer', 0), (1717823692135731200, '2023-10-27 16:40:58', '2023-10-27 16:40:58', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'json', 'json', 0), (1717823806304686080, '2023-10-27 16:41:54', '2023-10-27 16:41:26', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'linestring', 'linestring', 0), (1717824041705803776, '2023-10-27 16:42:22', '2023-10-27 16:42:22', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'longblob', 'longblob', 0), (1717824128087494656, '2023-10-27 16:42:42', '2023-10-27 16:42:42', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'longtext', 'longtext', 0), (1717824361735393280, '2023-10-27 16:43:38', '2023-10-27 16:43:38', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'mediumblob', 'mediumblob', 0), (1717824853085523968, '2023-10-27 16:45:35', '2023-10-27 16:45:35', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'mediumint', 'mediumint', 0), (1717824997403136000, '2023-10-27 16:47:03', '2023-10-27 16:46:10', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'mediumtext', 'mediumtext', 0), (1717825664125505536, '2023-10-27 16:48:49', '2023-10-27 16:48:49', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'multilinestring', 'multilinestring', 0), (1717825709067472896, '2023-10-27 16:48:59', '2023-10-27 16:48:59', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'multipoint', 'multipoint', 0), (1717825739471982592, '2023-10-27 16:49:07', '2023-10-27 16:49:07', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'multipolygon', 'multipolygon', 0), (1717825769255735296, '2023-10-27 16:49:14', '2023-10-27 16:49:14', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'numeric', 'numeric', 0), (1717825801228914688, '2023-10-27 16:49:21', '2023-10-27 16:49:21', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'point', 'point', 0), (1717825830471602176, '2023-10-27 16:49:28', '2023-10-27 16:49:28', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'polygon', 'polygon', 0), (1717825855041835008, '2023-10-27 16:49:34', '2023-10-27 16:49:34', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'real', 'real', 0), (1717826092871454720, '2023-10-27 16:50:31', '2023-10-27 16:50:31', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'set', 'set', 0), (1717826114321125376, '2023-10-27 16:50:36', '2023-10-27 16:50:36', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'smallint', 'smallint', 0), (1717826137024892928, '2023-10-27 16:50:41', '2023-10-27 16:50:41', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'text', 'text', 0), (1717826163662917632, '2023-10-27 16:50:48', '2023-10-27 16:50:48', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'time', 'time', 0), (1717826190099615744, '2023-10-27 16:50:54', '2023-10-27 16:50:54', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'timestamp', 'timestamp', 0), (1717826210605568000, '2023-10-27 16:50:59', '2023-10-27 16:50:59', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'tinyblob', 'tinyblob', 0), (1717826346563932160, '2023-10-27 16:51:31', '2023-10-27 16:51:31', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'tinyint', 'tinyint', 0), (1717826371062861824, '2023-10-27 16:51:37', '2023-10-27 16:51:37', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'tinytext', 'tinytext', 0), (1717826393582080000, '2023-10-27 16:51:43', '2023-10-27 16:51:43', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'varbinary', 'varbinary', 0), (1717826414855589888, '2023-10-27 16:51:48', '2023-10-27 16:51:48', 1326769583993917440, 1326769583993917440, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'varchar', 'varchar', 0), (1717826438075256832, '2023-11-04 11:31:13', '2023-10-27 16:51:53', NULL, NULL, 1326769583993917440, 1326769584031666179, 1, NULL, 'modelDesginFieldType', 'year', 'year', 0);
INSERT INTO `sdt_sys_perm` VALUES (1658377283095760896, 1658376516855140352, '新增项目成员管理', '/admin/app/projectMain/addProjectMember', 11, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377283095760899, 1658376516855140352, '详情项目成员管理', '/admin/app/projectMain/viewProjectMember', 12, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377283095760902, 1658376516855140352, '编辑项目成员管理', '/admin/app/projectMain/updateProjectMember', 13, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377283095760913, 1658376516855140352, '移除项目成员管理', '/admin/app/projectMain/deleteProjectMember', 14, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377283095760916, 1658376516855140352, '批量移除项目成员管理', '/admin/app/projectMain/deleteProjectMemberList', 15, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377283095760918, 1658376516855140352, '项目成员管理列表', '/admin/app/projectMain/listProjectMember', 16, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377283095760925, 1658376516855140352, '项目成员管理未关联列表', '/admin/app/projectMain/listNotInProjectMember', 17, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609643298816, 1658376516855140352, '查询工作流多对多关联数据项目-数据源表未添加数据列表', '/admin/app/projectMain/viewNotInProjectDatasourceRelationList/ProjectFlow', 33, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609655881728, 1658376516855140352, '新增数据项目-数据源表', '/admin/app/projectMain/addProjectDatasourceRelation', 18, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609655881731, 1658376516855140352, '详情数据项目-数据源表', '/admin/app/projectMain/viewProjectDatasourceRelation', 19, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609655881734, 1658376516855140352, '编辑数据项目-数据源表', '/admin/app/projectMain/updateProjectDatasourceRelation', 20, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609655881745, 1658376516855140352, '移除数据项目-数据源表', '/admin/app/projectMain/deleteProjectDatasourceRelation', 21, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609655881748, 1658376516855140352, '批量移除数据项目-数据源表', '/admin/app/projectMain/deleteProjectDatasourceRelationList', 22, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609655881750, 1658376516855140352, '数据项目-数据源表列表', '/admin/app/projectMain/listProjectDatasourceRelation', 23, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658377609655881769, 1658376516855140352, '数据项目-数据源表未关联列表', '/admin/app/projectMain/listNotInProjectDatasourceRelation', 24, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658378740524126208, 1658376516855140352, '发起流程', '/admin/app/projectMain/startWithBusinessKey/ProjectFlow', 25, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658378740524126210, 1658376516855140352, '发起并提交审批', '/admin/app/projectMain/startAndTakeUserTask/ProjectFlow', 26, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658378740524126226, 1658376516855140352, '发起并保存草稿', '/admin/app/projectMain/startAndSaveDraft/ProjectFlow', 27, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658378740524126242, 1658376516855140352, '提交审批', '/admin/app/projectMain/submitUserTask/ProjectFlow', 28, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658378740524126259, 1658376516855140352, '查看审批数据', '/admin/app/projectMain/viewTaskBusinessData/ProjectFlow', 29, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658378740524126260, 1658376516855140352, '查看历史审批数据', '/admin/app/projectMain/viewHistoricTaskBusinessData/ProjectFlow', 30, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658378740524126261, 1658376516855140352, '查看工单列表', '/admin/app/projectMain/listWorkOrder/ProjectFlow', 31, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658386716022542348, 1658387350385856512, '数据项目-基础附件表文件下载', '/admin/app/baseFile/download', 11, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658386953936048140, 1658387350385856512, '数据项目-基础附件表文件上传', '/admin/app/baseFile/upload', 10, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350394245120, 1658387350385856512, '新增', '/admin/app/baseFile/add', 1, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350394245135, 1658387350385856512, '编辑', '/admin/app/baseFile/update', 2, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350394245151, 1658387350385856512, '删除', '/admin/app/baseFile/delete', 3, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350394245153, 1658387350385856512, '导入', '/admin/app/baseFile/import', 4, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350394245154, 1658387350385856512, '批量删除', '/admin/app/baseFile/deleteBatch', 5, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350436188160, 1658387350385856512, '显示列表', '/admin/app/baseFile/list', 6, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350436188176, 1658387350385856512, '导出', '/admin/app/baseFile/export', 7, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350436188192, 1658387350385856512, '详情', '/admin/app/baseFile/view', 8, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1658387350436188194, 1658387350385856512, '打印', '/admin/app/baseFile/print', 9, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1), (1714148776886669312, 1714148776878280704, '新增', '/admin/app/developmentLiteflowRuler/add', 1, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776886669325, 1714148776878280704, '编辑', '/admin/app/developmentLiteflowRuler/update', 2, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776886669339, 1714148776878280704, '删除', '/admin/app/developmentLiteflowRuler/delete', 3, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776886669341, 1714148776878280704, '导入', '/admin/app/developmentLiteflowRuler/import', 4, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776886669342, 1714148776878280704, '批量删除', '/admin/app/developmentLiteflowRuler/deleteBatch', 5, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776899252224, 1714148776878280704, '显示列表', '/admin/app/developmentLiteflowRuler/list', 6, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776899252237, 1714148776878280704, '导出', '/admin/app/developmentLiteflowRuler/export', 7, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776899252250, 1714148776878280704, '详情', '/admin/app/developmentLiteflowRuler/view', 8, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148776899252252, 1714148776878280704, '打印', '/admin/app/developmentLiteflowRuler/print', 9, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848294694912, 1714148848286306304, '新增', '/admin/app/developmentLiteflowScript/add', 1, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848294694927, 1714148848286306304, '编辑', '/admin/app/developmentLiteflowScript/update', 2, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848294694943, 1714148848286306304, '删除', '/admin/app/developmentLiteflowScript/delete', 3, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848294694945, 1714148848286306304, '导入', '/admin/app/developmentLiteflowScript/import', 4, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848294694946, 1714148848286306304, '批量删除', '/admin/app/developmentLiteflowScript/deleteBatch', 5, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848307277824, 1714148848286306304, '显示列表', '/admin/app/developmentLiteflowScript/list', 6, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848307277840, 1714148848286306304, '导出', '/admin/app/developmentLiteflowScript/export', 7, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848307277856, 1714148848286306304, '详情', '/admin/app/developmentLiteflowScript/view', 8, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714148848307277858, 1714148848286306304, '打印', '/admin/app/developmentLiteflowScript/print', 9, 1326769583993917440, '2023-10-17 00:00:00', 1326769583993917440, '2023-10-17 00:00:00', 1), (1714903881093222400, 1714903881084833792, '新增', '/admin/app/developmentLiteflowCmpFieldJsonData/add', 1, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881093222412, 1714903881084833792, '编辑', '/admin/app/developmentLiteflowCmpFieldJsonData/update', 2, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881093222425, 1714903881084833792, '删除', '/admin/app/developmentLiteflowCmpFieldJsonData/delete', 3, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881093222427, 1714903881084833792, '导入', '/admin/app/developmentLiteflowCmpFieldJsonData/import', 4, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881093222428, 1714903881084833792, '批量删除', '/admin/app/developmentLiteflowCmpFieldJsonData/deleteBatch', 5, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881105805312, 1714903881084833792, '显示列表', '/admin/app/developmentLiteflowCmpFieldJsonData/list', 6, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881105805324, 1714903881084833792, '导出', '/admin/app/developmentLiteflowCmpFieldJsonData/export', 7, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881105805336, 1714903881084833792, '详情', '/admin/app/developmentLiteflowCmpFieldJsonData/view', 8, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1714903881105805338, 1714903881084833792, '打印', '/admin/app/developmentLiteflowCmpFieldJsonData/print', 9, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417865388032, 1715012417856999424, '新增', '/admin/app/devLiteflowNode/add', 1, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417865388044, 1715012417856999424, '编辑', '/admin/app/devLiteflowNode/update', 2, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417865388057, 1715012417856999424, '删除', '/admin/app/devLiteflowNode/delete', 3, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417865388059, 1715012417856999424, '导入', '/admin/app/devLiteflowNode/import', 4, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417865388060, 1715012417856999424, '批量删除', '/admin/app/devLiteflowNode/deleteBatch', 5, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417877970944, 1715012417856999424, '显示列表', '/admin/app/devLiteflowNode/list', 6, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417877970956, 1715012417856999424, '导出', '/admin/app/devLiteflowNode/export', 7, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417877970968, 1715012417856999424, '详情', '/admin/app/devLiteflowNode/view', 8, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012417877970970, 1715012417856999424, '打印', '/admin/app/devLiteflowNode/print', 9, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506176458752, 1715012506163875840, '新增', '/admin/app/devLiteflowRuler/add', 1, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506176458770, 1715012506163875840, '编辑', '/admin/app/devLiteflowRuler/update', 2, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506176458789, 1715012506163875840, '删除', '/admin/app/devLiteflowRuler/delete', 3, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506176458791, 1715012506163875840, '导入', '/admin/app/devLiteflowRuler/import', 4, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506176458792, 1715012506163875840, '批量删除', '/admin/app/devLiteflowRuler/deleteBatch', 5, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506189041664, 1715012506163875840, '显示列表', '/admin/app/devLiteflowRuler/list', 6, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506189041681, 1715012506163875840, '导出', '/admin/app/devLiteflowRuler/export', 7, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506189041698, 1715012506163875840, '详情', '/admin/app/devLiteflowRuler/view', 8, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012506189041700, 1715012506163875840, '打印', '/admin/app/devLiteflowRuler/print', 9, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560274591744, 1715012560266203136, '新增', '/admin/app/devLiteflowScript/add', 1, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560274591759, 1715012560266203136, '编辑', '/admin/app/devLiteflowScript/update', 2, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560274591775, 1715012560266203136, '删除', '/admin/app/devLiteflowScript/delete', 3, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560274591777, 1715012560266203136, '导入', '/admin/app/devLiteflowScript/import', 4, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560274591778, 1715012560266203136, '批量删除', '/admin/app/devLiteflowScript/deleteBatch', 5, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560287174656, 1715012560266203136, '显示列表', '/admin/app/devLiteflowScript/list', 6, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560287174671, 1715012560266203136, '导出', '/admin/app/devLiteflowScript/export', 7, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560287174686, 1715012560266203136, '详情', '/admin/app/devLiteflowScript/view', 8, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715012560287174688, 1715012560266203136, '打印', '/admin/app/devLiteflowScript/print', 9, 1326769583993917440, '2023-10-19 00:00:00', 1326769583993917440, '2023-10-19 00:00:00', 1), (1715309748498206720, 1715309748485623808, '新增', '/admin/app/schedulingTasks/add', 1, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748498206737, 1715309748485623808, '编辑', '/admin/app/schedulingTasks/update', 2, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748498206755, 1715309748485623808, '删除', '/admin/app/schedulingTasks/delete', 3, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748498206757, 1715309748485623808, '导入', '/admin/app/schedulingTasks/import', 4, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748498206758, 1715309748485623808, '批量删除', '/admin/app/schedulingTasks/deleteBatch', 5, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748510789632, 1715309748485623808, '显示列表', '/admin/app/schedulingTasks/list', 6, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748510789650, 1715309748485623808, '导出', '/admin/app/schedulingTasks/export', 7, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748510789668, 1715309748485623808, '详情', '/admin/app/schedulingTasks/view', 8, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715309748510789670, 1715309748485623808, '打印', '/admin/app/schedulingTasks/print', 9, 1326769583993917440, '2023-10-20 00:00:00', 1326769583993917440, '2023-10-20 00:00:00', 1), (1715964130608812032, 1715964130600423424, '新增', '/admin/app/remoteHost/add', 1, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130608812046, 1715964130600423424, '编辑', '/admin/app/remoteHost/update', 2, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130608812061, 1715964130600423424, '删除', '/admin/app/remoteHost/delete', 3, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130608812063, 1715964130600423424, '导入', '/admin/app/remoteHost/import', 4, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130608812064, 1715964130600423424, '批量删除', '/admin/app/remoteHost/deleteBatch', 5, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130621394944, 1715964130600423424, '显示列表', '/admin/app/remoteHost/list', 6, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130621394958, 1715964130600423424, '导出', '/admin/app/remoteHost/export', 7, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130621394972, 1715964130600423424, '详情', '/admin/app/remoteHost/view', 8, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964130621394974, 1715964130600423424, '打印', '/admin/app/remoteHost/print', 9, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216940171264, 1715964216931782656, '新增', '/admin/app/seatunnelConfig/add', 1, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216940171275, 1715964216931782656, '编辑', '/admin/app/seatunnelConfig/update', 2, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216940171287, 1715964216931782656, '删除', '/admin/app/seatunnelConfig/delete', 3, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216940171289, 1715964216931782656, '导入', '/admin/app/seatunnelConfig/import', 4, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216940171290, 1715964216931782656, '批量删除', '/admin/app/seatunnelConfig/deleteBatch', 5, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216952754176, 1715964216931782656, '显示列表', '/admin/app/seatunnelConfig/list', 6, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216952754188, 1715964216931782656, '导出', '/admin/app/seatunnelConfig/export', 7, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216952754200, 1715964216931782656, '详情', '/admin/app/seatunnelConfig/view', 8, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715964216952754202, 1715964216931782656, '打印', '/admin/app/seatunnelConfig/print', 9, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021682073600, 1658376516855140352, '查询工作流多对多关联项目中心-基础信息配置-远程主机未添加数据列表', '/admin/app/projectMain/viewNotInProjectHostRelationList/ProjectFlow', 41, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021694656512, 1658376516855140352, '新增项目中心-基础信息配置-远程主机', '/admin/app/projectMain/addProjectHostRelation', 32, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021694656515, 1658376516855140352, '详情项目中心-基础信息配置-远程主机', '/admin/app/projectMain/viewProjectHostRelation', 33, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021694656518, 1658376516855140352, '编辑项目中心-基础信息配置-远程主机', '/admin/app/projectMain/updateProjectHostRelation', 34, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021694656529, 1658376516855140352, '移除项目中心-基础信息配置-远程主机', '/admin/app/projectMain/deleteProjectHostRelation', 35, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021694656532, 1658376516855140352, '批量移除项目中心-基础信息配置-远程主机', '/admin/app/projectMain/deleteProjectHostRelationList', 36, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021694656534, 1658376516855140352, '项目中心-基础信息配置-远程主机列表', '/admin/app/projectMain/listProjectHostRelation', 37, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1715966021694656549, 1658376516855140352, '项目中心-基础信息配置-远程主机未关联列表', '/admin/app/projectMain/listNotInProjectHostRelation', 38, 1326769583993917440, '2023-10-22 00:00:00', 1326769583993917440, '2023-10-22 00:00:00', 1), (1717465853382889472, 1717465853236088832, '新增', '/admin/app/devConsole/add', 1, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853382889484, 1717465853236088832, '编辑', '/admin/app/devConsole/update', 2, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853382889497, 1717465853236088832, '删除', '/admin/app/devConsole/delete', 3, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853382889499, 1717465853236088832, '导入', '/admin/app/devConsole/import', 4, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853382889500, 1717465853236088832, '批量删除', '/admin/app/devConsole/deleteBatch', 5, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853399666688, 1717465853236088832, '显示列表', '/admin/app/devConsole/list', 6, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853399666699, 1717465853236088832, '导出', '/admin/app/devConsole/export', 7, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853399666710, 1717465853236088832, '详情', '/admin/app/devConsole/view', 8, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1717465853399666712, 1717465853236088832, '打印', '/admin/app/devConsole/print', 9, 1326769583993917440, '2023-10-26 00:00:00', 1326769583993917440, '2023-10-26 00:00:00', 1), (1719178274543767558, 1719179965473230848, '数据开发-liteflow-日志表文件下载', '/admin/app/devLiteflowLog/download', 11, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179409140748295, 1719179965473230848, '数据开发-liteflow-日志表文件上传', '/admin/app/devLiteflowLog/upload', 10, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965481619456, 1719179965473230848, '新增', '/admin/app/devLiteflowLog/add', 1, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965481619471, 1719179965473230848, '编辑', '/admin/app/devLiteflowLog/update', 2, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965481619487, 1719179965473230848, '删除', '/admin/app/devLiteflowLog/delete', 3, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965481619489, 1719179965473230848, '导入', '/admin/app/devLiteflowLog/import', 4, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965481619490, 1719179965473230848, '批量删除', '/admin/app/devLiteflowLog/deleteBatch', 5, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965494202368, 1719179965473230848, '显示列表', '/admin/app/devLiteflowLog/list', 6, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965494202383, 1719179965473230848, '导出', '/admin/app/devLiteflowLog/export', 7, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965494202398, 1719179965473230848, '详情', '/admin/app/devLiteflowLog/view', 8, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719179965494202400, 1719179965473230848, '打印', '/admin/app/devLiteflowLog/print', 9, 1326769583993917440, '2023-10-31 00:00:00', 1326769583993917440, '2023-10-31 00:00:00', 1), (1719987882669641728, 1719987882657058816, '新增', '/admin/app/devAiChatDialogue/add', 1, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882669641741, 1719987882657058816, '编辑', '/admin/app/devAiChatDialogue/update', 2, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882669641755, 1719987882657058816, '删除', '/admin/app/devAiChatDialogue/delete', 3, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882669641757, 1719987882657058816, '导入', '/admin/app/devAiChatDialogue/import', 4, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882669641758, 1719987882657058816, '批量删除', '/admin/app/devAiChatDialogue/deleteBatch', 5, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882678030336, 1719987882657058816, '显示列表', '/admin/app/devAiChatDialogue/list', 6, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882678030350, 1719987882657058816, '导出', '/admin/app/devAiChatDialogue/export', 7, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882678030364, 1719987882657058816, '详情', '/admin/app/devAiChatDialogue/view', 8, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1), (1719987882678030366, 1719987882657058816, '打印', '/admin/app/devAiChatDialogue/print', 9, 1326769583993917440, '2023-11-02 00:00:00', 1326769583993917440, '2023-11-02 00:00:00', 1);
INSERT INTO `sdt_sys_perm_whitelist` VALUES ('/admin/app/areaCode/listDict', '行政区划', '行政区划列表'), ('/admin/app/areaCode/listDictByIds', '行政区划', '行政区划批量Id列表'), ('/admin/app/areaCode/listDictByParentId', '行政区划', '行政区划过滤列表'), ('/admin/commonext/bizwidget/list', '通用扩展', '高级业务组件列表数据'), ('/admin/commonext/bizwidget/view', '通用扩展', '高级业务组件详情数据'), ('/admin/flow/flowCategory/listDict', '流程管理', '流程分类字典'), ('/admin/flow/flowEntry/listDict', '流程管理', '流程字典'), ('/admin/flow/flowEntry/viewDict', '流程管理', '流程部分数据查看'), ('/admin/flow/flowMessage/getMessageCount', '流程管理', '查看消息数量'), ('/admin/flow/flowMessage/listCopyMessage', '流程管理', '查看抄送消息列表'), ('/admin/flow/flowMessage/listRemindingTask', '流程管理', '查看催办消息列表'), ('/admin/flow/flowOnlineOperation/listFlowEntryForm', '流程管理', '流程列表包含在线表单列表'), ('/admin/flow/flowOnlineOperation/viewCopyBusinessData', '流程管理', '查看基于在线表单流程的抄送业务数据接口'), ('/admin/flow/flowOnlineOperation/viewDraftData', '流程管理', '查看在线表单的草稿数据'), ('/admin/flow/flowOperation/cancelWorkOrder', '流程管理', '撤销工单'), ('/admin/flow/flowOperation/countRuntimeTask', '流程管理', '待办任务数量'), ('/admin/flow/flowOperation/freeJumpTo', '流程管理', '当前任务的自由跳转'), ('/admin/flow/flowOperation/listFlowTaskComment', '流程管理', '流程实例审批意见列表'), ('/admin/flow/flowOperation/listMultiSignAssignees', '流程管理', '查询会签指派人列表'), ('/admin/flow/flowOperation/listRejectCandidateUserTask', '流程管理', '列出可驳回的候选用户任务列表'), ('/admin/flow/flowOperation/rejectRuntimeTask', '流程管理', '驳回任务'), ('/admin/flow/flowOperation/rejectToStartUserTask', '流程管理', '驳回任务到发起节点'), ('/admin/flow/flowOperation/remindRuntimeTask', '流程管理', '催办任务'), ('/admin/flow/flowOperation/revokeHistoricTask', '流程管理', '撤回任务'), ('/admin/flow/flowOperation/submitConsign', '流程管理', '提交会签的加签减签'), ('/admin/flow/flowOperation/viewCopyBusinessData', '流程管理', '查看基于静态表单流程的抄送业务数据接口'), ('/admin/flow/flowOperation/viewDraftData', '流程管理', '查看静态路由表单的草稿数据'), ('/admin/flow/flowOperation/viewHighlightFlowData', '流程管理', '查看流程图高亮数据'), ('/admin/flow/flowOperation/viewHistoricTaskInfo', '流程管理', '查看历史流程任务信息'), ('/admin/flow/flowOperation/viewInitialHistoricTaskInfo', '流程管理', '查看历史流程初始化任务信息'), ('/admin/flow/flowOperation/viewInitialTaskInfo', '流程管理', '查看初始化流程任务信息'), ('/admin/flow/flowOperation/viewProcessBpmn', '流程管理', '查看流程图'), ('/admin/flow/flowOperation/viewRuntimeTaskInfo', '流程管理', '查看运行时流程任务信息'), ('/admin/flow/flowOperation/viewTaskUserInfo', '流程管理', '查看任务的用户信息列表'), ('/admin/online/onlineDblink/testConnection', '在线表单', '测试数据库链接'), ('/admin/online/onlineDict/listAllGlobalDict', '报表模块', '在线表单全局编码字典列表'), ('/admin/online/onlineOperation/getColumnRuleCode', '在线表单', '获取规则编码接口'), ('/admin/online/onlineOperation/listDict', '在线表单', '在线表单字典'), ('/admin/report/reportDataset/listByIds', '报表模块', '数据集指定Id列表'), ('/admin/report/reportDataset/listDict', '报表模块', '报表数据集字典列表'), ('/admin/report/reportDataset/listDictByIds', '报表模块', '报表数据集字典列表'), ('/admin/report/reportDatasetGroup/listAll', '报表模块', '报表数据集显示全部'), ('/admin/report/reportDblink/listDict', '报表模块', '报表数据库链接字典列表'), ('/admin/report/reportDblink/testConnection', '报表模块', '测试数据库链接'), ('/admin/report/reportDict/listAllGlobalDict', '报表模块', '报表全局编码字典列表'), ('/admin/report/reportDict/listDict', '报表模块', '报表字典列表'), ('/admin/report/reportDict/listDictData', '报表模块', '报表字典数据列表'), ('/admin/report/reportPage/view', '报表模块', '页面详情'), ('/admin/report/reportPageGroup/listAll', '报表模块', '报表页面显示全部'), ('/admin/report/reportPrint/listAll', '报表模块', '全部打印模板和打印模板分组列表'), ('/admin/upms/globalDict/listAll', '字典管理', '全局编码字典列表'), ('/admin/upms/globalDict/listDict', '字典管理', '全局编码字典列表'), ('/admin/upms/globalDict/listDictByIds', '字典管理', '全局编码字典列表'), ('/admin/upms/login/changeHeadImage', '系统管理', '修改头像'), ('/admin/upms/login/changePassword', '系统管理', '修改密码'), ('/admin/upms/login/doLogout', '登录模块', '退出登陆'), ('/admin/upms/login/downloadHeadImage', '系统管理', '下载头像'), ('/admin/upms/login/getLoginInfo', '登录模块', '获取登录信息'), ('/admin/upms/sysDept/listAllChildDeptIdByParentIds', '系统管理', '获取部门的全部下级部门Id列表'), ('/admin/upms/sysDept/listDict', '部门管理', '部门字典字典列表'), ('/admin/upms/sysDept/listDictByIds', '部门管理', '部门字典字典批量Id列表'), ('/admin/upms/sysDept/listDictByParentId', '部门管理', '部门字典下一级字典列表'), ('/admin/upms/sysDept/listSysDeptPostWithRelation', '系统管理', '部门岗位关联列表'), ('/admin/upms/sysMenu/listMenuDict', '系统管理', '菜单字典接口'), ('/admin/upms/sysPost/list', '系统管理', '岗位列表'), ('/admin/upms/sysPost/listDict', '系统管理', '岗位字典接口'), ('/admin/upms/sysPost/listDictByIds', '系统管理', '岗位字典接口'), ('/admin/upms/sysRole/listDict', '系统管理', '角色字典接口'), ('/admin/upms/sysRole/listDictByIds', '系统管理', '角色字典接口'), ('/admin/upms/sysUser/list', '系统管理', '用户列表接口'), ('/admin/upms/sysUser/listDict', '用户管理', '用户字典字典列表'), ('/admin/upms/sysUser/listDictByIds', '用户管理', '用户字典字典批量Id列表');
INSERT INTO `sdt_sys_dept_post` VALUES (1658771998261645312, 1326769584031666179, 1658771298915979264, '默认岗位');
INSERT INTO `sdt_sys_menu_perm_code` VALUES (1326769584044249093, 1455562837744160817), (1326769584044249093, 1455562837744160818), (1326769584044249093, 1455562837744160819), (1326769584044249093, 1455562837744160820), (1326769584044249093, 1455562837744160821), (1392786549942259712, 1400638885750378496), (1392786950682841088, 1400639252747784192), (1418057835631087616, 1418046848794365952), (1418058049951633408, 1418046986677915648), (1418058115667988480, 1418047095188754432), (1418058170542067712, 1418047182946177024), (1418058289182150656, 1418048205177753600), (1418058515099947008, 1418050797706416128), (1418058602723151872, 1418048335343783936), (1418058744037642240, 1418049164754817024), (1418058844164067328, 1418049287106859008), (1418058907674218496, 1418049398776008704), (1418059167532322816, 1418050322282057728), (1418059283920064512, 1418057346877231104), (1423161217970606080, 1423636498195943424), (1423161217970606080, 1423637544578322432), (1455562837739966773, 1455562837739966780), (1455562837739966774, 1455562837739966781), (1455562837739966775, 1455562837739966782), (1455562837739966776, 1455562837739966783), (1455562837739966777, 1455562837739966784), (1455562837739966778, 1455562837739966785), (1455562837739966789, 1455562837739966798), (1455562837739966790, 1455562837739966800), (1455562837739966791, 1455562837739966801), (1455562837739966792, 1455562837739966802), (1455562837739966793, 1455562837739966803), (1455562837739966794, 1455562837739966799), (1455562837739966795, 1455562837739966804), (1455562837739966796, 1455562837739966805), (1455562837744160769, 1455562837744160775), (1455562837744160770, 1455562837744160776), (1455562837744160771, 1455562837744160777), (1455562837744160772, 1455562837744160778), (1455562837744160773, 1455562837744160779), (1455562837744160781, 1455562837744160787), (1455562837744160782, 1455562837744160788), (1455562837744160783, 1455562837744160789), (1455562837744160784, 1455562837744160790), (1455562837744160785, 1455562837744160791), (1455562837744160793, 1455562837744160802), (1455562837744160794, 1455562837744160803), (1455562837744160795, 1455562837744160804), (1455562837744160796, 1455562837744160805), (1455562837744160797, 1455562837744160806), (1455562837744160798, 1455562837744160807), (1455562837744160799, 1455562837744160808), (1455562837744160800, 1455562837744160809), (1455562837744160811, 1455562837744160817), (1455562837744160812, 1455562837744160818), (1455562837744160813, 1455562837744160819), (1455562837744160814, 1455562837744160820), (1455562837744160815, 1455562837744160821), (1455562837744160824, 1455562837744160829), (1455562837744160825, 1455562837744160830), (1455562837744160826, 1455562837744160831), (1455562837744160827, 1455562837744160832), (1455562837744160855, 1455562837744160857), (1455562837752549377, 1455562837752549380), (1455562837752549378, 1455562837752549381), (1515858116057501696, 1554726081183879168), (1515858116057501696, 1554726340651913216), (1515858207237476352, 1554726466460061696), (1515858207237476352, 1554726553307320320), (1516291375656603648, 1554726716440580096), (1516291375656603648, 1554726790662983680), (1517063268609298432, 1554726893167579136), (1517063268609298432, 1554727015674810368), (1534897180643430400, 1554727289671913472), (1534897180643430400, 1554727372329062400), (1586348496418508806, 1586348496418508813), (1586348496418508807, 1586348496418508814), (1586348496422703115, 1586348496422703123), (1586348496422703116, 1586348496422703125), (1586348496422703117, 1586348496422703126), (1586348496422703118, 1586348496422703127), (1586348496422703119, 1586348496422703124), (1586348496422703120, 1586348496426897408), (1586348496422703121, 1586348496426897409), (1586348496426897412, 1586348496426897417), (1586348496426897413, 1586348496426897418), (1586348496426897414, 1586348496426897419), (1586348496426897415, 1586348496426897420), (1634009076981567488, 1639622659975155712), (1639626065007611904, 1639625791975198720), (1664571255686172672, 1664177339526811648), (1664571255686172672, 1664177631362289664), (1664571255686172672, 1664177957574283264), (1664571255686172672, 1664178230367621120), (1665566747341623296, 1455562837739966779), (1665566747341623296, 1455562837739966780), (1665566747341623296, 1455562837739966781), (1665566747341623296, 1455562837739966782), (1665566747341623296, 1455562837739966783), (1665566747341623296, 1455562837739966784), (1665566747341623296, 1455562837739966785), (1665566891147530240, 1455562837744160828), (1665566891147530240, 1455562837744160829), (1665566891147530240, 1455562837744160830), (1665566891147530240, 1455562837744160831), (1665566891147530240, 1455562837744160832), (1665566891147530240, 1586348496418508813), (1665566891147530240, 1586348496418508814), (1665567015475089408, 1586348496426897416), (1665567015475089408, 1586348496426897417), (1665567015475089408, 1586348496426897418), (1665567015475089408, 1586348496426897419), (1665567015475089408, 1586348496426897420), (1666015548212776960, 1455562837739966779), (1666015548212776960, 1455562837744160828);
INSERT INTO `sdt_sys_user_role` VALUES (1326769583993917440, 1666341316360933376);
INSERT INTO `zz_global_dict` VALUES (1658383345941221376, 'ProjectStatus', '项目状态字典', 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1);
INSERT INTO `sdt_sys_data_perm_menu` VALUES (1658771793151791104, 1326769584035860480), (1658771793151791104, 1326769584044249088), (1658771793151791104, 1326769584044249089), (1658771793151791104, 1326769584044249090), (1658771793151791104, 1326769584044249091), (1658771793151791104, 1326769584044249092), (1658771793151791104, 1326769584044249093), (1658771793151791104, 1326943267928936448), (1658771793151791104, 1381237024966578176), (1658771793151791104, 1381237024966578177), (1658771793151791104, 1585534727777947648), (1658771793151791104, 1585534727782141952);
INSERT INTO `sdt_sys_post` VALUES (1658771298915979264, '默认岗位', 1, b'0', 1326769583993917440, '2023-05-17 17:47:51', 1326769583993917440, '2023-05-17 17:47:51', 1), (1663839043021967360, '前端', 2, b'0', 1326769583993917440, '2023-05-31 17:25:15', 1326769583993917440, '2023-05-31 17:25:15', 1), (1663844985390239744, '3546', 3, b'0', 1326769583993917440, '2023-05-31 17:48:52', 1326769583993917440, '2023-05-31 17:48:52', 1), (1664083560648151040, '运维', 3, b'0', 1326769583993917440, '2023-06-01 09:36:53', 1326769583993917440, '2023-06-01 09:36:53', 1);
INSERT INTO `sdt_sys_menu` VALUES (1326769584035860480, NULL, '系统管理', '', 0, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-06-02 17:52:06', 1, NULL), (1326769584044249088, 1326769584035860480, '用户管理', '', 1, 'formSysUser', NULL, NULL, NULL, NULL, 100, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1326769584044249089, 1326769584035860480, '角色管理', '', 1, 'formSysRole', NULL, NULL, NULL, NULL, 110, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1326769584044249090, 1326769584035860480, '菜单管理', '', 1, 'formSysMenu', NULL, NULL, NULL, NULL, 120, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1326769584044249091, 1326769584035860480, '权限字管理', '', 1, 'formSysPermCode', NULL, NULL, NULL, NULL, 125, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1326769584044249092, 1326769584035860480, '权限管理', '', 1, 'formSysPerm', NULL, NULL, NULL, NULL, 130, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1326769584044249093, 1326769584035860480, '字典管理', '', 1, 'formSysDict', NULL, NULL, NULL, NULL, 135, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1326932301711413248, NULL, '用户管理', '', 0, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1326943267928936448, 1326769584035860480, '部门管理', '', 1, 'formSysDept', NULL, NULL, NULL, NULL, 105, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1327103258908430336, NULL, '计量管理', '', 0, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1327103347848646656, 1327103258908430336, '基础设置', '', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1327103394837434368, 1327103258908430336, '台账管理', '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1327103454857924608, 1327103258908430336, '周期检校', '', 0, 'PeriodicManagement', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1327103549577891840, 1327103347848646656, 'ABC分类管理', '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1327103603046879232, 1327103347848646656, '周期管理', '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1327103690254848000, 1327103347848646656, '性质分类管理', '', 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346531906270793728, 1327103454857924608, '检校计划管理', '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532065973112832, 1327103454857924608, '检校记录管理', '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532146386309120, 1327103454857924608, '检校证书管理', '', 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532254414802944, 1327103258908430336, '入库检验', '', 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532451454816256, 1346532254414802944, '检验计划管理', '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532621189910528, 1327103258908430336, '计量监管', '', 0, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532736705236992, 1346532621189910528, '巡查记录管理', '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532855307571200, 1346532621189910528, '期间核查记录管理', '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346532932952526848, 1327103258908430336, '档案管理', '', 0, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346533030977605632, 1346532932952526848, '量传依据管理', '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346533116151336960, 1346532932952526848, '法律法规管理', '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346533230962020352, 1346532932952526848, '管理标准管理', '', 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346533378710573056, 1346532932952526848, '标准考核证书管理', '', 1, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1346533473032081408, 1346532932952526848, '人员信息管理', '', 1, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', -1, NULL), (1381237024966578176, 1326769584035860480, '操作日志', '', 1, 'formSysOperationLog', NULL, NULL, NULL, NULL, 140, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1381237024966578177, 1326769584035860480, '在线用户', '', 1, 'formSysLoginUser', NULL, NULL, NULL, NULL, 145, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1392786476428693504, NULL, '在线表单', '', 0, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1392786549942259712, 1392786476428693504, '字典管理', '', 1, 'formOnlineDict', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1392786950682841088, 1392786476428693504, '表单管理', '', 1, 'formOnlinePage', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418057714138877952, NULL, '流程管理', '', 0, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418057835631087616, 1418057714138877952, '流程分类', '', 1, 'formFlowCategory', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058049951633408, 1418057835631087616, '新建', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058115667988480, 1418057835631087616, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058170542067712, 1418057835631087616, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058289182150656, 1418057714138877952, '流程设计', '', 1, 'formFlowEntry', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058515099947008, 1418058289182150656, '启动', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058602723151872, 1418058289182150656, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058744037642240, 1418057714138877952, '流程实例', '', 1, 'formAllInstance', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058844164067328, 1418058744037642240, '终止', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418058907674218496, 1418058744037642240, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418059005175009280, NULL, '任务管理', '', 0, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418059167532322816, 1418059005175009280, '待办任务', '', 1, 'formMyTask', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1418059283920064512, 1418059005175009280, '历史任务', '', 1, 'formMyHistoryTask', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1423161217970606080, 1418059005175009280, '已办任务', '', 1, 'formMyApprovedTask', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966773, 1326769584044249088, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966774, 1326769584044249088, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966775, 1326769584044249088, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966776, 1326769584044249088, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966777, 1326769584044249088, '重置密码', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966778, 1326769584044249088, '权限详情', '', 3, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966787, 1326769584044249089, '角色管理', '', 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966788, 1326769584044249089, '用户授权', '', 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966789, 1455562837739966787, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966790, 1455562837739966787, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966791, 1455562837739966787, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966792, 1455562837739966787, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966793, 1455562837739966787, '权限详情', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966794, 1455562837739966788, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966795, 1455562837739966788, '授权用户', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837739966796, 1455562837739966788, '移除用户', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160769, 1326769584044249090, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160770, 1326769584044249090, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160771, 1326769584044249090, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160772, 1326769584044249090, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160773, 1326769584044249090, '权限详情', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160781, 1326769584044249091, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160782, 1326769584044249091, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160783, 1326769584044249091, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160784, 1326769584044249091, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160785, 1326769584044249091, '权限详情', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160793, 1326769584044249092, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160794, 1326769584044249092, '新增模块', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160795, 1326769584044249092, '编辑模块', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160796, 1326769584044249092, '删除模块', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160797, 1326769584044249092, '新增权限', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160798, 1326769584044249092, '编辑权限', '', 3, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160799, 1326769584044249092, '删除权限', '', 3, NULL, NULL, NULL, NULL, NULL, 7, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160800, 1326769584044249092, '权限详情', '', 3, NULL, NULL, NULL, NULL, NULL, 8, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160811, 1326769584044249093, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160812, 1326769584044249093, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160813, 1326769584044249093, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160814, 1326769584044249093, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160815, 1326769584044249093, '同步缓存', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160824, 1326943267928936448, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160825, 1326943267928936448, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160826, 1326943267928936448, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160827, 1326943267928936448, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837744160855, 1381237024966578176, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837752549377, 1381237024966578177, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1455562837752549378, 1381237024966578177, '强制下线', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1515857992501694464, NULL, '报表管理', '', 0, NULL, NULL, NULL, NULL, NULL, 25, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1515858116057501696, 1515857992501694464, '数据库链接', '', 1, 'formReportDblink', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1515858207237476352, 1515857992501694464, '数据集', '', 1, 'formReportDataset', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1516291375656603648, 1515857992501694464, '报表字典', '', 1, 'formReportDict', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1517063268609298432, 1515857992501694464, '页面管理', '', 1, 'formReportPage', NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1534897180643430400, 1515857992501694464, '打印管理', '', 1, 'formPrintManage', NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1585534727777947648, 1326769584035860480, '数据权限管理', '', 1, 'formSysDataPerm', NULL, NULL, NULL, NULL, 115, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1585534727782141952, 1326769584035860480, '岗位管理', '', 1, 'formSysPost', NULL, NULL, NULL, NULL, 106, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496418508806, 1326943267928936448, '设置岗位', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496418508807, 1326943267928936448, '查看岗位', '', 3, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703113, 1585534727777947648, '数据权限管理', '', 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703114, 1585534727777947648, '用户授权', '', 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703115, 1586348496422703113, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703116, 1586348496422703113, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703117, 1586348496422703113, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703118, 1586348496422703113, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703119, 1586348496422703114, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703120, 1586348496422703114, '授权用户', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496422703121, 1586348496422703114, '移除用户', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496426897411, 1585534727782141952, '岗位管理', '', 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496426897412, 1586348496426897411, '显示', '', 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496426897413, 1586348496426897411, '新增', '', 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496426897414, 1586348496426897411, '编辑', '', 3, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1586348496426897415, 1586348496426897411, '删除', '', 3, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1634009076981567488, 1392786476428693504, '数据库链接', '', 1, 'formOnlineDblink', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1639626065007611904, 1418058744037642240, '数据补偿', '', 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-05-16 00:00:00', 1326769583993917440, '2023-05-16 00:00:00', 1, NULL), (1664103923784355840, NULL, '前台', '', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-06-01 10:57:48', 1326769583993917440, '2023-06-02 17:51:53', 1, NULL), (1664104184309354496, 1664103923784355840, '项目资源管理', '', 1, 'projectManagement', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-06-01 10:58:50', 1326769583993917440, '2023-06-01 16:41:33', -1, NULL), (1664482144786845696, 1664103923784355840, '成员管理', '', 1, 'memberManagement', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-06-02 12:00:43', 1326769583993917440, '2023-06-02 12:00:43', -1, NULL), (1664513970532257792, 1664103923784355840, '数据源管理', '', 1, 'project-data-resource', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-06-02 14:07:10', 1326769583993917440, '2023-06-02 14:07:10', -1, NULL), (1664514053428482048, 1664103923784355840, '存算引擎配置', '', 1, 'project-engine-manage', NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-06-02 14:07:30', 1326769583993917440, '2023-06-02 14:07:30', -1, NULL), (1664514122760327168, 1664103923784355840, '数仓规划', '', 1, 'warehousePlanning', NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-06-02 14:07:47', 1326769583993917440, '2023-06-02 14:07:47', -1, NULL), (1664570803036884992, 1664103923784355840, '数据资源', '', 1, 'dataResources', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-06-02 17:53:00', 1326769583993917440, '2023-06-02 17:53:00', -1, NULL), (1664571115021799424, 1664103923784355840, '数据资源', 'afe9db1fd7c907da14c5fb55910bb42b', 0, 'datasource', NULL, NULL, NULL, NULL, 1, 'el-icon-user-solid', 1326769583993917440, '2023-06-02 17:54:15', 1326769583993917440, '2023-11-02 20:04:49', 1, NULL), (1664571255686172672, 1664571115021799424, '项目管理信息', '6e8b947c4db3a556b95255c89caa4f7a', 1, 'project-manage', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-06-02 17:54:48', 1326769583993917440, '2023-11-02 15:59:56', 1, NULL), (1664571916037394432, 1664571115021799424, '成员管理', '62ccdb7c749f2f86e84481355da715cf', 1, 'member-manage', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-06-02 17:57:26', 1326769583993917440, '2023-11-02 16:01:12', 1, NULL), (1664571996865826816, 1664571115021799424, '数据源管理', '4c8f16362dd3e264631132a4577cf868', 1, 'project-data-resource', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-06-02 17:57:45', 1326769583993917440, '2023-07-17 15:38:49', 1, NULL), (1664572076326916096, 1664571115021799424, '存算引擎配置', '705d421e3aab53bfa7e3104ac9b79400', 1, 'project-engine-manage', NULL, NULL, NULL, NULL, 0, NULL, 1326769583993917440, '2023-06-02 17:58:04', 1326769583993917440, '2023-11-01 16:35:45', 1, NULL), (1664572160829558784, 1670982300298383360, '数据规划', '4506c2fbba8fe00dcbc94444f3820666', 1, 'data-plan', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-06-02 17:58:24', 1326769583993917440, '2023-11-02 16:05:47', 1, NULL), (1665566526628958208, 1664103923784355840, '系统管理', '4b8bc335b6ad5f9dd0d01dd303be56eb', 0, 'system-setting', NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-06-05 11:49:39', 1326769583993917440, '2023-11-02 20:03:59', 1, NULL), (1665566747341623296, 1665566526628958208, '用户管理', '4a6e4de9cdd549ed97d5f366725e3f0a', 1, 'sys-user', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-06-05 11:50:32', 1326769583993917440, '2023-11-02 17:05:47', 1, NULL), (1665566891147530240, 1665566526628958208, '部门管理', '82a5b1f63cb54cb25c00b4994e54a89c', 1, 'sys-dept', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-06-05 11:51:06', 1326769583993917440, '2023-11-02 17:06:01', 1, NULL), (1665567015475089408, 1665566526628958208, '岗位管理', '8845fae1196062cb5749aa1c669b85e2', 1, 'sys-post', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-06-05 11:51:36', 1326769583993917440, '2023-11-02 17:06:17', 1, NULL), (1665567299299446784, 1665566526628958208, '角色管理', '64c0db6a543edb5513d30d96ee559b29', 1, 'sys-role', NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-06-05 11:52:44', 1326769583993917440, '2023-11-02 17:06:30', 1, NULL), (1665616986341642240, 1665566526628958208, '菜单关咯', 'daa37474ac0089f921e79497a6354136', 1, 'sys-menu', NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-06-05 15:10:10', 1326769583993917440, '2023-11-02 17:06:44', 1, NULL), (1666012019611930624, 1664571115021799424, '(⊙﹏⊙)6也能', '', 1, 'dfh', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-06-06 17:19:53', 1326769583993917440, '2023-06-06 17:19:53', -1, NULL), (1666015548212776960, 1326769584035860480, '测试', '', 1, '3452435', NULL, NULL, NULL, NULL, 324, NULL, 1326769583993917440, '2023-06-06 17:33:54', 1326769583993917440, '2023-06-06 17:33:54', 1, NULL), (1666016058223366144, 1665566526628958208, '4图', '', 1, 'sdfgsdfg', NULL, NULL, NULL, NULL, 45, NULL, 1326769583993917440, '2023-06-06 17:35:56', 1326769583993917440, '2023-06-06 17:35:56', -1, NULL), (1666374553430921216, 1670982300298383360, '数据分层', '75eda6ad704565eeb34045da68c3a0d0', 1, 'data-layer', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-06-07 17:20:28', 1326769583993917440, '2023-11-02 16:53:09', 1, NULL), (1668895374888144896, 1664571115021799424, '数据模型', '', 0, NULL, NULL, NULL, NULL, NULL, 7, NULL, 1326769583993917440, '2023-06-14 16:17:19', 1326769583993917440, '2023-06-14 16:17:19', -1, NULL), (1668917890876706816, 1672809060434448384, '模型设计', 'b2dac08f65cbccce56e361d521eef5f3', 1, 'model-design', NULL, NULL, NULL, NULL, 8, NULL, 1326769583993917440, '2023-06-14 17:46:47', 1326769583993917440, '2023-11-02 16:55:58', 1, NULL), (1669614150491312128, 1665566526628958208, '字典管理', '6248c7f2e0424914847072520c08bcd4', 1, 'business-dict', NULL, NULL, NULL, NULL, 6, NULL, 1326769583993917440, '2023-06-16 15:53:28', 1326769583993917440, '2023-11-02 17:06:53', 1, NULL), (1670982300298383360, 1664103923784355840, '数据蓝图', '495c20db82c1b0c56aec6f51b305a1b1', 0, 'data-integration', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-06-20 10:30:00', 1326769583993917440, '2023-11-03 09:41:30', 1, NULL), (1671337272374464512, 1672809060434448384, '模型概览', 'b7657f44e2139f7e056aa4698e7b8466', 1, 'model-overview', NULL, NULL, NULL, NULL, 7, NULL, 1326769583993917440, '2023-06-21 10:00:32', 1326769583993917440, '2023-11-02 16:55:04', 1, NULL), (1672809060434448384, 1670982300298383360, '数据模型', '58db617e03fec0bb2ce74b294e744b1a', 0, 'data-model', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-06-25 11:28:54', 1326769583993917440, '2023-11-03 18:25:53', 1, NULL), (1672861490132029440, 1670982300298383360, '标准规划', '5bd56eae1ebe6970fea47087c93fae9a', 0, 'standard-plan', NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-06-25 14:57:14', 1326769583993917440, '2023-11-03 18:26:07', 1, NULL), (1672861925144268800, 1672861490132029440, '标准管理', '119556533b7332bc7e255a82e3ec687e', 1, 'standard-manage', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-06-25 14:58:58', 1326769583993917440, '2023-11-02 16:58:46', 1, NULL), (1679676351088431104, 1672861490132029440, '标准概览', '23774816cda1b7b1d85d66173626edd6', 1, 'standard-overview', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-07-14 10:17:04', 1326769583993917440, '2023-11-02 16:58:02', 1, NULL), (1679685725592752128, 1670982300298383360, '指标管理', '39c59c95c3f9a1184ee203bc93cc31d8', 1, 'index-manage', NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-07-14 10:54:19', 1326769583993917440, '2023-11-02 16:59:29', 1, NULL), (1679685790348611584, 1670982300298383360, '维度管理', '60fef6a29730c442c8873ebd24256b99', 1, 'dimension-manage', NULL, NULL, NULL, NULL, 6, NULL, 1326769583993917440, '2023-07-14 10:54:34', 1326769583993917440, '2023-11-02 17:01:15', 1, NULL), (1679693286878482432, 1664103923784355840, '数据开发', '9a63b6cd9c20fca9067e9b436a8ec496', 0, 'dataDevelopment', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-07-14 11:24:21', 1326769583993917440, '2023-11-02 20:04:22', 1, NULL), (1679693356873027584, 1679693286878482432, '数据传输', 'b07de0a4c8dbaed8c2e7361344f53ae6', 1, 'dataTransmission', NULL, NULL, NULL, NULL, 1, NULL, 1326769583993917440, '2023-07-14 11:24:38', 1326769583993917440, '2023-07-14 11:24:38', -1, NULL), (1679693407968038912, 1679693286878482432, '数据来源', 'b0dfa640bf65a33c31c6cc2a0b5bde59', 1, 'dataSource', NULL, NULL, NULL, NULL, 2, NULL, 1326769583993917440, '2023-07-14 11:24:50', 1326769583993917440, '2023-07-14 11:24:50', -1, NULL), (1679693467246137344, 1679693286878482432, '自助开发', 'd8b1c4cd8adec860a34ff195de0ec69b', 1, 'selfDevelopment', NULL, NULL, NULL, NULL, 3, NULL, 1326769583993917440, '2023-07-14 11:25:04', 1326769583993917440, '2023-07-14 11:25:04', 1, NULL), (1714548359894667264, 1679693286878482432, '离线开发', 'c2783ccab7fe1db8c6c03cadaa868a1b', 1, 'OfflineDevelopment', NULL, NULL, NULL, NULL, 4, NULL, 1326769583993917440, '2023-10-18 15:45:58', 1326769583993917440, '2023-10-18 15:45:58', 1, NULL), (1716632698551799808, 1679693286878482432, '任务列表', '2af213d1043d558415943bd57698513a', 1, 'taskList', NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-10-24 09:48:23', 1326769583993917440, '2023-10-24 09:48:23', 1, NULL), (1720726594525335552, 1664571115021799424, '远程主机管理', '5bb3491ac6c3503336507821b6fd70a2', 1, 'remote-host', NULL, NULL, NULL, NULL, 5, NULL, 1326769583993917440, '2023-11-04 16:56:04', 1326769583993917440, '2023-11-04 16:56:04', 1, NULL);
INSERT INTO `zz_area_code` VALUES (632857000000, '大柴旦行政委员会', 3, 632800000000), (640000000000, '宁夏回族自治区', 1, NULL), (640100000000, '银川市', 2, 640000000000), (640101000000, '市辖区', 3, 640100000000), (640104000000, '兴庆区', 3, 640100000000), (640105000000, '西夏区', 3, 640100000000), (640106000000, '金凤区', 3, 640100000000), (640121000000, '永宁县', 3, 640100000000), (640122000000, '贺兰县', 3, 640100000000), (640181000000, '灵武市', 3, 640100000000), (640200000000, '石嘴山市', 2, 640000000000), (640201000000, '市辖区', 3, 640200000000), (640202000000, '大武口区', 3, 640200000000), (640205000000, '惠农区', 3, 640200000000), (640221000000, '平罗县', 3, 640200000000), (640300000000, '吴忠市', 2, 640000000000), (640301000000, '市辖区', 3, 640300000000), (640302000000, '利通区', 3, 640300000000), (640303000000, '红寺堡区', 3, 640300000000), (640323000000, '盐池县', 3, 640300000000), (640324000000, '同心县', 3, 640300000000), (640381000000, '青铜峡市', 3, 640300000000), (640400000000, '固原市', 2, 640000000000), (640401000000, '市辖区', 3, 640400000000), (640402000000, '原州区', 3, 640400000000), (640422000000, '西吉县', 3, 640400000000), (640423000000, '隆德县', 3, 640400000000), (640424000000, '泾源县', 3, 640400000000), (640425000000, '彭阳县', 3, 640400000000), (640500000000, '中卫市', 2, 640000000000), (640501000000, '市辖区', 3, 640500000000), (640502000000, '沙坡头区', 3, 640500000000), (640521000000, '中宁县', 3, 640500000000), (640522000000, '海原县', 3, 640500000000), (650000000000, '新疆维吾尔自治区', 1, NULL), (650100000000, '乌鲁木齐市', 2, 650000000000), (650101000000, '市辖区', 3, 650100000000), (650102000000, '天山区', 3, 650100000000), (650103000000, '沙依巴克区', 3, 650100000000), (650104000000, '新市区', 3, 650100000000), (650105000000, '水磨沟区', 3, 650100000000), (650106000000, '头屯河区', 3, 650100000000), (650107000000, '达坂城区', 3, 650100000000), (650109000000, '米东区', 3, 650100000000), (650121000000, '乌鲁木齐县', 3, 650100000000), (650171000000, '乌鲁木齐经济技术开发区', 3, 650100000000), (650172000000, '乌鲁木齐高新技术产业开发区', 3, 650100000000), (650200000000, '克拉玛依市', 2, 650000000000), (650201000000, '市辖区', 3, 650200000000), (650202000000, '独山子区', 3, 650200000000), (650203000000, '克拉玛依区', 3, 650200000000), (650204000000, '白碱滩区', 3, 650200000000), (650205000000, '乌尔禾区', 3, 650200000000), (650400000000, '吐鲁番市', 2, 650000000000), (650402000000, '高昌区', 3, 650400000000), (650421000000, '鄯善县', 3, 650400000000), (650422000000, '托克逊县', 3, 650400000000), (650500000000, '哈密市', 2, 650000000000), (650502000000, '伊州区', 3, 650500000000), (650521000000, '巴里坤哈萨克自治县', 3, 650500000000), (650522000000, '伊吾县', 3, 650500000000), (652300000000, '昌吉回族自治州', 2, 650000000000), (652301000000, '昌吉市', 3, 652300000000), (652302000000, '阜康市', 3, 652300000000), (652323000000, '呼图壁县', 3, 652300000000), (652324000000, '玛纳斯县', 3, 652300000000), (652325000000, '奇台县', 3, 652300000000), (652327000000, '吉木萨尔县', 3, 652300000000), (652328000000, '木垒哈萨克自治县', 3, 652300000000), (652700000000, '博尔塔拉蒙古自治州', 2, 650000000000), (652701000000, '博乐市', 3, 652700000000), (652702000000, '阿拉山口市', 3, 652700000000), (652722000000, '精河县', 3, 652700000000), (652723000000, '温泉县', 3, 652700000000), (652800000000, '巴音郭楞蒙古自治州', 2, 650000000000), (652801000000, '库尔勒市', 3, 652800000000), (652822000000, '轮台县', 3, 652800000000), (652823000000, '尉犁县', 3, 652800000000), (652824000000, '若羌县', 3, 652800000000), (652825000000, '且末县', 3, 652800000000), (652826000000, '焉耆回族自治县', 3, 652800000000), (652827000000, '和静县', 3, 652800000000), (652828000000, '和硕县', 3, 652800000000), (652829000000, '博湖县', 3, 652800000000), (652871000000, '库尔勒经济技术开发区', 3, 652800000000), (652900000000, '阿克苏地区', 2, 650000000000), (652901000000, '阿克苏市', 3, 652900000000), (652922000000, '温宿县', 3, 652900000000), (652923000000, '库车县', 3, 652900000000), (652924000000, '沙雅县', 3, 652900000000), (652925000000, '新和县', 3, 652900000000), (652926000000, '拜城县', 3, 652900000000), (652927000000, '乌什县', 3, 652900000000), (652928000000, '阿瓦提县', 3, 652900000000), (652929000000, '柯坪县', 3, 652900000000), (653000000000, '克孜勒苏柯尔克孜自治州', 2, 650000000000), (653001000000, '阿图什市', 3, 653000000000), (653022000000, '阿克陶县', 3, 653000000000), (653023000000, '阿合奇县', 3, 653000000000), (653024000000, '乌恰县', 3, 653000000000), (653100000000, '喀什地区', 2, 650000000000), (653101000000, '喀什市', 3, 653100000000), (653121000000, '疏附县', 3, 653100000000), (653122000000, '疏勒县', 3, 653100000000), (653123000000, '英吉沙县', 3, 653100000000), (653124000000, '泽普县', 3, 653100000000), (653125000000, '莎车县', 3, 653100000000), (653126000000, '叶城县', 3, 653100000000), (653127000000, '麦盖提县', 3, 653100000000), (653128000000, '岳普湖县', 3, 653100000000), (653129000000, '伽师县', 3, 653100000000), (653130000000, '巴楚县', 3, 653100000000), (653131000000, '塔什库尔干塔吉克自治县', 3, 653100000000), (653200000000, '和田地区', 2, 650000000000), (653201000000, '和田市', 3, 653200000000), (653221000000, '和田县', 3, 653200000000), (653222000000, '墨玉县', 3, 653200000000), (653223000000, '皮山县', 3, 653200000000), (653224000000, '洛浦县', 3, 653200000000), (653225000000, '策勒县', 3, 653200000000), (653226000000, '于田县', 3, 653200000000), (653227000000, '民丰县', 3, 653200000000), (654000000000, '伊犁哈萨克自治州', 2, 650000000000), (654002000000, '伊宁市', 3, 654000000000), (654003000000, '奎屯市', 3, 654000000000), (654004000000, '霍尔果斯市', 3, 654000000000), (654021000000, '伊宁县', 3, 654000000000), (654022000000, '察布查尔锡伯自治县', 3, 654000000000), (654023000000, '霍城县', 3, 654000000000), (654024000000, '巩留县', 3, 654000000000), (654025000000, '新源县', 3, 654000000000), (654026000000, '昭苏县', 3, 654000000000), (654027000000, '特克斯县', 3, 654000000000), (654028000000, '尼勒克县', 3, 654000000000), (654200000000, '塔城地区', 2, 650000000000), (654201000000, '塔城市', 3, 654200000000), (654202000000, '乌苏市', 3, 654200000000), (654221000000, '额敏县', 3, 654200000000), (654223000000, '沙湾县', 3, 654200000000), (654224000000, '托里县', 3, 654200000000), (654225000000, '裕民县', 3, 654200000000), (654226000000, '和布克赛尔蒙古自治县', 3, 654200000000), (654300000000, '阿勒泰地区', 2, 650000000000), (654301000000, '阿勒泰市', 3, 654300000000), (654321000000, '布尔津县', 3, 654300000000), (654322000000, '富蕴县', 3, 654300000000), (654323000000, '福海县', 3, 654300000000), (654324000000, '哈巴河县', 3, 654300000000), (654325000000, '青河县', 3, 654300000000), (654326000000, '吉木乃县', 3, 654300000000), (659000000000, '自治区直辖县级行政区划', 2, 650000000000), (659001000000, '石河子市', 3, 659000000000), (659002000000, '阿拉尔市', 3, 659000000000), (659003000000, '图木舒克市', 3, 659000000000), (659004000000, '五家渠市', 3, 659000000000), (659006000000, '铁门关市', 3, 659000000000);
