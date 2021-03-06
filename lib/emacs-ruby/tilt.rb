module Tilt
  module EmacsRuby
    class OrgTemplate < Template
      def self.engine_initialized?
        defined? Middleman::Org
      end

      def initialize_engine
        require 'emacs-ruby'
      end

      def prepare
        @engine = ::EmacsRuby::Emacs.new
        @engine.emacs = options[:emacs] || 'emacs'
        @load = options[:load]
        @output = nil
      end

      def evaluate(scope, locals, &block)
        @output = @engine.org_to_html file, load: @load
      end
    end
  end

  Tilt.register Tilt::EmacsRuby::OrgTemplate, 'org'
end
