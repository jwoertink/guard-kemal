require 'guard/compat/plugin'

module Guard
  class Kemal < Plugin
    autoload :Runner, 'guard/kemal/runner'
    VERSION = "0.1.3"

    attr_reader :runner

    def initialize(options = {})
      super
      @runner = Runner.new(options)
    end

    def start
      runner.start!
    end
    
    def stop
      runner.stop!
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
