view: user_asset_summary {
  sql_table_name: (SELECT
                      current_user,
                      COUNT(asset_id) AS asset_count,
                      COUNT(CASE WHEN asset_life_years - years_used <= 0 THEN 1 END) AS outdated_assets
                    FROM
                      `my_database.my_assets`
                    GROUP BY
                      current_user) ;;

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
}
