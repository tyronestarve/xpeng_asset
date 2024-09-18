view: my_assets {
  sql_table_name: `xpeng_asset_sync.assets` ;;

  dimension: current_user {
    type: string
    sql: ${TABLE}.`当前领用人` ;;
    label: "当前领用人"
  }

  dimension: region {
    type: string
    sql: ${TABLE}.`地区` ;;
    label: "地区"
  }

  dimension: asset_status {
    type: string
    sql: ${TABLE}.`资产状态` ;;
    label: "资产状态"
  }

  dimension: serial_number {
    type: number
    sql: ${TABLE}.`序号` ;;
    label: "序号"
  }

  dimension: asset_life_years {
    type: number
    sql: 8 ;;
    label: "设备年限"
  }

  dimension: asset_model {
    type: string
    sql: ${TABLE}.`资产型号` ;;
    label: "资产型号"
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.`备注` ;;
    label: "备注"
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.`邮箱地址` ;;
    label: "邮箱地址"
  }

  dimension: qilin_offline_days {
    type: number
    sql: ${TABLE}.`麒麟离线天数` ;;
    label: "麒麟离线天数"
  }

  dimension: financial_number {
    type: number
    sql: ${TABLE}.`财务编号` ;;
    label: "财务编号"
  }

  dimension: allocation_type {
    type: string
    sql: ${TABLE}.`分配类型` ;;
    label: "分配类型"
  }

  dimension_group: feishu_exception_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`飞书异常日期` ;;
    label: "飞书异常日期"
  }

  dimension: asset_serial_number {
    type: string
    sql: ${TABLE}.`资产序列号` ;;
    label: "资产序列号"
  }

  dimension: asset_configuration {
    type: string
    sql: ${TABLE}.`资产配置` ;;
    label: "资产配置"
  }

  dimension: purchase_price {
    type: number
    sql: ${TABLE}.`购入价格` ;;
    label: "购入价格"
  }

  dimension_group: allocation_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`分配日期` ;;
    label: "分配日期"
  }

  dimension: usage_days {
    type: number
    sql: ${TABLE}.`使用天数` ;;
    label: "使用天数"
  }

  dimension: purchaser {
    type: string
    sql: ${TABLE}.`购置人` ;;
    label: "购置人"
  }

  dimension: approval_number {
    type: string
    sql: ${TABLE}.`审批单号` ;;
    label: "审批单号"
  }

  dimension_group: expected_borrow_return_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`预期借用归还日期` ;;
    label: "预期借用归还日期"
  }

  dimension_group: return_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`归还日期` ;;
    label: "归还日期"
  }

  dimension: feishu_status {
    type: string
    sql: ${TABLE}.`飞书状态` ;;
    label: "飞书状态"
  }

  dimension: purchase_order_number {
    type: string
    sql: ${TABLE}.`采购单号` ;;
    label: "采购单号"
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.`合作伙伴` ;;
    label: "合作伙伴"
  }

  dimension: asset_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.`资产编号` ;;
    label: "资产编号"
  }

  dimension: qilin_log {
    type: string
    sql: ${TABLE}.`麒麟日志` ;;
    label: "麒麟日志"
  }

  dimension_group: purchase_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`购置日期` ;;
    label: "购置日期"
  }

  dimension: asset_supplier {
    type: string
    sql: ${TABLE}.`资产供应商` ;;
    label: "资产供应商"
  }

  dimension: storage_location {
    type: string
    sql: ${TABLE}.`库位号` ;;
    label: "库位号"
  }

  dimension: idle_days {
    type: number
    sql: ${TABLE}.`闲置天数` ;;
    label: "闲置天数"
  }

  dimension: employee_number {
    type: number
    sql: ${TABLE}.`工号` ;;
    label: "工号"
  }

  dimension: department {
    type: string
    sql: ${TABLE}.`匹配部门` ;;
    label: "匹配部门"
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.`资产类型` ;;
    label: "资产类型"
  }

  dimension: mac1 {
    type: string
    sql: ${TABLE}.MAC1 ;;
    label: "MAC1"
  }

  dimension: mac2 {
    type: string
    sql: ${TABLE}.MAC2 ;;
    label: "MAC2"
  }

  measure: count {
    type: count
    label: "记录总数"
  }

  measure: total_available_days {
    type: sum
    sql: DATE_DIFF(CURRENT_DATE(), ${purchase_date_date}, DAY) ;;
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
    sql: DATE_DIFF(CURRENT_DATE(), ${purchase_date_date}, YEAR) ;;
    label: "已使用年限"
  }
  dimension: annual_depreciation {
    type: number
    sql: ${purchase_price} * ${depreciation_rate} ;;  # 固定年折旧率为 19%
    value_format: "$#,##0.00"
    label: "年折旧额"
  }

  dimension: accumulated_depreciation {
    type: number
    sql: ${annual_depreciation} * ${years_used} ;;
    value_format: "$#,##0.00"
    label: "累计折旧额"
  }

  dimension: residual_value {
    type: number
    sql: GREATEST(0, ${purchase_price} - ${accumulated_depreciation}) ;;  # 如果残值小于 0，则等于 0
    value_format: "$#,##0.00"
    label: "残值"
  }

  dimension: depreciation_rate {
    type: number
    sql: 0.14 ;;  # 固定折旧率为 19%
    value_format: "0.00%"
    label: "折旧率"
  }

  dimension: remaining_life_years {
    type: number
    sql: ${asset_life_years} - ${years_used} ;;
    label: "剩余寿命（年）"
  }

  dimension: configuration_level {
    type: string
    sql:
      CASE
        WHEN REGEXP_CONTAINS(${asset_configuration}, r'(?i)i7') AND REGEXP_CONTAINS(${asset_configuration}, r'16G|32G') AND REGEXP_CONTAINS(${asset_configuration}, r'SSD') THEN '高配'
        WHEN REGEXP_CONTAINS(${asset_configuration}, r'(?i)i7|(?i)i5') AND REGEXP_CONTAINS(${asset_configuration}, r'8G') THEN '中配'
        WHEN REGEXP_CONTAINS(${asset_configuration}, r'(?i)i5') AND REGEXP_CONTAINS(${asset_configuration}, r'4G') THEN '低配'
        ELSE '未知配置'
      END;;
    label: "配置等级"
  }

  dimension: days_in_storage {
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), ${return_date_date}, DAY) ;;
    label: "在库天数"
  }
}
