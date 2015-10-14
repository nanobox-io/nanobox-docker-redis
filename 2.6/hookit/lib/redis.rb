module Hooky
  module Redis

    BOXFILE_DEFAULTS = {
      # Redis settings
      redis_tcp_keepalive:                 {type: :integer, default: 60},
      redis_databases:                     {type: :integer, default: 16},
      redis_stop_writes_on_bgsave_error:   {type: :string,  default: 'yes'},
      redis_slave_serve_stale_data:        {type: :string,  default: 'yes'},
      redis_slave_read_only:               {type: :string,  default: 'yes'},
      redis_repl_ping_slave_period:        {type: :integer, default: 10},
      redis_repl_timeout:                  {type: :integer, default: 60},
      redis_repl_disable_tcp_nodelay:      {type: :string,  default: 'no'},
      redis_max_clients:                   {type: :integer, default: 1024},
      redis_maxmemory_policy:              {type: :string,  default: 'volatile-lru', from: ['volatile-lru', 'allkeys-lru', 'volatile-random', 'allkeys-random', 'volatile-ttl', 'noeviction']},
      redis_maxmemory_samples:             {type: :integer, default: 3},
      redis_appendonly:                    {type: :string,  default: 'no'},
      redis_appendfsync:                   {type: :string,  default: 'everysec', from: ['no', 'always', 'everysec']},
      redis_no_appendfsync_on_rewrite:     {type: :string,  default: 'no'},
      redis_auto_aof_rewrite_percentage:   {type: :integer, default: 100},
      redis_auto_aof_rewrite_min_size:     {type: :byte,    default: '64m'},
      redis_lua_time_limit:                {type: :integer, default: 5000},
      redis_slowlog_log_slower_than:       {type: :integer, default: 10000},
      redis_slowlog_max_len:               {type: :integer, default: 128},
      redis_hash_max_ziplist_entries:      {type: :integer, default: 512},
      redis_hash_max_ziplist_value:        {type: :integer, default: 64},
      redis_list_max_ziplist_entries:      {type: :integer, default: 512},
      redis_list_max_ziplist_value:        {type: :integer, default: 64},
      redis_set_max_intset_entries:        {type: :integer, default: 512},
      redis_zset_max_ziplist_entries:      {type: :integer, default: 128},
      redis_zset_max_ziplist_value:        {type: :integer, default: 64},
      redis_activerehashing:               {type: :string,  default: 'yes'},
      redis_hz:                            {type: :integer, default: 10},
      redis_aof_rewrite_incremental_fsync: {type: :string,  default: 'yes'}
    }

  end
end
