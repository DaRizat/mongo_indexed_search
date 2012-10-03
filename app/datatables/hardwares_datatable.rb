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
      #iTotalDisplayRecords: hardwares.total_entries,
      aaData: data
    }
  end

private

  def data
    puts hardwares
    hardwares.map do |hardware|
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
    #hardwares = Hardware.all
    #hardwares = Hardware.page(:page => 1, :per_page => 30)
    hardwares = Hardware.page(2).per(1)
    #hardwares = Hardware.joins(:building).order("#{sort_column} #{sort_direction}")
    #hardwares = hardwares.page(page).per_page(per_page)
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