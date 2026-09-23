# Data

## Download

Data is not tracked in git due to its size (~1.1 GB). Download from [MoneyPuck](https://moneypuck.com/data.htm):

```bash
curl -o data/shots_2007-2024.csv https://peter-tanner.com/moneypuck/downloads/shots_2007_2024.csv
```

## License

Data downloaded from MoneyPuck for educational use.

## Dataset Overview

This dataset contains shot-level data from the National Hockey League (NHL) for the 2007-2024 seasons. Each row represents a shot event (including goals, misses, and blocked shots) with detailed contextual information such as player identities, ice conditions, and expected goal probabilities. The data is sourced from MoneyPuck and includes precomputed expected goal (xG) metrics.

## Data Dictionary

| Column | Description |
|--------|-------------|
| `shotID` | Unique shot identifier |
| `homeTeamCode` | Three-letter code for the home team (e.g., BUF) |
| `awayTeamCode` | Three-letter code for the away team (e.g., NJD) |
| `season` | Season year (e.g., 2024 for 2023-24) |
| `isPlayoffGame` | 1 if playoff game, 0 otherwise |
| `game_id` | Unique game identifier |
| `homeTeamWon` | 1 if home team won the game, 0 otherwise |
| `id` | Event identifier within the game (sequential) |
| `time` | Time elapsed in the period (seconds) |
| `timeUntilNextEvent` | Seconds until the next event in the game |
| `timeSinceLastEvent` | Seconds since the previous event in the game |
| `period` | Period number (1-4 for regulation, 5 for OT, 6 for SO) |
| `team` | Team that initiated the event (HOME or AWAY) |
| `location` | Zone where the event occurred (HOMEZONE, AWAYZONE, NEUTRALZONE) |
| `event` | Event type (SHOT, MISS, GOAL, FACEOFF, HIT, GIVE, TAKE, BLOCK, etc.) |
| `goal` | 1 if the shot resulted in a goal, 0 otherwise |
| `shotPlayContinuedOutsideZone` | 1 if play continued outside the zone after the shot |
| `shotPlayContinuedInZone` | 1 if play continued in the zone after the shot |
| `shotGoalieFroze` | 1 if the goalie froze the puck after the shot |
| `shotPlayStopped` | 1 if play stopped after the shot |
| `shotGeneratedRebound` | 1 if the shot generated a rebound |
| `homeTeamGoals` | Cumulative goals scored by the home team at the time of the event |
| `awayTeamGoals` | Cumulative goals scored by the away team at the time of the event |
| `xCord` | Shot x-coordinate (feet, origin at center ice, positive toward away goal) |
| `yCord` | Shot y-coordinate (feet, -42 to 42 across the width of the rink) |
| `xCordAdjusted` | x-coordinate adjusted for arena differences |
| `yCordAdjusted` | y-coordinate adjusted for arena differences |
| `shotAngle` | Angle of the shot relative to the goal (degrees, 0 = straight on) |
| `shotAngleAdjusted` | Shot angle adjusted for arena differences |
| `shotAnglePlusRebound` | Shot angle adjusted for rebound situations |
| `shotAngleReboundRoyalRoad` | Shot angle adjusted for rebounds crossing the royal road (center line) |
| `shotDistance` | Distance of the shot from the goal (feet) |
| `shotType` | Type of shot (WRIST, SLAP, SNAP, TIP, BACK, WRAP) |
| `shotOnEmptyNet` | 1 if the shot was on an empty net, 0 otherwise |
| `shotRebound` | 1 if the shot was a rebound, 0 otherwise |
| `shotAnglePlusReboundSpeed` | Shot angle adjusted for rebound speed |
| `shotRush` | 1 if the shot occurred on a rush, 0 otherwise |
| `speedFromLastEvent` | Speed (feet/second) from the last event to this event |
| `lastEventxCord` | x-coordinate of the previous event |
| `lastEventyCord` | y-coordinate of the previous event |
| `distanceFromLastEvent` | Distance (feet) from the previous event |
| `lastEventShotAngle` | Shot angle of the previous event (if applicable) |
| `lastEventShotDistance` | Shot distance of the previous event (if applicable) |
| `lastEventCategory` | Category of the previous event (SHOT, MISS, HIT, etc.) |
| `lastEventTeam` | Team that initiated the previous event |
| `homeEmptyNet` | 1 if the home team's net is empty, 0 otherwise |
| `awayEmptyNet` | 1 if the away team's net is empty, 0 otherwise |
| `homeSkatersOnIce` | Number of home team skaters on the ice |
| `awaySkatersOnIce` | Number of away team skaters on the ice |
| `awayPenalty1TimeLeft` | Time remaining (seconds) on the first away penalty |
| `awayPenalty1Length` | Length (seconds) of the first away penalty |
| `homePenalty1TimeLeft` | Time remaining (seconds) on the first home penalty |
| `homePenalty1Length` | Length (seconds) of the first home penalty |
| `playerPositionThatDidEvent` | Position of the player who initiated the event (F, D, G) |
| `playerNumThatDidEvent` | Jersey number of the player who initiated the event |
| `playerNumThatDidLastEvent` | Jersey number of the player who initiated the previous event |
| `lastEventxCord_adjusted` | Adjusted x-coordinate of the previous event |
| `lastEventyCord_adjusted` | Adjusted y-coordinate of the previous event |
| `timeSinceFaceoff` | Time (seconds) since the last faceoff |
| `goalieIdForShot` | Unique identifier of the goalie facing the shot |
| `goalieNameForShot` | Name of the goalie facing the shot |
| `shooterPlayerId` | Unique identifier of the shooter |
| `shooterName` | Name of the shooter |
| `shooterLeftRight` | Shooter's handedness (L for left, R for right) |
| `shooterTimeOnIce` | Time (seconds) the shooter has been on ice for this shift |
| `shooterTimeOnIceSinceFaceoff` | Time (seconds) the shooter has been on ice since the last faceoff |
| `shootingTeamForwardsOnIce` | Number of forwards on the shooting team currently on ice |
| `shootingTeamDefencemenOnIce` | Number of defencemen on the shooting team currently on ice |
| `shootingTeamAverageTimeOnIce` | Average time on ice (seconds) for shooting team players |
| `shootingTeamAverageTimeOnIceOfForwards` | Average time on ice (seconds) for shooting team forwards |
| `shootingTeamAverageTimeOnIceOfDefencemen` | Average time on ice (seconds) for shooting team defencemen |
| `shootingTeamMaxTimeOnIce` | Maximum time on ice (seconds) among shooting team players |
| `shootingTeamMaxTimeOnIceOfForwards` | Maximum time on ice (seconds) among shooting team forwards |
| `shootingTeamMaxTimeOnIceOfDefencemen` | Maximum time on ice (seconds) among shooting team defencemen |
| `shootingTeamMinTimeOnIce` | Minimum time on ice (seconds) among shooting team players |
| `shootingTeamMinTimeOnIceOfForwards` | Minimum time on ice (seconds) among shooting team forwards |
| `shootingTeamMinTimeOnIceOfDefencemen` | Minimum time on ice (seconds) among shooting team defencemen |
| `shootingTeamAverageTimeOnIceSinceFaceoff` | Average time on ice since last faceoff for shooting team |
| `shootingTeamAverageTimeOnIceOfForwardsSinceFaceoff` | Average time on ice since last faceoff for shooting team forwards |
| `shootingTeamAverageTimeOnIceOfDefencemenSinceFaceoff` | Average time on ice since last faceoff for shooting team defencemen |
| `shootingTeamMaxTimeOnIceSinceFaceoff` | Maximum time on ice since last faceoff for shooting team |
| `shootingTeamMaxTimeOnIceOfForwardsSinceFaceoff` | Maximum time on ice since last faceoff for shooting team forwards |
| `shootingTeamMaxTimeOnIceOfDefencemenSinceFaceoff` | Maximum time on ice since last faceoff for shooting team defencemen |
| `shootingTeamMinTimeOnIceSinceFaceoff` | Minimum time on ice since last faceoff for shooting team |
| `shootingTeamMinTimeOnIceOfForwardsSinceFaceoff` | Minimum time on ice since last faceoff for shooting team forwards |
| `shootingTeamMinTimeOnIceOfDefencemenSinceFaceoff` | Minimum time on ice since last faceoff for shooting team defencemen |
| `defendingTeamForwardsOnIce` | Number of forwards on the defending team currently on ice |
| `defendingTeamDefencemenOnIce` | Number of defencemen on the defending team currently on ice |
| `defendingTeamAverageTimeOnIce` | Average time on ice (seconds) for defending team players |
| `defendingTeamAverageTimeOnIceOfForwards` | Average time on ice (seconds) for defending team forwards |
| `defendingTeamAverageTimeOnIceOfDefencemen` | Average time on ice (seconds) for defending team defencemen |
| `defendingTeamMaxTimeOnIce` | Maximum time on ice (seconds) among defending team players |
| `defendingTeamMaxTimeOnIceOfForwards` | Maximum time on ice (seconds) among defending team forwards |
| `defendingTeamMaxTimeOnIceOfDefencemen` | Maximum time on ice (seconds) among defending team defencemen |
| `defendingTeamMinTimeOnIce` | Minimum time on ice (seconds) among defending team players |
| `defendingTeamMinTimeOnIceOfForwards` | Minimum time on ice (seconds) among defending team forwards |
| `defendingTeamMinTimeOnIceOfDefencemen` | Minimum time on ice (seconds) among defending team defencemen |
| `defendingTeamAverageTimeOnIceSinceFaceoff` | Average time on ice since last faceoff for defending team |
| `defendingTeamAverageTimeOnIceOfForwardsSinceFaceoff` | Average time on ice since last faceoff for defending team forwards |
| `defendingTeamAverageTimeOnIceOfDefencemenSinceFaceoff` | Average time on ice since last faceoff for defending team defencemen |
| `defendingTeamMaxTimeOnIceSinceFaceoff` | Maximum time on ice since last faceoff for defending team |
| `defendingTeamMaxTimeOnIceOfForwardsSinceFaceoff` | Maximum time on ice since last faceoff for defending team forwards |
| `defendingTeamMaxTimeOnIceOfDefencemenSinceFaceoff` | Maximum time on ice since last faceoff for defending team defencemen |
| `defendingTeamMinTimeOnIceSinceFaceoff` | Minimum time on ice since last faceoff for defending team |
| `defendingTeamMinTimeOnIceOfForwardsSinceFaceoff` | Minimum time on ice since last faceoff for defending team forwards |
| `defendingTeamMinTimeOnIceOfDefencemenSinceFaceoff` | Minimum time on ice since last faceoff for defending team defencemen |
| `offWing` | 1 if the shot was from the off-wing (shooter's stick side opposite the side of the ice), 0 otherwise |
| `arenaAdjustedShotDistance` | Shot distance adjusted for arena differences |
| `arenaAdjustedXCord` | x-coordinate adjusted for arena differences |
| `arenaAdjustedYCord` | y-coordinate adjusted for arena differences |
| `arenaAdjustedYCordAbs` | Absolute value of the adjusted y-coordinate |
| `timeDifferenceSinceChange` | Time (seconds) since the last line change |
| `averageRestDifference` | Difference in average rest time between teams |
| `xGoal` | Expected goal probability (0-1) |
| `xFroze` | Probability that the goalie freezes the puck |
| `xRebound` | Probability that the shot generates a rebound |
| `xPlayContinuedInZone` | Probability that play continues in the zone |
| `xPlayContinuedOutsideZone` | Probability that play continues outside the zone |
| `xPlayStopped` | Probability that play stops |
| `xShotWasOnGoal` | Probability that the shot was on goal |
| `isHomeTeam` | 1 if the shooting team is the home team, 0 otherwise |
| `shotWasOnGoal` | 1 if the shot was on goal, 0 otherwise |
| `teamCode` | Three-letter code of the shooting team |
| `arenaAdjustedXCordABS` | Absolute value of the arena-adjusted x-coordinate |
