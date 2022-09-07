require_relative './screens'

class LabelsScreen < MainScreen
  def list_labels(data)
    header
    print "\n║  List of labels                                           ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_label(data)
    footer
  end

  def loop_label(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  [#{elem.id}] #{elem.title} (#{elem.color})"
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No labels availables --                 ║"
    end
  end
end
