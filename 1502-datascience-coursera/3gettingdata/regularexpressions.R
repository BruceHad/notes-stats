RegEx can be throught of as a combination of literals and meta characters. Simple patterns consist of literals, where you are looking for an exact match. Meta characters help express whitespace, sets, boundaries, alternatives and wildcards.

^ - matches the start of the line.
^I think - matches "I think" only at the start of a line.
mornings$ - $ matches the end of a line.
[Bb] - represents the set B or b.
[a-zA-Z] - matches ranges of characters a-z or A-Z
[^?.]$ - when used in braces, the ^ indicates not. So this one looks for any line that doesn't end in . or ?
. - refers to any character.
| - can be used as and OR.
() - contains subexpressions.
? - suggests the expression is optional (presumable the ? in the set above is escaped automatically)
\ - escapes character (consider it a literal not a metacharacter.)
* - (after expression) means any number of including none.
+ - (after expression) means at least once. [0-9]+ (.*)[0-9]+ means at least one number followed by any number of characters, followed by at least one number.
{} - are interval quantifiers, specifies the minimum or maximum number of matches.
etc...

Used in grep, grepl, sub and gsub and other functions.
All of these can be used in combination.

