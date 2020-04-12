# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_11_015220) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "columns_priv", primary_key: ["Host", "Db", "User", "Table_name", "Column_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Column privileges", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Column_name", limit: 64, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.column "Column_priv", "set('Select','Insert','Update','References')", default: "", null: false, collation: "utf8_general_ci"
  end

  create_table "component", primary_key: "component_id", id: :integer, unsigned: true, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Components", force: :cascade do |t|
    t.integer "component_group_id", null: false, unsigned: true
    t.text "component_urn", null: false
  end

  create_table "db", primary_key: ["Host", "Db", "User"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Database privileges", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.column "Select_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Insert_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Update_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Delete_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Drop_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Grant_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "References_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Index_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_tmp_table_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Lock_tables_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Show_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Execute_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Event_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Trigger_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.index ["User"], name: "User"
  end

  create_table "default_roles", primary_key: ["HOST", "USER", "DEFAULT_ROLE_HOST", "DEFAULT_ROLE_USER"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Default roles", force: :cascade do |t|
    t.string "HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "USER", limit: 32, default: "", null: false
    t.string "DEFAULT_ROLE_HOST", default: "%", null: false, collation: "ascii_general_ci"
    t.string "DEFAULT_ROLE_USER", limit: 32, default: "", null: false
  end

  create_table "engine_cost", primary_key: ["cost_name", "engine_name", "device_type"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "engine_name", limit: 64, null: false
    t.integer "device_type", null: false
    t.string "cost_name", limit: 64, null: false
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
    t.virtual "default_value", type: :float, as: "(case `cost_name` when _utf8mb4\\'io_block_read_cost\\' then 1.0 when _utf8mb4\\'memory_block_read_cost\\' then 0.25 else NULL end)"
  end

  create_table "friends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "model"
  end

  create_table "func", primary_key: "name", id: :string, limit: 64, default: "", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "User defined functions", force: :cascade do |t|
    t.integer "ret", limit: 1, default: 0, null: false
    t.string "dl", limit: 128, default: "", null: false
    t.column "type", "enum('function','aggregate')", null: false, collation: "utf8_general_ci"
  end

  create_table "general_log", id: false, options: "ENGINE=CSV DEFAULT CHARSET=utf8", comment: "General log", force: :cascade do |t|
    t.timestamp "event_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", size: :medium, null: false
    t.bigint "thread_id", null: false, unsigned: true
    t.integer "server_id", null: false, unsigned: true
    t.string "command_type", limit: 64, null: false
    t.binary "argument", size: :medium, null: false
  end

  create_table "global_grants", primary_key: ["USER", "HOST", "PRIV"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Extended global grants", force: :cascade do |t|
    t.string "USER", limit: 32, default: "", null: false
    t.string "HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "PRIV", limit: 32, default: "", null: false, collation: "utf8_general_ci"
    t.column "WITH_GRANT_OPTION", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
  end

  create_table "gtid_executed", primary_key: ["source_uuid", "interval_start"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "source_uuid", limit: 36, null: false, comment: "uuid of the source where the transaction was originally executed."
    t.bigint "interval_start", null: false, comment: "First number of interval."
    t.bigint "interval_end", null: false, comment: "Last number of interval."
  end

  create_table "help_category", primary_key: "help_category_id", id: :integer, limit: 2, unsigned: true, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "help categories", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "parent_category_id", limit: 2, unsigned: true
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_keyword", primary_key: "help_keyword_id", id: :integer, unsigned: true, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "help keywords", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_relation", primary_key: ["help_keyword_id", "help_topic_id"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "keyword-topic relation", force: :cascade do |t|
    t.integer "help_topic_id", null: false, unsigned: true
    t.integer "help_keyword_id", null: false, unsigned: true
  end

  create_table "help_topic", primary_key: "help_topic_id", id: :integer, unsigned: true, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "help topics", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "help_category_id", limit: 2, null: false, unsigned: true
    t.text "description", null: false
    t.text "example", null: false
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "innodb_index_stats", primary_key: ["database_name", "table_name", "index_name", "stat_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.string "index_name", limit: 64, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "stat_name", limit: 64, null: false
    t.bigint "stat_value", null: false, unsigned: true
    t.bigint "sample_size", unsigned: true
    t.string "stat_description", limit: 1024, null: false
  end

  create_table "innodb_table_stats", primary_key: ["database_name", "table_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "n_rows", null: false, unsigned: true
    t.bigint "clustered_index_size", null: false, unsigned: true
    t.bigint "sum_of_other_index_sizes", null: false, unsigned: true
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "password_history", primary_key: ["Host", "User", "Password_timestamp"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Password history for user accounts", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "User", limit: 32, default: "", null: false
    t.timestamp "Password_timestamp", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "Password"
  end

  create_table "plugin", primary_key: "name", id: :string, limit: 64, default: "", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "MySQL plugins", force: :cascade do |t|
    t.string "dl", limit: 128, default: "", null: false
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.text "description"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "procs_priv", primary_key: ["Host", "Db", "User", "Routine_name", "Routine_type"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Procedure privileges", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Routine_name", limit: 64, default: "", null: false, collation: "utf8_general_ci"
    t.column "Routine_type", "enum('FUNCTION','PROCEDURE')", null: false
    t.string "Grantor", limit: 288, default: "", null: false
    t.column "Proc_priv", "set('Execute','Alter Routine','Grant')", default: "", null: false, collation: "utf8_general_ci"
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "proxies_priv", primary_key: ["Host", "User", "Proxied_host", "Proxied_user"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "User proxy privileges", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "User", limit: 32, default: "", null: false
    t.string "Proxied_host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Proxied_user", limit: 32, default: "", null: false
    t.boolean "With_grant", default: false, null: false
    t.string "Grantor", limit: 288, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "role_edges", primary_key: ["FROM_HOST", "FROM_USER", "TO_HOST", "TO_USER"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Role hierarchy and role grants", force: :cascade do |t|
    t.string "FROM_HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "FROM_USER", limit: 32, default: "", null: false
    t.string "TO_HOST", default: "", null: false, collation: "ascii_general_ci"
    t.string "TO_USER", limit: 32, default: "", null: false
    t.column "WITH_ADMIN_OPTION", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
  end

  create_table "server_cost", primary_key: "cost_name", id: :string, limit: 64, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
    t.virtual "default_value", type: :float, as: "(case `cost_name` when _utf8mb4\\'disk_temptable_create_cost\\' then 20.0 when _utf8mb4\\'disk_temptable_row_cost\\' then 0.5 when _utf8mb4\\'key_compare_cost\\' then 0.05 when _utf8mb4\\'memory_temptable_create_cost\\' then 1.0 when _utf8mb4\\'memory_temptable_row_cost\\' then 0.1 when _utf8mb4\\'row_evaluate_cost\\' then 0.1 else NULL end)"
  end

  create_table "servers", primary_key: "Server_name", id: :string, limit: 64, default: "", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "MySQL Foreign Servers table", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "Username", limit: 64, default: "", null: false
    t.string "Password", limit: 64, default: "", null: false
    t.integer "Port", default: 0, null: false
    t.string "Socket", limit: 64, default: "", null: false
    t.string "Wrapper", limit: 64, default: "", null: false
    t.string "Owner", limit: 64, default: "", null: false
  end

  create_table "slave_master_info", primary_key: "Channel_name", id: :string, limit: 64, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Master Information", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file.", unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin", comment: "The name of the master binary log currently being read from the master."
    t.bigint "Master_log_pos", null: false, comment: "The master log position of the last read event.", unsigned: true
    t.string "Host", collation: "ascii_general_ci", comment: "The host name of the master."
    t.text "User_name", collation: "utf8_bin", comment: "The user name used to connect to the master."
    t.text "User_password", collation: "utf8_bin", comment: "The password used to connect to the master."
    t.integer "Port", null: false, comment: "The network port used to connect to the master.", unsigned: true
    t.integer "Connect_retry", null: false, comment: "The period (in seconds) that the slave will wait before trying to reconnect to the master.", unsigned: true
    t.boolean "Enabled_ssl", null: false, comment: "Indicates whether the server supports SSL connections."
    t.text "Ssl_ca", collation: "utf8_bin", comment: "The file used for the Certificate Authority (CA) certificate."
    t.text "Ssl_capath", collation: "utf8_bin", comment: "The path to the Certificate Authority (CA) certificates."
    t.text "Ssl_cert", collation: "utf8_bin", comment: "The name of the SSL certificate file."
    t.text "Ssl_cipher", collation: "utf8_bin", comment: "The name of the cipher in use for the SSL connection."
    t.text "Ssl_key", collation: "utf8_bin", comment: "The name of the SSL key file."
    t.boolean "Ssl_verify_server_cert", null: false, comment: "Whether to verify the server certificate."
    t.float "Heartbeat", null: false
    t.text "Bind", collation: "utf8_bin", comment: "Displays which interface is employed when connecting to the MySQL server"
    t.text "Ignored_server_ids", collation: "utf8_bin", comment: "The number of server IDs to be ignored, followed by the actual server IDs"
    t.text "Uuid", collation: "utf8_bin", comment: "The master server uuid."
    t.bigint "Retry_count", null: false, comment: "Number of reconnect attempts, to the master, before giving up.", unsigned: true
    t.text "Ssl_crl", collation: "utf8_bin", comment: "The file used for the Certificate Revocation List (CRL)"
    t.text "Ssl_crlpath", collation: "utf8_bin", comment: "The path used for Certificate Revocation List (CRL) files"
    t.boolean "Enabled_auto_position", null: false, comment: "Indicates whether GTIDs will be used to retrieve events from the master."
    t.text "Tls_version", collation: "utf8_bin", comment: "Tls version"
    t.text "Public_key_path", collation: "utf8_bin", comment: "The file containing public key of master server."
    t.boolean "Get_public_key", null: false, comment: "Preference to get public key from master."
    t.text "Network_namespace", collation: "utf8_bin", comment: "Network namespace used for communication with the master server."
    t.string "Master_compression_algorithm", limit: 64, null: false, collation: "utf8_bin", comment: "Compression algorithm supported for data transfer between master and slave."
    t.integer "Master_zstd_compression_level", null: false, comment: "Compression level associated with zstd compression algorithm.", unsigned: true
    t.text "Tls_ciphersuites", collation: "utf8_bin", comment: "Ciphersuites used for TLS 1.3 communication with the master server."
  end

  create_table "slave_relay_log_info", primary_key: "Channel_name", id: :string, limit: 64, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Relay Log Information", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file or rows in the table. Used to version table definitions.", unsigned: true
    t.text "Relay_log_name", collation: "utf8_bin", comment: "The name of the current relay log file."
    t.bigint "Relay_log_pos", comment: "The relay log position of the last executed event.", unsigned: true
    t.text "Master_log_name", collation: "utf8_bin", comment: "The name of the master binary log file from which the events in the relay log file were read."
    t.bigint "Master_log_pos", comment: "The master log position of the last executed event.", unsigned: true
    t.integer "Sql_delay", comment: "The number of seconds that the slave must lag behind the master."
    t.integer "Number_of_workers", unsigned: true
    t.integer "Id", comment: "Internal Id that uniquely identifies this record.", unsigned: true
    t.string "Privilege_checks_username", limit: 32, collation: "utf8_bin", comment: "Username part of PRIVILEGE_CHECKS_USER."
    t.string "Privilege_checks_hostname", collation: "ascii_general_ci", comment: "Hostname part of PRIVILEGE_CHECKS_USER."
    t.boolean "Require_row_format", null: false, comment: "Indicates whether the channel shall only accept row based events."
  end

  create_table "slave_worker_info", primary_key: ["Channel_name", "Id"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Worker Information", force: :cascade do |t|
    t.integer "Id", null: false, unsigned: true
    t.text "Relay_log_name", null: false, collation: "utf8_bin"
    t.bigint "Relay_log_pos", null: false, unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin"
    t.bigint "Master_log_pos", null: false, unsigned: true
    t.text "Checkpoint_relay_log_name", null: false, collation: "utf8_bin"
    t.bigint "Checkpoint_relay_log_pos", null: false, unsigned: true
    t.text "Checkpoint_master_log_name", null: false, collation: "utf8_bin"
    t.bigint "Checkpoint_master_log_pos", null: false, unsigned: true
    t.integer "Checkpoint_seqno", null: false, unsigned: true
    t.integer "Checkpoint_group_size", null: false, unsigned: true
    t.binary "Checkpoint_group_bitmap", null: false
    t.string "Channel_name", limit: 64, null: false, comment: "The channel on which the slave is connected to a source. Used in Multisource Replication"
  end

  create_table "slow_log", id: false, options: "ENGINE=CSV DEFAULT CHARSET=utf8", comment: "Slow log", force: :cascade do |t|
    t.timestamp "start_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", size: :medium, null: false
    t.time "query_time", precision: 6, null: false
    t.time "lock_time", precision: 6, null: false
    t.integer "rows_sent", null: false
    t.integer "rows_examined", null: false
    t.string "db", limit: 512, null: false
    t.integer "last_insert_id", null: false
    t.integer "insert_id", null: false
    t.integer "server_id", null: false, unsigned: true
    t.binary "sql_text", size: :medium, null: false
    t.bigint "thread_id", null: false, unsigned: true
  end

  create_table "tables_priv", primary_key: ["Host", "Db", "User", "Table_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Table privileges", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Grantor", limit: 288, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.column "Table_priv", "set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger')", default: "", null: false, collation: "utf8_general_ci"
    t.column "Column_priv", "set('Select','Insert','Update','References')", default: "", null: false, collation: "utf8_general_ci"
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "time_zone", primary_key: "Time_zone_id", id: :integer, unsigned: true, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Time zones", force: :cascade do |t|
    t.column "Use_leap_seconds", "enum('Y','N')", default: "N", null: false
  end

  create_table "time_zone_leap_second", primary_key: "Transition_time", id: :bigint, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Leap seconds information for time zones", force: :cascade do |t|
    t.integer "Correction", null: false
  end

  create_table "time_zone_name", primary_key: "Name", id: :string, limit: 64, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Time zone names", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
  end

  create_table "time_zone_transition", primary_key: ["Time_zone_id", "Transition_time"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Time zone transitions", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.bigint "Transition_time", null: false
    t.integer "Transition_type_id", null: false, unsigned: true
  end

  create_table "time_zone_transition_type", primary_key: ["Time_zone_id", "Transition_type_id"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Time zone transition types", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.integer "Transition_type_id", null: false, unsigned: true
    t.integer "Offset", default: 0, null: false
    t.integer "Is_DST", limit: 1, default: 0, null: false, unsigned: true
    t.string "Abbreviation", limit: 8, default: "", null: false
  end

  create_table "user", primary_key: ["Host", "User"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", comment: "Users and global privileges", force: :cascade do |t|
    t.string "Host", default: "", null: false, collation: "ascii_general_ci"
    t.string "User", limit: 32, default: "", null: false
    t.column "Select_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Insert_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Update_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Delete_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Drop_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Reload_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Shutdown_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Process_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "File_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Grant_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "References_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Index_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Show_db_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Super_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_tmp_table_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Lock_tables_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Execute_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Repl_slave_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Repl_client_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Show_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_user_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Event_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Trigger_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_tablespace_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "ssl_type", "enum('','ANY','X509','SPECIFIED')", default: "", null: false, collation: "utf8_general_ci"
    t.binary "ssl_cipher", null: false
    t.binary "x509_issuer", null: false
    t.binary "x509_subject", null: false
    t.integer "max_questions", default: 0, null: false, unsigned: true
    t.integer "max_updates", default: 0, null: false, unsigned: true
    t.integer "max_connections", default: 0, null: false, unsigned: true
    t.integer "max_user_connections", default: 0, null: false, unsigned: true
    t.string "plugin", limit: 64, default: "caching_sha2_password", null: false
    t.text "authentication_string"
    t.column "password_expired", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.timestamp "password_last_changed"
    t.integer "password_lifetime", limit: 2, unsigned: true
    t.column "account_locked", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_role_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Drop_role_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.integer "Password_reuse_history", limit: 2, unsigned: true
    t.integer "Password_reuse_time", limit: 2, unsigned: true
    t.column "Password_require_current", "enum('N','Y')", collation: "utf8_general_ci"
    t.json "User_attributes"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "profile"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
    t.string "clan"
    t.string "psnid"
    t.string "sex"
    t.integer "level"
    t.integer "lightlevel"
    t.string "model"
    t.string "timezone"
    t.string "voice"
    t.string "style"
    t.boolean "admin", default: false
    t.float "strength"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
end
