- dashboard: asset_summary
  title: Asset Report
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  elements:
  - name: Asset Type
    type: looker_pie
    model: xpeng_asset_example
    explore: my_assets
    fields: [my_assets.asset_type, my_assets.total_purchase_price_by_asset_type]
    limit: 50
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 2
    col: 12
    width: 12
    height: 8
  - name: Asset Life Span
    type: looker_bar
    model: xpeng_asset_example
    explore: my_assets
    fields: [ my_assets.years_used,my_assets.count_of_assets]
    limit: 50
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 8

  - name: Asset Usage
    type: looker_grid
    model: xpeng_asset_example
    explore: my_assets
    fields: [my_assets.asset_id, my_assets.asset_type,my_assets.asset_status,my_assets.utilization_rate]
    filters:
      my_assets.utilization_rate: <0.1
      my_assets.asset_status: 空闲
    limit: 50
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 3
    col: 0
    width: 12
    height: 22
  - name: Asset Residual
    type: looker_pie
    model: xpeng_asset_example
    explore: my_assets
    fields: [my_assets.residual_value_rate_range, my_assets.count_of_assets]
    filters:
    limit: 50
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 8
  - name: Department Asset Summary
    type: looker_grid
    model: xpeng_asset_example
    explore: my_assets
    fields: [my_assets.department, my_assets.department_asset_count]
    filters:
      my_assets.department_asset_count: >2
      my_assets.department: -EMPTY
    limit: 50
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 2
    col: 12
    width: 12
    height: 14
  - name: Asset Tiers
    type: looker_pie
    model: xpeng_asset_example
    explore: my_assets
    fields: [my_assets.configuration_level, my_assets.count]
    filters:
      my_assets.asset_type: 台式机
    limit: 50
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 8
  - name: Asset Applied Trend
    type: looker_line
    model: xpeng_asset_example
    explore: my_assets
    fields: [my_assets.claimed_asset_count,my_assets.allocation_date_month]
    filters:
      my_assets.asset_type: 台式机
    fill_fields: [my_assets.allocation_date_month]
    sorts: [my_assets.allocation_date_month desc]
    limit: 50
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 1
    col: 0
    width: 24
    height: 8
