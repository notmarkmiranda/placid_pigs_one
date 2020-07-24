teams = [
  { abbreviation: "ARI", city: "Arizona", name: "Diamondbacks" },
  { abbreviation: "ATL", city: "Atlanta", name: "Braves" },
  { abbreviation: "BAL", city: "Baltimore", name: "Orioles" },
  { abbreviation: "BOS", city: "Boston", name: "Red Sox" },
  { abbreviation: "CHC", city: "Chicago", name: "Cubs" },
  { abbreviation: "CWS", city: "Chicago", name: "White Sox" },
  { abbreviation: "CIN", city: "Cincinnati", name: "Reds" },
  { abbreviation: "CLE", city: "Clevand", name: "Indians" },
  { abbreviation: "COL", city: "Colorado", name: "Rockies" },
  { abbreviation: "DET", city: "Detroit", name: "Tigers" },
  { abbreviation: "FLA", city: "Florida", name: "Marlins" },
  { abbreviation: "HOU", city: "Houston", name: "Astros" },
  { abbreviation: "KAN", city: "Kansas City", name: "Royals" },
  { abbreviation: "LAA", city: "Los Angeles", name: "Angels" },
  { abbreviation: "LAD", city: "Los Angeles", name: "Dodgers" },
  { abbreviation: "MIL", city: "Milwaukee", name: "Brewers" },
  { abbreviation: "MIN", city: "Minnesota", name: "Twins" },
  { abbreviation: "NYM", city: "New York", name: "Mets" },
  { abbreviation: "NYY", city: "New York", name: "Yankees" },
  { abbreviation: "OAK", city: "Oakland", name: "Athletics" },
  { abbreviation: "PHI", city: "Philadelphia", name: "Phillies" },
  { abbreviation: "PIT", city: "Pittsburgh", name: "Pirates" },
  { abbreviation: "SD", city: "San Diego", name: "Padres" },
  { abbreviation: "SF", city: "San Francisco", name: "Giants" },
  { abbreviation: "SEA", city: "Seattle", name: "Mariners" },
  { abbreviation: "STL", city: "St. Louis", name: "Cardinals" },
  { abbreviation: "TB", city: "Tampa Bay", name: "Rays" },
  { abbreviation: "TEX", city: "Texas", name: "Rangers" },
  { abbreviation: "TOR", city: "Toronto", name: "Blue Jays" },
  { abbreviation: "WAS", city: "Washington", name: "Nationals" }
]

teams.each do |team|
  team = Team.find_or_create_by(team)
  puts "#{team.city} #{team.name}"
end
