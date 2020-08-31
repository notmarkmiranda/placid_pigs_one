require 'copy_paste_picks'

desc "Copy Pasta Picks"
task copy_pasta_picks: :environment do
  include DateHelper

  CopyPastePicks.vamonos(today)
end
