# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import
  os,
  times,
  unittest

import
  nimics


test "Create new ICS file":
  discard tryRemoveFile("tests" / "test.ics")
  var ics = newIcsFile()
  icsGenerate(ics, "tests/", "test.ics")
  assert fileExists("tests" / "test.ics") == true

test "Create new ICS file with details":
  discard tryRemoveFile("tests" / "test.ics")
  var ics = newIcsFile()
  ics.orgName     = "Thomas"
  ics.orgMail     = "thomas@mail.com"
  ics.attendees   = @["t1:t1@t1.com", "t2:t2@t2.com"]
  ics.description = "Let's talk about how awesome Nim is"
  ics.summary     = "Nim talk"
  ics.mstart      = initDateTime(01, mDec, 2020, 12, 00, 00).icsDateTimeConvert()
  ics.mend        = "20201201T133000"
  ics.location    = "Nim HQ"
  icsGenerate(ics, "tests/", "test.ics")
  assert fileExists("tests" / "test.ics") == true
