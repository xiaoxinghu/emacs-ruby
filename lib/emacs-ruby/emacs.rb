module EmacsRuby
  class Emacs
    attr_accessor :emacs

    def initialize
      @emacs = 'emacs'
    end

    def org_to_html(org_file, load: nil, func: 'org-html-export-to-html')
      html = nil
      batch target: org_file, load: load, func: func
      html_file = org_file.sub(/.org$/, '.html')
      return html unless File.exist? html_file
      File.open(html_file) do |file|
        html = file.read
      end
      FileUtils.rm_rf html_file
      html
    end

    def batch(target: nil, load: nil, func: nil)
      return unless func
      cmd = [@emacs]
      cmd << target if target
      cmd << '--batch'
      cmd += ['-l', load] if load
      cmd += ['-f', func] if func
      cmd << '--kill'
      `#{cmd.join ' '}`
    end
  end
end
