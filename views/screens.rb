class MainScreen
  def initialize
    @width = 61
  end

  def initial
    header
    print "\n║                                                           ║"
    print "\n║  [1] Books                                                ║"
    print "\n║  [2] Music albums                                         ║"
    print "\n║  [3] Games                                                ║"
    print "\n║  [0] Exit.                                                ║"
    print "#{blankline}\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def blankline
    print "\n║#{whitespace(2)}║"
  end

  def exit
    header
    print "\n║                                                           ║"
    print "\n║                 THANKS YOU, GOOD BYE!                     ║"
    print "#{blankline}\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def success
    header
    print "#{blankline}\n║                   Successful Operation                    ║"
    print "#{blankline}\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def footer
    print "#{blankline}\n╠═══════════════════════════════════════════════════════════╣"
    print "#{blankline}\n║           Press any key to return to main menu            ║"
    print "#{blankline}\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def footer_empty
    print "#{blankline}\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def header
    system('cls')
    print "\n╔═══════════════════════════════════════════════════════════╗"
    print "#{blankline}\n║                   Catalog of my things                    ║"
    print "#{blankline}\n╠═══════════════════════════════════════════════════════════╣"
  end

  def whitespace(line)
    whiteline = ''
    (0..(@width - line - 1)).each { |_i| whiteline += ' ' }
    whiteline
  end
end
