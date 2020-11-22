import
  strutils,
  times

proc icsDateTimeConvert*(d: DateTime): string =
  ## Converts a DateTime to string
  result = ($d)
            .multiReplace([("-", ""), (":", "")])
            .substr(0, 14)