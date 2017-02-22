#!/bin/bash
# usage: find . -name "*.java" -exec ../j2swift.sh {} \;

cat $1 |
sed 's/private \([^ ]*\) \([^ ]*\);/var \2: \1/g' |
sed 's/private final \([^ ]*\) \([^ ]*\);/let \2: \1/g' |
sed 's/public \([^ ]*\) \([^ ]*\)()/func \2() -> \1/g' |
sed 's/private \([^ ]*\) \([^ ]*\)()/func \2() -> \1/g' |
sed 's/public \([^ ]*\) \([^ ]*\)(\([^ ]*\) \([^ ]*\))/func \2(\4: \3) -> \1/g' |
sed 's/private \([^ ]*\)(\([^ ]*\) \([^ ]*\))/func \1(\3: \2)/g' |
sed 's/public \([^ ]*\)(\([^ ]*\) \([^ ]*\))/func \1(\3: \2)/g' |
sed 's/public interface \([^ ]*\) extends/protocol \1:/g' |
sed 's/void \([^ ]*\)(\([^ ]*\) \([^ ]*\));/func \1(\3: \2)/g' |
sed 's/void \([^ ]*\)(\([^ ]*\) \([^ ]*\))/func \1(\3: \2)/g' |
sed 's/void \([^ ]*\)(\([^ ]*\) \([^ ]*\), \([^ ]*\) \([^ ]*\));/func \1(\3: \2, \5: \4)/g' |
sed 's/void \([^ ]*\)(\([^ ]*\) \([^ ]*\), \([^ ]*\) \([^ ]*\), \([^ ]*\) \([^ ]*\))/func \1(\3: \2, \5: \4, \7: \6)/g' |
sed -E 's/private static ([^ ]+) ([^ :(]+)\(([^ :]+) ([^ ]+)\)/static func \2(\4: \3) -> \1/g' |
sed -E 's/private static ([^ ]+) ([^ :(]+)\(([^ :]+) ([^ ]+), ([^ ]+) ([^ ]+)\)/static func \2(\4: \3, \6: \5) -> \1/g' |
sed -E 's/private static ([^ ]+) ([^ :(]+)\(([^ :]+) ([^ ]+), ([^ ]+) ([^ ]+), ([^ ]+) ([^ ]+)\)/static func \2(\4: \3, \6: \5, \8: \7) -> \1/g' |
sed -E 's/static ([^ ]+) ([^ (]+)\(([^ :]+) ([^ :]+)\)/static func \2(\4: \3) -> \1/g' |
sed -E 's/static ([^ ]+) ([^ (]+)\(([^ :]+) ([^ :]+), ([^ ]+) ([^ ]+)\)/static func \2(\4: \3, \6: \5) -> \1/g' |
sed -E 's/static ([^ ]+) ([^ (]+)\(([^ :]+) ([^ :]+), ([^ ]+) ([^ ]+), ([^ ]+) ([^ ]+)\)/static func \2(\4: \3, \6: \5, \8: \7) -> \1/g' |
sed -E 's/private ([^ ]+) ([^ (]+)\(([^ :]+) ([^ :]+)\)/func \2(\4: \3) -> \1/g' |
sed -E 's/private ([^ ]+) ([^ (]+)\(([^ :]+) ([^ :]+), ([^ ]+) ([^ ]+)\)/func \2(\4: \3, \6: \5) -> \1/g' |
sed -E 's/private ([^ ]+) ([^ (]+)\(([^ :]+) ([^ :]+), ([^ ]+) ([^ ]+), ([^ ]+) ([^ ]+)\)/func \2(\4: \3, \6: \5, \8: \7) -> \1/g' |
sed 's/private static final \([^ ]*\) \([^ ]*\)/let \2: \1/g' |
sed 's/private static \([^ ]*\) \([^ ]*\) =/let \2: \1 =/g' |
sed 's/private static \([^ ]*\) \([^ ]*\);/let \2: \1;/g' |
sed 's/private \([^ ]*\) \([^ ]*\) =/let \2: \1 =/g' |
sed 's/private \([^ ]*\) \([^ ]*\);/let \2: \1;/g' |
sed 's/byte\[\]/[UInt8]/g' |
sed 's/int:/Int:/g' |
sed 's/[^A-Za-z]new / /g' |
sed 's/: int/: Int/g' |
sed 's/    \([^ ]+\) \([^ ]+\) = \(.+\);/    let \2: \1 = \3/g' |
sed 's/    \([^ ]+\) \([^ ]+\);/    let \2: \1;/g' |
sed 's/let \(.+\): return;/return \1/g' |
sed 's/static final class/class/g' |
sed 's/=  /= /g' |
sed 's/  =/ =/g' |
sed 's/this/self/g' > $1.swift
