/*Saquon regular season rushing yards*/
select sum(rushing_yards) as 'YDS'
from eagles_2024
where rusher_player_name = 'S.Barkley' and season_type = 'REG';

/*Regular season fumbles*/
select sum(fumble) as 'FUM'
from eagles_2024
where rusher_player_name = 'S.Barkley' and season_type = 'REG';

/*Regular season fumbles lost*/
select sum(fumble_lost) as 'LST'
from eagles_2024
where rusher_player_name = 'S.Barkley' and season_type = 'REG';

/*Longest regular season rush*/
select max(rushing_yards) as 'LNG'
from eagles_2024
where rusher_player_name = 'S.Barkley' and season_type = 'REG';

/*Number of big runs (20+ yards)*/
select count(rushing_yards) as 'BIG'
from eagles_2024
where rushing_yards >= 20 and rusher_player_name = 'S.Barkley' and rushing_yards >= 20 and season_type = 'REG';

/*Rushing first downs*/
select count(first_down_rush) as 'FD'
from eagles_2024
where first_down_rush = 1.0 and rusher_player_name = 'S.Barkley' and season_type = 'REG';

/*Rushing touchdowns*/
select count(rush_touchdown) as 'TD'
from eagles_2024
where rush_touchdown = 1.0 and rusher_player_name = 'S.Barkley' and season_type = 'REG';

/*Carries*/
select count(rush_attempt) as 'CAR'
from eagles_2024
where rush_attempt = 1.0 and rushing_yards is not null and rusher_player_name = 'S.Barkley' and season_type = 'REG';

/*Condense all queries into one*/
select
    rusher_player_name,
    sum(rushing_yards) as YDS,
    sum(fumble) as FUM,
    sum(fumble_lost) as LST,
    max(rushing_yards) as LNG,
    count(case when rushing_yards >= 20 then 1 end) as BIG,
    count(case when first_down_rush = 1.0 then 1 end) as FD,
    count(case when rush_touchdown = 1.0 then 1 end) as TD,
    count(case when rush_attempt = 1.0 and rushing_yards is not null then 1 end) as CAR
from eagles_2024
where rusher_player_name = 'S.Barkley' and season_type = 'REG';
