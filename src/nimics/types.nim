type
  IcsFile* = ref object of RootObj
    uid*: string              # Unique identifier. Used to update event.
    prodid*: string           # Default=Nim ICS creator
    tzid*: string             # W. Europe Standard Time, Greenwich Standard Time,
                              # Default=Greenwich Standard Time
    dtstart*: string          # Default=16010101T000000
    tzoffsetfrom*: string     # Default=+0000
    tzoffsetto*: string       # Default=+0000
    orgName*: string          # Organizers name
    orgMail*: string          # Organizers mail
    attendees*: seq[string]   # Attendees, ["NAME:MAIL", "NAME:MAIL"]
    requireResponse*: bool    # Require/ask the user to respond with an answer
    lang*: string             # Default=en-GB
    description*: string      # Meeting description
    summary*: string          # Meeting summary
    sequence*: int            # The meeting number. Used to update event.
    mstart*: string           # Meeting start
    mend*: string             # Meeting end
    class*: string            # Default=PUBLIC
    priority*: string         # Default=5
    dtstamp*: string          # Meeting created, Default=Current time
    location*: string         # Meeting location
    trigger*: string          # Alarm trigger, default=15M
