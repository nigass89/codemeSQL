CREATE TABLE users
(
    id                INT NOT NULL,
    login             VARCHAR(20) NOT NULL,
    pass              VARCHAR(130) NOT NULL,
    email             VARCHAR(30) NOT NULL,
    first_name        VARCHAR(20) NOT NULL,
    last_name         VARCHAR(20) NOT NULL,
    permission_level  int NOT NULL,
    level_state       VARCHAR(20) NOT NULL,
    CONSTRAINT user_id_pk PRIMARY KEY (id)
);

create sequence users_seq start with 1 increment by 1;

drop table users;

CREATE TABLE children
(  user_id int not null,
    guardian_id int not null,
  CONSTRAINT children_id_pk
    FOREIGN KEY (user_id)
    REFERENCES users(id)
);