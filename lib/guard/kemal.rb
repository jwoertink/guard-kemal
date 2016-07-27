require 'guard/compat/plugin'

module Guard
  class Kemal < Plugin
    def initialize(options = {})
      @path = options.fetch(:path, '.')
      @file = options.fetch(:file, 'app.cr')
    end

    def start
      `crystal #{File.join(@path, @file)}`
    end
    
    def stop
      `$(killall -s SIGINT "crystal-run-app.tmp")`
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
