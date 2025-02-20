# to execute this task run: rake toll_rates:update
namespace :toll_rates do
  desc 'Update toll rates from TRB website'
  task update: :environment do
    if TollRateParserService.call
      puts "Toll rates updated successfully"
    else
      puts "Failed to update toll rates"
      exit 1
    end
  end
end
