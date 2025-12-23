CREATE TABLE users
(
    user_id               UUID         NOT NULL,
    email                 VARCHAR(255) NOT NULL,
    password              VARCHAR(255) NOT NULL,
    full_name             VARCHAR(100) NOT NULL,
    phone                 VARCHAR(20),
    avatar_url            VARCHAR(500),
    role                  VARCHAR(20)  NOT NULL,
    status                VARCHAR(20)  NOT NULL,
    email_verified        BOOLEAN      NOT NULL,
    email_verified_at     TIMESTAMP WITHOUT TIME ZONE,
    last_login_at         TIMESTAMP WITHOUT TIME ZONE,
    login_count           INTEGER      NOT NULL,
    failed_login_attempts INTEGER      NOT NULL,
    locked_until          TIMESTAMP WITHOUT TIME ZONE,
    created_at            TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    updated_at            TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_users PRIMARY KEY (user_id)
);

ALTER TABLE users
    ADD CONSTRAINT uc_users_email UNIQUE (email);

CREATE INDEX idx_created_at ON users (created_at);

CREATE UNIQUE INDEX idx_email ON users (email);

CREATE INDEX idx_status ON users (status);