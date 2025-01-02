require 'json'
require 'pathname'
require 'pdf-reader'

module Jekyll
  class PDFScanner < Generator
    safe true
    priority :low

    def generate(site)
      base_dir = site.source + '/assets'
      categories = ['presentations', 'teaching']
      
      categories.each do |category|
        pdf_dir = "#{base_dir}/#{category}"
        next unless Dir.exist?(pdf_dir)
        
        pdfs = scan_directory(pdf_dir, category)
        site.pages << JsonPage.new(site, site.source, category, pdfs)
      end
    end

    private
    
    def scan_directory(dir, category)
      pdfs = []
      Dir.glob(File.join(dir, '*.pdf')).each do |file|
        path = Pathname.new(file)
        reader = PDF::Reader.new(file)
        creation_date = parse_pdf_date(reader.info[:CreationDate])
        
        pdfs << {
          name: path.basename.to_s,
          url: "/assets/#{category}/#{path.basename}",
          size: format_size(File.size(file)),
          modified: creation_date
        }
      end
      pdfs.sort_by { |pdf| pdf[:modified] }.reverse
    end

    def parse_pdf_date(date_string)
      return nil unless date_string
      if date_string =~ /D:(\d{4})(\d{2})(\d{2})/
        Time.new($1.to_i, $2.to_i, $3.to_i).to_i * 1000
      else
        Time.now.to_i * 1000
      end
    end

    def format_size(size)
      units = ['B', 'KB', 'MB', 'GB']
      unit_index = 0
      while size > 1024 && unit_index < units.length - 1
        size /= 1024.0
        unit_index += 1
      end
      "#{size.round(1)} #{units[unit_index]}"
    end
  end

  class JsonPage < Page
    def initialize(site, base, category, pdfs)
      @site = site
      @base = base
      @dir = 'assets/data'  # Keep this as is
      @name = "#{category}_pdfs.json"
      
      # Also write directly to a versioned directory
      static_dir = File.join(site.source, 'assets', 'data')
      FileUtils.mkdir_p(static_dir)
      File.write(File.join(static_dir, "#{category}_pdfs.json"), JSON.generate({ pdfs: pdfs }))
      
      self.process(@name)
      self.content = JSON.generate({ pdfs: pdfs })
      self.data = {
        'layout' => nil
      }
    end
end