class HardwaresDatatable
  
  include Rails.application.routes.url_helpers
  include HardwaresHelper

  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Hardware.count,
      aaData: data,
      iTotalDisplayRecords: @hardwares.count
    }
  end

private

  def data
    Rails.logger.info "Hello hardwares #{hardwares}"
    hardwares.map do |hardware|
      Rails.logger.info "Hardware map #{hardware}"
      [
        h(hardware.make),
        h(hardware.model),
        link_to(hardware.serial_number, hardware)
      ]
    end
  end

  def hardwares
    @hardwares ||= fetch_hardwares
  end

  def fetch_hardwares
    #hardwares = Hardware.order("#{sort_column} #{sort_direction}")
    hardwares = Hardware.order_by([[sort_column, sort_direction]])
    if params[:sSearch].present?
      hardwares = hardwares.full_text_search("%#{params[:sSearch]}%").page(page).per(per_page)
    else
      hardwares = hardwares.page(page).per(per_page)
    end

    hardwares
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[make model serial_number]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
