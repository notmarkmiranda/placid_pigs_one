include DateHelper

teams = [
  {abbreviation: "ARI", city: "Arizona", name: "Diamondbacks"},
  {abbreviation: "ATL", city: "Atlanta", name: "Braves"},
  {abbreviation: "BAL", city: "Baltimore", name: "Orioles"},
  {abbreviation: "BOS", city: "Boston", name: "Red Sox"},
  {abbreviation: "CHC", city: "Chicago", name: "Cubs"},
  {abbreviation: "CWS", city: "Chicago", name: "White Sox"},
  {abbreviation: "CIN", city: "Cincinnati", name: "Reds"},
  {abbreviation: "CLE", city: "Clevand", name: "Indians"},
  {abbreviation: "COL", city: "Colorado", name: "Rockies"},
  {abbreviation: "DET", city: "Detroit", name: "Tigers"},
  {abbreviation: "FLA", city: "Florida", name: "Marlins"},
  {abbreviation: "HOU", city: "Houston", name: "Astros"},
  {abbreviation: "KAN", city: "Kansas City", name: "Royals"},
  {abbreviation: "LAA", city: "Los Angeles", name: "Angels"},
  {abbreviation: "LAD", city: "Los Angeles", name: "Dodgers"},
  {abbreviation: "MIL", city: "Milwaukee", name: "Brewers"},
  {abbreviation: "MIN", city: "Minnesota", name: "Twins"},
  {abbreviation: "NYM", city: "New York", name: "Mets"},
  {abbreviation: "NYY", city: "New York", name: "Yankees"},
  {abbreviation: "OAK", city: "Oakland", name: "Athletics"},
  {abbreviation: "PHI", city: "Philadelphia", name: "Phillies"},
  {abbreviation: "PIT", city: "Pittsburgh", name: "Pirates"},
  {abbreviation: "SD", city: "San Diego", name: "Padres"},
  {abbreviation: "SF", city: "San Francisco", name: "Giants"},
  {abbreviation: "SEA", city: "Seattle", name: "Mariners"},
  {abbreviation: "STL", city: "St. Louis", name: "Cardinals"},
  {abbreviation: "TB", city: "Tampa Bay", name: "Rays"},
  {abbreviation: "TEX", city: "Texas", name: "Rangers"},
  {abbreviation: "TOR", city: "Toronto", name: "Blue Jays"},
  {abbreviation: "WAS", city: "Washington", name: "Nationals"}
]

all_teams = teams.each_with_object({}) do |team, acc|
  new_team = Team.find_or_create_by(team)
  acc[new_team.abbreviation] = new_team
  puts "#{new_team.city} #{new_team.name}"
end

season = Season.find(1)
league = season.league

users = [
  { 
    email: "markmiranda51@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["TEX"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["OAK"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["TB"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["TEX"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["LAA"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ]
  },
  { 
    email: "spanbauer.justin@gmail.com", 
    password: SecureRandom.hex(6), 
    picks: [
      { team_id: all_teams["SF"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["LAA"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["DET"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["KAN"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["DET"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ]
  },
  { 
    email: "number1brewer@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["CLE"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["BAL"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["CWS"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ]
  },
  { 
    email: "forrest.mears@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["OAK"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["KAN"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["LAA"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["CIN"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["SEA"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["LAA"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["KAN"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ]
  },
  { 
    email: "malchowmac@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["CLE"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["DET"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["KAN"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ]
  },
  {
    email: "kyleadding1@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["CIN"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["NYM"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["TB"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id } 
    ]
  },
  { 
    email: "castanza81@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["ARI"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "joshua.mejia@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["OAK"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["TEX"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["NYM"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["SEA"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "marshall.houston@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["TB"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["OAK"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "coatsc@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["ARI"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["KAN"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["LAA"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["BAL"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "crlynne@yahoo.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["TB"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["TEX"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["CWS"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["OAK"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "aoldenburg@toppers.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["LAA"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["CLE"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["PIT"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["TEX"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "haleyeahfam@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["KAN"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["OAK"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["KAN"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["CWS"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["CIN"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["SF"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "michaeldwadley@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["CIN"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["CIN"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["SEA"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["DET"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "laceydennis@ymail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["CWS"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["OAK"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["BAL"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["SEA"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["DET"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "fenzlga@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["SF"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["WAS"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["ATL"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  },
  { 
    email: "wong13@gmail.com", 
    password: SecureRandom.hex(6),
    picks: [
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 23), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 23)).id },
      { team_id: all_teams["BOS"].id, date: Date.new(2020, 7, 24), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 24)).id },
      { team_id: all_teams["STL"].id, date: Date.new(2020, 7, 25), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 25)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 7, 26), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 26)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 7, 27), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 27)).id },
      { team_id: all_teams["NYY"].id, date: Date.new(2020, 7, 28), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 28)).id },
      { team_id: all_teams["MIL"].id, date: Date.new(2020, 7, 29), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 29)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 7, 30), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 30)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 7, 31), game_week_id: GameWeek.by_date(season, Date.new(2020, 7, 31)).id },
      { team_id: all_teams["PHI"].id, date: Date.new(2020, 8, 1), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 1)).id },
      { team_id: all_teams["HOU"].id, date: Date.new(2020, 8, 2), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 2)).id },
      { team_id: all_teams["CHC"].id, date: Date.new(2020, 8, 3), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 3)).id },
      { team_id: all_teams["LAA"].id, date: Date.new(2020, 8, 4), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 4)).id },
      { team_id: all_teams["COL"].id, date: Date.new(2020, 8, 5), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 5)).id },
      { team_id: all_teams["MIN"].id, date: Date.new(2020, 8, 6), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 6)).id },
      { team_id: all_teams["LAD"].id, date: Date.new(2020, 8, 7), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 7)).id },
      { team_id: all_teams["SD"].id, date: Date.new(2020, 8, 8), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 8)).id },
      { team_id: all_teams["NYM"].id, date: Date.new(2020, 8, 9), game_week_id: GameWeek.by_date(season, Date.new(2020, 8, 9)).id }
    ] 
  }
]

users.each do |user|
  u = User.find_or_initialize_by(email: user[:email])
  u.password = user[:password] if u.new_record?
  puts "#{u.email} created"

  u.save

  m = u.memberships.find_or_initialize_by(league: league)
  m.role = 2 if u.email == "markmiranda51@gmail.com"
  m.save

  if user[:picks]
    user[:picks].each do |pick|
      p = Pick.find_or_create_by!(pick.merge(user_id: u.id))
      puts "Pick created: #{p.id}, #{p.team.abbreviation}, #{formatted_date(p.date)}"
    end
    puts "#{u.picks.count} picks for #{u.email} created" 
  end
end
