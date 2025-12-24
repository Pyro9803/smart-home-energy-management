-- Create users table
CREATE TABLE users
(
    user_id               UUID PRIMARY KEY,
    email                 VARCHAR(255)             NOT NULL UNIQUE,
    password              VARCHAR(255)             NOT NULL,
    full_name             VARCHAR(100)             NOT NULL,
    phone                 VARCHAR(20),
    avatar_url            VARCHAR(500),
    role                  VARCHAR(20)              NOT NULL DEFAULT 'USER',
    status                VARCHAR(20)              NOT NULL DEFAULT 'PENDING',
    email_verified        BOOLEAN                  NOT NULL DEFAULT FALSE,
    email_verified_at     TIMESTAMP WITH TIME ZONE,
    last_login_at         TIMESTAMP WITH TIME ZONE,
    login_count           INTEGER                  NOT NULL DEFAULT 0,
    failed_login_attempts INTEGER                  NOT NULL DEFAULT 0,
    locked_until          TIMESTAMP WITH TIME ZONE,
    created_at            TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at            TIMESTAMP WITH TIME ZONE,

    -- Constraints
    CONSTRAINT chk_role CHECK (role IN ('USER', 'ADMIN')),
    CONSTRAINT chk_status CHECK (status IN ('PENDING', 'ACTIVE', 'LOCKED', 'DELETED')),
    CONSTRAINT chk_email_format CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
)
    );

-- Indexes
CREATE INDEX idx_email ON users (email);
CREATE INDEX idx_status ON users (status);
CREATE INDEX idx_created_at ON users (created_at);

-- Comments
COMMENT ON TABLE users IS 'User accounts table';
COMMENT ON COLUMN users.user_id IS 'Primary key - UUID';
COMMENT ON COLUMN users.email IS 'User email - unique, used for login';
COMMENT ON COLUMN users.status IS 'Account status: PENDING, ACTIVE, LOCKED, DELETED';