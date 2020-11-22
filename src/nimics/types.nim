type
  IcsFile* = ref object of RootObj
    prodid*: string           # Default=Nim ICS creator
    tzid*: string             # W. Europe Standard Time, Greenwich Standard Time,
                              # Default=Greenwich Standard Time
    dtstart*: string          # Default=16010101T000000
    tzoffsetfrom*: string     # Default=+0000
    tzoffsetto*: string       # Default=+0000
    orgName*: string          # Organizers name
    orgMail*: string          # Organizers mail
    attendees*: seq[string]   # Attendees, ["NAME:MAIL", "NAME:MAIL"]
    lang*: string             # Default=en-GB
    description*: string      # Meeting description
    summary*: string          # Meeting summary
    mstart*: string           # Meeting start
    mend*: string             # Meeting end
    class*: string            # Default=PUBLIC
    priority*: string         # Default=5
    dtstamp*: string          # Meeting created, Default=Current time
    location*: string         # Meeting location
    trigger*: string          # Alarm trigger, default=15M
