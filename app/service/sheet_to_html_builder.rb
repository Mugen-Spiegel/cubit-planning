class SheetToHtmlBuilder
    attr :file, :result, :r
    def initialize(file)
        @file = file
        @result = []
        @r = []
    end

    def parse
        self.file.sheet(0).each_with_index do |row,i|
            if i <= 4 # this iteration is for header row
                unless row.compact.empty?
                    build_header(row, static_attributes["header_#{i}".to_sym])
                    self.result << build_row(self.r.join)
                else 
                    self.result << build_row(nil)
                end
            else # this iteration is for data row
                build_data(row)
                self.result << build_row(self.r.join)
            end
            
            self.r.clear()
         end
    end

    def build_header(row, static_attributes)
        row.each_with_index do |v, i|
            unless v.nil?
                puts static_attributes, i
                self.r << "<th #{static_attributes[i]}>#{v}</th>\n"
            end
        end
    end

    def build_data(row)
        row.each_with_index do |v, i|
            value = "#{(v * 100).floor(1)}%" if [1,2].include? i
            value = "$#{ActiveSupport::NumberHelper.number_to_delimited(v)} " if i > 2
            self.r << "<td #{static_attributes[:data][i] || nil}>#{value || v}</td>\n"
        end
        
    end

    def build_row(row)
        "<tr>\n#{row}</tr> \n"
    end

    def static_attributes
        {
            "header_0":[
                "class='table-secondary'  colspan='1' rowspan='4'",
                "class='table-secondary' colspan='2' rowspan='3' style='text-align:center;'",
                "",
                "colspan='8' rowspan='2' style='text-align:center;'"
            ],
            "header_2": ["colspan='2'", "colspan='2'", "colspan='2'", "colspan='2'","colspan='2'", "colspan='2'", "colspan='2'", "colspan='2'" , "colspan='2'", "colspan='2'" ],
            "header_3": ["class='table-secondary'", "class='table-secondary'", "class='table-secondary'"],
            "header_4": ["class='table-secondary'", "class='table-secondary'", "class='table-secondary'"],
            data: ["class='table-secondary'", "class='table-secondary'", "class='table-secondary'"]

        }
            
    end
end