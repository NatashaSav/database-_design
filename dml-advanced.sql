--количество исполнителей в каждом жанре;
select g."name" as genre_name, count(*) as author_count from author_genre ag
 left join genre g on ag.genre_id = g."id"
group by genre_id, g."name";

--количество треков, вошедших в альбомы 2019-2020 годов;
select "year", count(distinct tr.id) as track_count from track tr
 left join album al on tr.album_id = tr.album_id
where al."year" in (2019, 2020)
group by "year";

--средняя продолжительность треков по каждому альбому;
select al."name" as album_name, avg(tr.duration_track) as avg_track_duration from track tr
 inner join album al on tr.album_id = tr.album_id
group by al.id, al."name";

--все исполнители, которые не выпустили альбомы в 2020 году;
select au."name" from author au
 left join author_album aa on au.id = aa.author_id
 left join album al on al.id = aa.album_id
where al."year" <> 2020;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select col."id", col."name" from collection col
 left join track_collection tcol on tcol.collection_id = col."id"
 left join track t on tcol.track_id = t."id"
 left join author_album aal on aal.album_id = t.album_id
 left join author aut on aut."id" = aal.author_id
where aut."name" = 'Timati'
group by col."id", col."name";

--название альбомов, в которых присутствуют исполнители более 1 жанра;
select alb."id", alb.name as album_name, count(distinct autg.genre_id) as genre_count from album alb
 left join author_album aalb on aalb.album_id = alb."id"
 left join author_genre autg on autg.author_id = aalb.author_id
group by alb."id", alb.name
having count(distinct autg.genre_id) > 1;

--наименование треков, которые не входят в сборники;
select name from track t
left  join  track_collection tc on tc.track_id = t."id"
where tc."id" is null;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT aut.id, aut.name, duration_track::interval from track t
 left join author_album aa on aa.album_id = t.album_id
 left join author aut on aa.author_id = aut.id
WHERE duration_track = (SELECT min(duration_track) from track);

--название альбомов, содержащих наименьшее количество треков.
with track_count as (SELECT album_id, count(*) as count from track group by album_id)
SELECT al.name, tc.count as track_count from track_count tc
inner join album al on al.id = tc.album_id
WHERE "count" = (SELECT min("count") from track_count);