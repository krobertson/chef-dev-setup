def load_current_resource
  @zipapp = Chef::Resource::ZipappPackage.new(new_resource.name)
  @zipapp.app(new_resource.app)
  Chef::Log.debug("Checking for application #{new_resource.app}")
  installed = ::File.directory?("#{new_resource.destination}/#{new_resource.app}.app")
  @zipapp.installed(installed)
end

action :install do
  unless @zipapp.installed
    zip_file = "#{Chef::Config[:file_cache_path]}/#{new_resource.app}.zip"

    if new_resource.source
      remote_file zip_file do
        source new_resource.source
        checksum new_resource.checksum if new_resource.checksum
      end
    end

    execute "extract #{new_resource.app}" do
      command %Q{
        unzip '#{zip_file}' -d '#{Chef::Config[:file_cache_path]}/#{new_resource.app}-temp'
        cp -R '#{Chef::Config[:file_cache_path]}/#{new_resource.app}-temp/#{new_resource.app}.app' '#{new_resource.destination}'
      }
    end

    file "#{new_resource.destination}/#{new_resource.app}.app/Contents/MacOS/#{new_resource.app}" do
      mode 0755
      ignore_failure true
    end

  end
end
