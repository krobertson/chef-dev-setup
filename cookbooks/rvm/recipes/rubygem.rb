if node[:rvm][:rubygem]
  node[:rvm][:rubygem].each_pair do |interpreter, version|
    bash "set #{interpreter} to use RubyGems v#{version}" do
      code %{source $HOME/.rvm/scripts/rvm && rvm #{interpreter} rubygems #{version}}
      not_if %{bash -c "source $HOME/.rvm/scripts/rvm && rvm #{interpreter} gem -v | grep '#{version}'"}
    end
  end
end
