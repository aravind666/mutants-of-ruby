module ExtractHelpers
  def extract_name(lines)
    lines[12..17].map {|l| l.match(/^\s(.+)\s+.+\s+\$\d+\.\d{2}$/)[1]}
  end
end