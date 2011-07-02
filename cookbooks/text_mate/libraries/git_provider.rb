class Chef::Provider::Git
  def clone
    remote = @new_resource.remote

    args = []
    args << "-o #{remote}" unless remote == 'origin'
    args << "--depth #{@new_resource.depth}" if @new_resource.depth

    Chef::Log.info "#{@new_resource} cloning repo #{@new_resource.repository} to #{@new_resource.destination}"

    clone_cmd = "git clone #{args.join(' ')} #{@new_resource.repository} \"#{@new_resource.destination}\""
    shell_out!(clone_cmd, run_options(:command_log_level => :info))
  end
end
