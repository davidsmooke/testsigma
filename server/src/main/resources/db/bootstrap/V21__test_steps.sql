DROP TABLE IF EXISTS `test_steps`;
CREATE TABLE `test_steps`
(
  `id`                      BIGINT(20) NOT NULL AUTO_INCREMENT,
  `action`                  TEXT,
  `pre_requisite`           BIGINT(20)       DEFAULT NULL,
  `priority`                VARCHAR(255)     DEFAULT 'NOT_USED',
  `step_id`                 BIGINT(20)       DEFAULT NULL,
  `test_case_id`            BIGINT(20)       DEFAULT NULL,
  `step_group_id`       BIGINT(20)       DEFAULT NULL,
  `natural_text_action_id`             INT(11) unsigned DEFAULT '0',
  `type`                    VARCHAR(255)     DEFAULT 'ACTION_TEXT',
  `kibbutz_test_data`       JSON             DEFAULT NULL,
  `kibbutz_elements`        JSON             DEFAULT NULL,
  `condition_if`            JSON             DEFAULT NULL,
  `test_data`               VARCHAR(250) COLLATE utf8_unicode_ci,
  `test_data_type`          VARCHAR(250) COLLATE utf8_unicode_ci,
  `element`                 VARCHAR(250) COLLATE utf8_unicode_ci,
  `attribute`               VARCHAR(250) COLLATE utf8_unicode_ci,
  `for_loop_start_index`    INT(11)          DEFAULT NULL,
  `for_loop_end_index`      INT(11)          DEFAULT NULL,
  `for_loop_test_data_id`   BIGINT(20)       DEFAULT NULL,
  `kibbutz_test_data_function` VARCHAR(250) COLLATE utf8_unicode_ci,
  `test_data_function_id`   BIGINT(20)       DEFAULT NULL,
  `test_data_function_args` JSON             DEFAULT NULL,
  `wait_time`               INT(4)           DEFAULT NULL,
  `condition_type`          VARCHAR(255)     DEFAULT NULL,
  `parent_id`               BIGINT(20)       DEFAULT NULL,
  `copied_from`             BIGINT(20)       DEFAULT NULL,
  `disabled`                TINYINT(1)       DEFAULT '0',
  `kibbutz_plugin_tdf_data` LONGTEXT DEFAULT NULL,
  `addon_natural_text_action_data` JSON             DEFAULT NULL,
  `addon_action_id`   BIGINT(20)       DEFAULT NULL,
  `created_date`           DATETIME         DEFAULT CURRENT_TIMESTAMP,
  `updated_date`           DATETIME         DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_test_steps_on_test_case_id` (`test_case_id`),
  CONSTRAINT `fk_step_group_id_in_test_steps_to_test_cases` FOREIGN KEY (`test_case_id`) REFERENCES `test_cases` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT fk_test_case_id_in_test_steps_to_test_cases FOREIGN KEY (step_group_id) REFERENCES test_cases (id) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8
  COLLATE utf8_unicode_ci;
