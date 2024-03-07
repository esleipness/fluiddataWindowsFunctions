
WITH Swift_Song_Popularity AS (
    SELECT f.id 
    , f.track_name
    , f.danceability
    , f.energy    
    , f.loudness
    , f.mode
    , f.speechiness
    , f.acousticness
    , f.instrumentalness
    , f.liveness
    , f.valence
    , f.tempo
    , t.explicit 
    , t.popularity AS track_popularity
    , t.duration AS track_duration
    FROM [taylorswift-Features] AS f
    LEFT JOIN [taylorswift-Tracks] AS t
    ON t.id = f.id
) 
SELECT 
    track_name,
    danceability,
    energy,
    loudness,
    mode,
    speechiness,
    acousticness,
    instrumentalness,
    liveness,
    valence,
    tempo,
    explicit,
	track_popularity,
    RANK() OVER(ORDER BY track_popularity DESC) AS pop_rank,
	DENSE_RANK() OVER(ORDER BY track_popularity DESC) AS pop_denserank,
    track_duration
FROM Swift_Song_Popularity;