require 'cgi'

# With CGI, you can:
#   manipulate forms, cookies, and the environment, maintain stateful sessions, and so on.

###########
# Quoting #
###########

# reverse: CGI.unescape
puts CGI.escape("Nicholas Payton/Trumpet & Flugel Horn")

# reverse: CGI.unescapeHTML
puts CGI.escapeHTML('<a href="/mp3">Click Here</a>')

# reverse: CGI.unescapeElement
puts CGI.escapeElement('<hr/><a href="/mp3">Click Here</a><br/>', 'A')
