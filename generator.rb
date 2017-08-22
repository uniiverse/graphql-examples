# frozen_string_literal: true

class Generator
  README = 'README.md'
  DETAILS_START = /<details name="([\/\w]+)">/
  DETAILS_END = /<\/details>/
  EXT_BY_DIR = {
    'ruby' => 'rb',
    'curl' => 'sh'
  }

  def perform
    lines = File.read(README).split("\n")
    details_started = false

    new_lines = lines.map do |line|
      puts line
      if matchdata = line.match(DETAILS_START)
        details_name = matchdata.captures.first
        if filepath = filepath(details_name)
          puts "Processing #{details_name} ..."
          details_started = true
          "#{line}\n#{code_block(filepath)}"
        else
          puts "Skipped #{details_name}"
          nil
        end
      elsif line.match(DETAILS_END)
        puts "Processed"
        details_started = false
        line
      elsif !details_started
        line
      end
    end

    File.write(README, new_lines.compact.join("\n"))
  end

  private

  def filepath(details_name)
    extension = EXT_BY_DIR[details_name.split('/').first]
    result = "#{details_name}.#{extension}"
    File.file?(result) && result
  end

  def code_block(filepath)
    definition = File.read(filepath)
    extension = filepath.split('.').last
    <<~CODE
      <p>

      ```#{extension}
      #{definition}```

      </p>
    CODE
  end
end
