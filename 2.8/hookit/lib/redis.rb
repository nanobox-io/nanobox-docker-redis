module Hooky
  module Redis

    BOXFILE_DEFAULTS = {
      # Redis settings
      tcp_keepalive:                 {type: :integer, default: 60},
      databases:                     {type: :integer, default: 16},
      stop_writes_on_bgsave_error:   {type: :string,  default: 'yes'},
      slave_serve_stale_data:        {type: :string,  default: 'yes'},
      slave_read_only:               {type: :string,  default: 'yes'},
      repl_ping_slave_period:        {type: :integer, default: 10},
      repl_timeout:                  {type: :integer, default: 60},
      repl_disable_tcp_nodelay:      {type: :string,  default: 'no'},
      max_clients:                   {type: :integer, default: 1024},
      maxmemory_policy:              {type: :string,  default: 'volatile-lru', from: ['volatile-lru', 'allkeys-lru', 'volatile-random', 'allkeys-random', 'volatile-ttl', 'noeviction']},
      maxmemory_samples:             {type: :integer, default: 3},
      appendonly:                    {type: :string,  default: 'no'},
      appendfsync:                   {type: :string,  default: 'everysec', from: ['no', 'always', 'everysec']},
      no_appendfsync_on_rewrite:     {type: :string,  default: 'no'},
      auto_aof_rewrite_percentage:   {type: :integer, default: 100},
      auto_aof_rewrite_min_size:     {type: :byte,    default: '64m'},
      lua_time_limit:                {type: :integer, default: 5000},
      slowlog_log_slower_than:       {type: :integer, default: 10000},
      slowlog_max_len:               {type: :integer, default: 128},
      hash_max_ziplist_entries:      {type: :integer, default: 512},
      hash_max_ziplist_value:        {type: :integer, default: 64},
      list_max_ziplist_entries:      {type: :integer, default: 512},
      list_max_ziplist_value:        {type: :integer, default: 64},
      set_max_intset_entries:        {type: :integer, default: 512},
      zset_max_ziplist_entries:      {type: :integer, default: 128},
      zset_max_ziplist_value:        {type: :integer, default: 64},
      activerehashing:               {type: :string,  default: 'yes'},
      hz:                            {type: :integer, default: 10},
      aof_rewrite_incremental_fsync: {type: :string,  default: 'yes'}
    }

  end
end
