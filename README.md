# vim-password-store
Vim niceties for password store ("pass" the standard Unix Password Manager)

This is a fairly straight-forward fork of Tom Ryder's password-store plugin,
included in the contrib folder for pass and at Tom's cgit store:
https://git.zx2c4.com/password-store/

I've added some niceties based around a fuller filetype implementation,
in particular

* unset spell
* add simple syntax highlighting

I've added some simple shoulder surfing protection via syntax highlighting.
When loading a pass file for editing, the first line will be obscured. It is
editable when the cursor is in place, but will be obscured while editing other
fields.

There are two commands to facilitate hiding and concealing

*:Reveal*
*:Conceal*

These do what you might expect, reset the syntax highlighting of the password
from obscured to cleared.
