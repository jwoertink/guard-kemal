require 'guard/compat/plugin'

module Guard
  class Kemal < Plugin
    def initialize(options = {})
      @path = options.fetch(:path, '.')
      @file = options.fetch(:file, 'app.cr')
      super
    end

    def start
      @crystal_pid = Kernel.fork do
        exec("crystal #{File.join(@path, @file)}")
      end
    end
    
    def stop
      cmd = `$(killall -s SIGINT "crystal-run-app.tmp")`.chomp.strip
      Kernel.fork { exec(cmd) }
    end

    def reload
      stop
      start
    end

    def run_all
      true
    end

    def run_on_change(paths)
      reload
    end
  end
end
