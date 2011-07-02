class Chef::Provider::Service::Launchd < Chef::Provider::Service::Simple

  LAUNCHCTL_FORMAT = /([\d-]+)\s+([\d-]+)\s+([[:print:]]+)/

  def initialize(new_resource, run_context)
    raise ArgumentError, "run_context cannot be nil" unless run_context
    super

    run_context.node
  end

  def load_current_resource
    @current_resource = Chef::Resource::Service.new(@new_resource.name)
    @current_resource.service_name(@new_resource.service_name)

    if @new_resource.status_command
      Chef::Log.debug("#{@new_resource} you have specified a status command, running..")

      begin
        if run_command_with_systems_locale(:command => @new_resource.status_command) == 0
          @current_resource.running true
        end
      rescue Chef::Exceptions::Exec
        @current_resource.running false
        nil
      end
    else
      pid = launchctl_pid

      if pid
        @current_resource.enabled true
        if pid > 0
          @current_resource.running true
        else
          @current_resource.running false
        end
      else
        @current_resource.enabled false
      end
    end

    @current_resource
  end

  def start_service
    if @current_resource.running
      Chef::Log.debug("#{@new_resource}: Already running, not starting")
    else
      if @new_resource.start_command
        super
      else
        file = launchctl_file
        run_command_with_systems_locale(:command => "launchctl load #{file}")
        run_command_with_systems_locale(:command => "launchctl start #{launchctl_name}")
      end
    end
  end

  def stop_service
    unless @current_resource.running
      Chef::Log.debug("#{@new_resource}: Not running, not stopping")
    else
      if @new_resource.stop_command
        super
      else
        file = launchctl_file
        run_command_with_systems_locale(:command => "launchctl unload #{file}")
      end
    end
  end

  def restart_service
    if @new_resource.restart_command
      super
    else
      run_command_with_systems_locale(:command => "launchctl stop #{launchctl_name}")
    end
  end

  def reload_service
    if @new_resource.reload_command
      super
    else
      pid = launchctl_pid
      run_command_with_systems_locale(:command => "kill -HUP #{pid}") if pid
    end
  end

  def enable_service
    # Macports integration:
    run_command_with_systems_locale(:command => "port load #{@new_resource.service_name}") rescue nil
    file = launchctl_file
    puts "==========- #{@new_resource.service_name} -================="
    puts "=========== #{file} ======================"
    run_command_with_systems_locale(:command => "launchctl load #{file}")
  end

  def disable_service
    file = launchctl_file
    run_command_with_systems_locale(:command => "launchctl unload #{file}")
    # Macports integration:
    run_command_with_systems_locale(:command => "port unload #{@new_resource.service_name}") rescue nil
  end

  # A pid or 0 if not running
  def launchctl_pid
    command = "launchctl list | grep #{@new_resource.service_name}"
    status = popen4(command) do |pid, stdin, stdout, stderr|
      stdout.each_line do |line|
        line =~ LAUNCHCTL_FORMAT
        pid, status, name = Regexp.last_match.captures
        return pid.to_i if name =~ /#{Regexp.escape @new_resource.service_name}$/
      end
    end
    nil
  end
  
  def launchctl_name
    command = "launchctl list | grep #{@new_resource.service_name}"
    status = popen4(command) do |pid, stdin, stdout, stderr|
      stdout.each_line do |line|
        line =~ LAUNCHCTL_FORMAT
        pid, status, name = Regexp.last_match.captures
        return name if name =~ /#{Regexp.escape @new_resource.service_name}$/
      end
    end
  end

  def launchctl_file
    Dir["{#{::File.expand_path('~')}/,/}Library/{LaunchDaemons,LaunchAgents}/*#{@new_resource.service_name}.plist"].first
  end

end

Chef::Platform.set :platform => :mac_os_x, :resource => :service, :provider => Chef::Provider::Service::Launchd
