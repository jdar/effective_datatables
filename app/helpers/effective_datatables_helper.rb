module EffectiveDatatablesHelper
  def render_datatable(datatable)
    datatable.view = self 
    render :partial => 'effective/datatables/datatable', :locals => {:datatable => datatable}
  end

  def datatable_filter(datatable)
    if datatable.respond_to?(:table_filters)
      datatable.table_filters
    else
      datatable.table_columns.values.map { |options, _| options[:filter] || {:type => 'null'} }
    end.to_json()
  end

  def datatable_non_sortable(datatable)
    [].tap do |nonsortable|
      datatable.table_columns.values.each_with_index { |options, x| nonsortable << x if options[:sortable] == false }
    end.to_json()
  end

  def datatable_non_visible(datatable)
    [].tap do |nonvisible|
      datatable.table_columns.values.each_with_index { |options, x| nonvisible << x if options[:visible] == false }
    end.to_json()
  end


end
