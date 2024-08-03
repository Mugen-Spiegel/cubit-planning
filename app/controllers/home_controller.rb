class HomeController < ApplicationController


  def index
    begin
      @xlsx = Roo::Spreadsheet.open("app/data/web-dev-interview-problem-1.xlsx")
      @sheet_parser = SheetToHtmlBuilder.new(@xlsx)
      @sheet_parser.parse
    rescue => exception
        render json: {"error": exception}, status: :unprocessable_entity 
    end
  end
end
