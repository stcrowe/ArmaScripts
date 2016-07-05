// Give player huge ass rating so he doesn't become enemy if he acccidently kills two friends (used to stop that can't get in vehicle glitch)
// Not need to put this in initPlayerLocal.sqf && onPlayerRespawn.sqf as well
player addRating 1000000;