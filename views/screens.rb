class MainScreen
  def initialize
    @width = 61
  end

  def initial
    header
    print "\n║                                                           ║"
    print "\n║  [1] List Books                                           ║"
    print "\n║  [2] List Music Albums                                    ║"
    print "\n║  [3] List Games                                           ║"
    print "\n║  [4] List Genres                                          ║"
    print "\n║  [5] List Labels                                          ║"
    print "\n║  [6] List Authors                                         ║"
    print "\n║  [7] Add a new Book                                       ║"
    print "\n║  [8] Add a new Music Album                                ║"
    print "\n║  [9] Add a new Game                                       ║"
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
