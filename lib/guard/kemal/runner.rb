module Guard
  class Kemal < Plugin
    class Runner
      attr_reader :options

      def initialize(options = {})
        @path = options.fetch(:path, '.')
        @file = options.fetch(:file, 'app.cr')
      end

      def start!
        @crystal_pid = Kernel.fork do
          exec("crystal build #{filepath} && ./#{executable_name}")
        end
      end

      def stop!
        system("kill -2 #{@crystal_pid}")
      end

      private

      def filepath
        File.join(@path, @file)
      end

      def executable_name
        @file.split(".").first
      end
    end
  end
end
