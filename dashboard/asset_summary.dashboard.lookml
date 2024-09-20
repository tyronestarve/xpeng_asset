- dashboard: asset_summary
  title: Asset Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  elements:
    - name: Asset Summary by TYpe
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
      hidden_fields: [gcp_billing_export.period_selected]
      y_axes: []
      listen: {}
      row: 3
      col: 0
      width: 8
      height: 4
