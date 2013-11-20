BEGIN {
D["PACKAGE_NAME"]=" \"libogg\""
D["PACKAGE_TARNAME"]=" \"libogg\""
D["PACKAGE_VERSION"]=" \"1.3.1\""
D["PACKAGE_STRING"]=" \"libogg 1.3.1\""
D["PACKAGE_BUGREPORT"]=" \"ogg-dev@xiph.org\""
D["PACKAGE_URL"]=" \"\""
D["PACKAGE"]=" \"libogg\""
D["VERSION"]=" \"1.3.1\""
D["STDC_HEADERS"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_STRING_H"]=" 1"
D["HAVE_MEMORY_H"]=" 1"
D["HAVE_STRINGS_H"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_STDINT_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_DLFCN_H"]=" 1"
D["LT_OBJDIR"]=" \".libs/\""
D["STDC_HEADERS"]=" 1"
D["SIZEOF_INT16_T"]=" 2"
D["SIZEOF_UINT16_T"]=" 2"
D["SIZEOF_U_INT16_T"]=" 2"
D["SIZEOF_INT32_T"]=" 4"
D["SIZEOF_UINT32_T"]=" 4"
D["SIZEOF_U_INT32_T"]=" 4"
D["SIZEOF_INT64_T"]=" 8"
D["SIZEOF_SHORT"]=" 2"
D["SIZEOF_INT"]=" 4"
D["SIZEOF_LONG"]=" 8"
D["SIZEOF_LONG_LONG"]=" 8"
  for (key in D) D_is_set[key] = 1
  FS = ""
}
/^[\t ]*#[\t ]*(define|undef)[\t ]+[_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]*([\t (]|$)/ {
  line = $ 0
  split(line, arg, " ")
  if (arg[1] == "#") {
    defundef = arg[2]
    mac1 = arg[3]
  } else {
    defundef = substr(arg[1], 2)
    mac1 = arg[2]
  }
  split(mac1, mac2, "(") #)
  macro = mac2[1]
  prefix = substr(line, 1, index(line, defundef) - 1)
  if (D_is_set[macro]) {
    # Preserve the white space surrounding the "#".
    print prefix "define", macro P[macro] D[macro]
    next
  } else {
    # Replace #undef with comments.  This is necessary, for example,
    # in the case of _POSIX_SOURCE, which is predefined and required
    # on some systems where configure will not decide to define it.
    if (defundef == "undef") {
      print "/*", prefix defundef, macro, "*/"
      next
    }
  }
}
{ print }
