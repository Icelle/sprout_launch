require 'csv'
module Seeds
  module NationalAvgData
    class << self
      def load_data
        files = {
          height: [Rails.root + "app/assets/csv/lenage.csv", Rails.root + "app/assets/csv/lenageinf.csv"],
          weight: [Rails.root + "app/assets/csv/wtage.csv", Rails.root + "app/assets/csv/wtageinf.csv"]
        }

        files.each do |stat_type ,v|
          v.each do |filename|
            CSV.foreach(filename, :headers => true) do |row|
              data = scrub_row(row.to_hash, stat_type)
              # if data exists in db, skip row
              if NationalAverage.where(data).empty?
                NationalAverage.create!(scrub_row(row.to_hash, stat_type))
              end
            end
          end
        end
      end

      def scrub_row(row, stat_type)
        row.keep_if {|k| ["Sex", "Agemos", "L", "M", "S", "P50"].include?(k)}

        scrubbed_row = {}
        row.each do |k,v|
          if k == "Sex"
            if v == "1"
              scrubbed_row["gender"] = "M"
            else
              scrubbed_row["gender"] = "F"
            end
          else
            scrubbed_row[k.downcase] = v
          end
        end
        scrubbed_row["stat_type"] = stat_type.to_s
        scrubbed_row
      end
    end
  end
end
