# nimics
ICS-file generator. Create an invite.ics file and specify the content.

## How to

```nim
import nimics

# Create the ICS container
var ics = newIcsFile()

# Specify the details
ics.uid         = "IAMUNIQUE"
ics.orgName     = "Thomas"
ics.orgMail     = "thomas@example.com"
ics.attendees   = @["t1:t1@t1.com", "t2:t2@t2.com"]
ics.description = "Let's talk about how awesome Nim is"
ics.summary     = "Nim talk"
ics.mstart      = initDateTime(01, mDec, 2020, 12, 00, 00).icsDateTimeConvert()
ics.mend        = "20201201T133000"
ics.location    = "Nim HQ"

# Generate the file
icsGenerate(ics, "myfolder", "invite.ics")
```

## Options

When creating a new invite, you can specify the following options:
```nim
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
```


## Update event

To update an event remember to use the same `ics.uid` and inc the `isc.sequence`.