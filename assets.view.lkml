view: assets {
  sql_table_name: xpeng_asset.asset ;;

  # 主键
  dimension: asset_id {
    primary_key: yes
    sql: ${TABLE}.资产编号 ;;
    type: string
    label: "资产编号"
  }

  # 资产类型
  dimension: asset_type {
    sql: ${TABLE}.资产类型 ;;
    type: string
    label: "资产类型"
  }

  # 资产状态
  dimension: asset_status {
    sql: ${TABLE}.资产状态 ;;
    type: string
    label: "资产状态"
  }

  # 资产型号
  dimension: asset_model {
    sql: ${TABLE}.资产型号 ;;
    type: string
    label: "资产型号"
  }

  # 资产序列号
  dimension: asset_serial_number {
    sql: ${TABLE}.资产序列号 ;;
    type: string
    label: "资产序列号"
  }

  # 设备年限
  dimension: asset_life_years {
    sql: ${TABLE}.设备年限 ;;
    type: number
    label: "设备年限"
  }

  # MAC 地址1
  dimension: mac_address_1 {
    sql: ${TABLE}.MAC1 ;;
    type: string
    label: "MAC地址1"
  }

  # MAC 地址2
  dimension: mac_address_2 {
    sql: ${TABLE}.MAC2 ;;
    type: string
    label: "MAC地址2"
  }

  # 资产供应商
  dimension: supplier {
    sql: ${TABLE}.资产供应商 ;;
    type: string
    label: "资产供应商"
  }

  # 购置人
  dimension: purchaser {
    sql: ${TABLE}.购置人 ;;
    type: string
    label: "购置人"
  }

  # 购置日期
  dimension: purchase_date {
    sql: ${TABLE}.购置日期 ;;
    type: date
    label: "购置日期"
  }

  # 购入价格
  dimension: purchase_price {
    sql: ${TABLE}.购入价格 ;;
    type: number
    value_format: "¥#,##0.00"
    label: "购入价格"
  }

  # 采购单号
  dimension: purchase_order_number {
    sql: ${TABLE}.采购单号 ;;
    type: string
    label: "采购单号"
  }

  # 当前领用人
  dimension: current_user {
    sql: ${TABLE}.当前领用人 ;;
    type: string
    label: "当前领用人"
  }

  # 邮箱地址
  dimension: email {
    sql: ${TABLE}.邮箱地址 ;;
    type: string
    label: "邮箱地址"
  }

  # 工号
  dimension: employee_id {
    sql: ${TABLE}.工号 ;;
    type: string
    label: "工号"
  }

  # 合作伙伴
  dimension: partner {
    sql: ${TABLE}.合作伙伴 ;;
    type: string
    label: "合作伙伴"
  }

  # 资产配置
  dimension: asset_configuration {
    sql: ${TABLE}.资产配置 ;;
    type: string
    label: "资产配置"
  }

  # 备注
  dimension: notes {
    sql: ${TABLE}.备注 ;;
    type: string
    label: "备注"
  }

  # 地区
  dimension: region {
    sql: ${TABLE}.地区 ;;
    type: string
    label: "地区"
  }

  # 库位号
  dimension: storage_location {
    sql: ${TABLE}.库位号 ;;
    type: string
    label: "库位号"
  }

  # 财务编号
  dimension: finance_number {
    sql: ${TABLE}.财务编号 ;;
    type: string
    label: "财务编号"
  }

  # 匹配部门
  dimension: department {
    sql: ${TABLE}.匹配部门 ;;
    type: string
    label: "匹配部门"
  }

  # 预期借用归还日期
  dimension: expected_return_date {
    sql: ${TABLE}.预期借用归还日期 ;;
    type: date
    label: "预期借用归还日期"
  }

  # 分配日期
  dimension: allocation_date {
    sql: ${TABLE}.分配日期 ;;
    type: date
    label: "分配日期"
  }

  # 使用天数
  dimension: usage_days {
    sql: ${TABLE}.使用天数 ;;
    type: number
    label: "使用天数"
  }

  # 归还日期
  dimension: return_date {
    sql: ${TABLE}.归还日期 ;;
    type: date
    label: "归还日期"
  }

  # 闲置天数
  dimension: idle_days {
    sql: ${TABLE}.闲置天数 ;;
    type: number
    label: "闲置天数"
  }

  # 分配类型
  dimension: allocation_type {
    sql: ${TABLE}.分配类型 ;;
    type: string
    label: "分配类型"
  }

  # 审批单号
  dimension: approval_number {
    sql: ${TABLE}.审批单号 ;;
    type: string
    label: "审批单号"
  }

  measure: total_available_days {
    type: sum
    sql: ${usage_days} + ${idle_days} ;;
    value_format: "#,##0"
    label: "总可用天数"
  }

  measure: total_usage_days {
    type: sum
    sql: ${usage_days} ;;
    value_format: "#,##0"
    label: "总使用天数"
  }

  measure: utilization_rate {
    type: number
    sql: CASE WHEN ${total_available_days} > 0 THEN ${total_usage_days} / ${total_available_days} ELSE NULL END ;;
    value_format: "0.00%"
    label: "资产利用率"
  }

  measure: total_idle_days {
    type: sum
    sql: ${idle_days} ;;
    value_format: "#,##0"
    label: "总闲置天数"
  }

  dimension: years_used {
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), ${purchase_date}, YEAR) ;;
    label: "已使用年限"
  }

  dimension: residual_value_rate {
    type: number
    sql: 0.05 ;; # 假设残值率为5%
    label: "残值率"
  }

  dimension: residual_value {
    type: number
    sql: ${purchase_price} * ${residual_value_rate} ;;
    value_format: "¥#,##0.00"
    label: "残值"
  }

  dimension: annual_depreciation {
    type: number
    sql: (${purchase_price} - ${residual_value}) / NULLIF(${asset_life_years}, 0) ;;
    value_format: "¥#,##0.00"
    label: "年折旧额"
  }

  dimension: accumulated_depreciation {
    type: number
    sql: ${annual_depreciation} * ${years_used} ;;
    value_format: "¥#,##0.00"
    label: "累计折旧额"
  }

  dimension: depreciation_rate {
    type: number
    sql: CASE WHEN ${purchase_price} > 0 THEN ${accumulated_depreciation} / ${purchase_price} ELSE NULL END ;;
    value_format: "0.00%"
    label: "折旧率"
  }

  dimension: remaining_life_years {
    type: number
    sql: ${asset_life_years} - ${years_used} ;;
    label: "剩余寿命（年）"
  }

  dimension: residual_value {
    type: number
    sql: ${purchase_price} * ${residual_value_rate} ;;
    value_format: "¥#,##0.00"
    label: "资产残值"
  }
  dimension: asset_configuration {
    sql: ${TABLE}.资产配置 ;;
    type: string
    label: "资产配置"
  }

  # 创建一个维度，用于提取配置等级（需要根据数据格式调整）
  dimension: configuration_level {
    type: string
    sql:
    CASE
    WHEN ${asset_configuration} LIKE '%高配%' THEN '高配'
    WHEN ${asset_configuration} LIKE '%中配%' THEN '中配'
    WHEN ${asset_configuration} LIKE '%低配%' THEN '低配'
    ELSE '未知配置'
    END ;;
    label: "配置等级"
  }

  dimension: days_in_storage {
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), ${return_date}, DAY) ;;
    label: "在库天数"
  }
  derived_table: {
    sql:
    SELECT
    current_user,
    COUNT(asset_id) AS asset_count,
    COUNT(CASE WHEN asset_life_years - years_used <= 0 THEN 1 END) AS outdated_assets
    FROM
    ${TABLE}
    GROUP BY
    current_user ;;
  }

  dimension: asset_count {
    type: number
    sql: ${TABLE}.asset_count ;;
    label: "持有资产数量"
  }

  dimension: outdated_assets {
    type: number
    sql: ${TABLE}.outdated_assets ;;
    label: "陈旧资产数量"
  }

  dimension: has_multiple_assets {
    type: yesno
    sql: ${asset_count} > 1 ;;
    label: "是否持有多台设备"
  }
  # 使用衍生表计算每个部门的资产数量

  derived_table: {
    sql:
    SELECT
    department,
    COUNT(asset_id) AS department_asset_count
    FROM
    ${TABLE}
    GROUP BY
    department ;;
  }

  dimension: department_asset_count {
    type: number
    sql: ${TABLE}.department_asset_count ;;
    label: "部门资产数量"
  }

  dimension: is_overstocked_department {
    type: yesno
    sql: ${department_asset_count} > [设定的阈值] ;;
    label: "是否设备过多的部门"
  }

}
