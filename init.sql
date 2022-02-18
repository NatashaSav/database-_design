create table if not exists author (
    id serial primary key,
    "name" varchar(150) not null unique,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    is_deleted boolean not null default false
    );

create table if not exists genre (
    id serial primary key,
    "name" varchar(150) not null unique,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    is_deleted boolean not null default false
    );

create table if not exists author_genre(
    id serial primary key ,
    author_id integer references author(id),
    genre_id integer references genre(id),
    constraint UQ_author_genre_author_id_genre_id unique (author_id, genre_id)
);

create table if not exists album (
    id serial primary key,
    "name" varchar(250) not null unique,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    is_deleted boolean not null default false
);

create table if not exists author_album (
    id serial primary key,
    author_id integer references author(id),
    album_id integer references album(id),
    constraint UQ_author_album_author_id_album_id unique (author_id, album_id)
);

create table if not exists track (
    id serial primary key,
    "name" varchar(250) not null unique,
    duration_track time,
    number_track int,
    album_id int references album(id),
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    is_deleted boolean not null default false
);

create table if not exists collection (
    id serial primary key,
    "name" varchar(200),
    creation_year varchar(100)
)

create table if not exists track_collection (
    id serial primary key,
    track_id integer references track(id),
    collection_id integer references collection(id),
    constraint UQ_track_collection_track_id_collection_id unique (track_id, collection_id)

)
