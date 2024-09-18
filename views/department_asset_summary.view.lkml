view: department_asset_summary {
  sql_table_name: (SELECT
                      department,
                      COUNT(asset_id) AS department_asset_count
                    FROM
                      my_database.my_assets
                    GROUP BY
                      department) ;;

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
    label: "部门"
  }

  dimension: department_asset_count {
    type: number
    sql: ${TABLE}.department_asset_count ;;
    label: "部门资产数量"
  }

  dimension: is_overstocked_department {
    type: yesno
    sql: ${department_asset_count} > 100 ;; # Replace 100 with your actual threshold value
    label: "是否设备过多的部门"
  }
}
