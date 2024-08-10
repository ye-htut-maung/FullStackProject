create database social_db
    with owner admin;

create table public.users
(
    user_id       serial
        primary key,
    username      varchar(50)  not null
        unique,
    email         varchar(100) not null
        unique,
    password_hash varchar(255) not null,
    full_name     varchar(100),
    bio           text,
    created_at    timestamp default CURRENT_TIMESTAMP,
    updated_at    timestamp default CURRENT_TIMESTAMP
);

alter table public.users
    owner to admin;

create table public.posts
(
    post_id     serial
        primary key,
    user_id     integer
        references public.users,
    content     text not null,
    likes_count integer   default 0,
    created_at  timestamp default CURRENT_TIMESTAMP,
    updated_at  timestamp default CURRENT_TIMESTAMP
);

alter table public.posts
    owner to admin;

create table public.likes
(
    like_id    serial
        primary key,
    post_id    integer
        references public.posts,
    user_id    integer
        references public.users,
    created_at timestamp default CURRENT_TIMESTAMP,
    unique (post_id, user_id)
);

alter table public.likes
    owner to admin;

