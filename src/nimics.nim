import
  std/os,
  std/times

import
  ./nimics/creators,
  ./nimics/types,
  ./nimics/utils

export
  utils

proc newIcsFile*(): IcsFile =
  result = IcsFile()
  result.prodid       = "Nim ICS creator"
  result.tzid         = "Greenwich Standard Time"
  result.dtstart      = "16010101T000000"
  result.tzoffsetfrom = "+0000"
  result.tzoffsetto   = "+0000"
  result.lang         = "en-GB"
  result.class        = "PUBLIC"
  result.priority     = "5"
  result.dtstamp      = icsDateTimeConvert(now().utc) & "Z"
  result.trigger      = "15M"


proc icsGenerate*(icsFile: IcsFile, path: string, filename="invite.ics") =
  ## Generate the ICS file. Returns true on success.

  let content = icsCreate(icsFile)

  writeFile(path / filename, content)