CREATE TABLE users (
    id_user varchar(255) NOT NULL,
    fullname VARCHAR(255) NOT NULL,
    username varchar(255), 
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone varchar(15),
    photo varchar(255),
    bio text,
    UNIQUE (email)
);

ALTER TABLE users 
ADD CONSTRAINT users_id_pk
PRIMARY KEY (id_user);

CREATE TABLE messages (
    id varchar(255) not null,
    body VARCHAR(255) NOT NULL,
    sender_id varchar(255) not null REFERENCES users (id_user) ON DELETE CASCADE ON UPDATE CASCADE,
    receiver_id varchar(255) not null REFERENCES users (id_user) ON DELETE CASCADE ON UPDATE CASCADE,
    post_at timestamp default current_timestamp,
    UNIQUE (id)
);

CREATE TABLE groupmessage (
    id varchar(255) not null,
    body VARCHAR(255) NOT NULL,
    sender_id varchar(255) not null REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    room_id varchar(255) not null,
    post_at timestamp default current_timestamp,
    UNIQUE (id)
);
