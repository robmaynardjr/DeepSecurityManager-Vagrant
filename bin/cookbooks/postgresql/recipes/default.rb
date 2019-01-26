postgresql_server_install 'postgresql' do
    password 'dsm'
    port 5432
    setup_repo true
    action [:install, :create]
  end
  
  postgresql_access 'postgresql host superuser' do
    access_type       'host'
    access_db         'all'
    access_user       'postgres'
    access_addr       '127.0.0.1/32'
    access_method     'md5'
    notifies :reload, 'service[postgresql]'
  end
  
  postgresql_user 'dsm' do
    superuser true
    password 'dsm'
    sensitive false
  end
  
  service 'postgresql' do
    extend PostgresqlCookbook::Helpers
    service_name lazy { platform_service_name }
    supports restart: true, status: true, reload: true
    action :nothing
  end