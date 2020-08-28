desc "Copy Pasta Picks"
task copy_pasta_picks: :environment do
  include DateHelper

  CopyPastaPicks.vamonos(today)
end
