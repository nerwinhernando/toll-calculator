require 'nokogiri'
require 'open-uri'

class TollRateParserService
  NLEX_SCTEX_URL = 'https://trb.gov.ph/index.php/toll-rates/nlex-toll-rate'

  def self.call
    new.execute
  end

  def execute
    Rails.logger.info "Starting toll rate update at #{Time.current}"

    begin
      doc = Nokogiri::HTML(URI.open(NLEX_SCTEX_URL))

      ActiveRecord::Base.transaction do
        parse_nlex_rates(doc)
        parse_sctex_rates(doc)
      end

      Rails.logger.info "Toll rate update completed successfully at #{Time.current}"
      true
    rescue StandardError => e
      Rails.logger.error "Error updating toll rates: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      false
    end
  end

  private

  def parse_nlex_rates(doc)
    # Find the NLEX toll rate table
    nlex_table = doc.css('table').find { |table| table.text.include?('NLEX') }
    return unless nlex_table

    nlex = Expressway.find_by!(name: 'NLEX')

    # Parse rows
    nlex_table.css('tr').each_with_index do |row, index|
      next if index == 0 # Skip header row

      cells = row.css('td').map(&:text).map(&:strip)
      next if cells.empty? || cells.all?(&:blank?)

      origin = cells[0]
      cells[1..].each_with_index do |toll_fee, dest_index|
        next if toll_fee.blank?

        # Get destination city from header row
        destination = nlex_table.css('tr')[0].css('th')[dest_index + 1].text.strip

        # Clean up city names
        origin = clean_city_name(origin)
        destination = clean_city_name(destination)

        # Find or create cities
        origin_city = City.find_or_create_by!(name: origin)
        destination_city = City.find_or_create_by!(name: destination)

        # Update toll rates for each vehicle class
        [1, 2, 3].each do |vehicle_class|
          base_toll = toll_fee.gsub(/[^\d.]/, '').to_f
          multiplier = case vehicle_class
                      when 1 then 1
                      when 2 then 2.5
                      when 3 then 3
                      end

          route = Route.find_or_initialize_by(
            expressway: nlex,
            origin: origin_city,
            destination: destination_city,
            vehicle_class: vehicle_class
          )

          route.update!(toll_fee: (base_toll * multiplier).round(2))
        end
      end
    end
  end

  def parse_sctex_rates(doc)
    # Find the SCTEX toll rate table
    sctex_table = doc.css('table').find { |table| table.text.include?('SCTEX') }
    return unless sctex_table

    sctex = Expressway.find_by!(name: 'SCTEX')

    # Similar parsing logic as NLEX
    # ... implement SCTEX parsing
  end

  def clean_city_name(name)
    # Remove common prefixes/suffixes and standardize city names
    name.gsub(/Entry\/Exit/, '')
       .gsub(/\(.*?\)/, '')
       .strip
  end
end
