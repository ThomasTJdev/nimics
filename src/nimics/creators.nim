import
  std/md5,
  std/strutils,
  std/wordwrap

import
  ./formatting,
  ./types

proc icsCreateMain*(
    prodid,
    tzid,
    dtstart,
    tzoffsetfrom,
    tzoffsetto: string
  ): string =
  ## Create mail block

  return icsMain.format(prodid, tzid, dtstart, tzoffsetfrom, tzoffsetto)

proc icsCreateOrganizer*(
    name,
    mail: string
  ): string =
  ## Create organizer block

  return icsOrganizer.format(name, mail)

proc icsCreateAttendees*(
    nameAndMail: seq[string],
    requireResponse: bool
  ): string =
  ## Create attendees block
  ##
  ## Should be formatted with NAME and MAIL separated by a :
  ##
  ## E.g.: Thomas:mail@mail.com

  var attendees: string
  for a in nameAndMail:
    let asplit = split(a, ":")
    attendees.add(icsAttendees.format(
                    asplit[0],
                    asplit[1],
                    toUpperAscii($requireResponse)
                  ) & "\n")

  return attendees

proc icsCreateDescription*(
    lang,
    description: string
  ): string =
  ## Create description block

  return icsDescription.format(lang, description)

proc icsCreateSummary*(
    lang,
    summary: string
  ): string =
  ## Create summary block

  return icsSummary.format(lang, summary)

proc icsCreateDetails*(
    dtstart,
    dtend,
    tzid,
    class,
    priority,
    dtstamp,
    lang,
    location,
    sequence: string
  ): string =
  ## Create details block

  return icsDetails.format(tzid, dtstart, dtend, class, priority, dtstamp, lang, location, sequence)

proc icsCreateAlarm*(
    trigger: string
  ): string =
  ## Create alarm block

  return icsAlarm.format(trigger)

proc icsCreate*(ics: IcsFile): string =
  ## Generate the full ICS file

  let
    main =
      icsCreateMain(ics.prodid, ics.tzid, ics.dtstart, ics.tzoffsetfrom,
                    ics.tzoffsetto)
    organizer =
      icsCreateOrganizer(ics.orgName, ics.orgMail)

    attendees =
      icsCreateAttendees(ics.attendees, ics.requireResponse)

    description =
      icsCreateDescription(ics.lang, ics.description)

    summary =
      icsCreateSummary(ics.lang, ics.summary)

    uid =
      icsUid.format(
          (if ics.uid != "": ics.uid else: getMD5(main))
        )

    details =
      icsCreateDetails(ics.mstart, ics.mend, ics.tzid, ics.class, ics.priority,
                        ics.dtstamp, ics.lang, ics.location, $ics.sequence)
    alarm =
      icsCreateAlarm(ics.trigger)

    content = (main & organizer & "\n" & attendees & description & "\n" &
            summary & "\n" & uid & "\n" & details & alarm)

  for l in splitLines(content):
    result.add(l.wrapWords(75, newLine="\r\l ") & "\r\l")