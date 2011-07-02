root_dir = File.expand_path('..', File.dirname(__FILE__))

role_path     File.join(root_dir, 'roles')
cookbook_path File.join(root_dir, 'cookbooks')

file_store_path   root_dir
file_cache_path   root_dir
file_backup_path  File.join(root_dir, '.chef/backup')
checksum_path     File.join(root_dir, '.chef/checksums')
sandbox_path      File.join(root_dir, '.chef/sandbox')
cache_options({ :path => File.join(root_dir, '.chef/cache/checksums'), :skip_expires => true })

log_level :debug
Chef::Log::Formatter.show_time = true