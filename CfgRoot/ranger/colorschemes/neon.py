# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
    progress_bar_color = blue

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                bg = magenta
            if context.border:
                fg = default
            if context.media:
                if context.image:
                    fg = cyan
                else:
                    fg = cyan
            if context.container:
                fg = magenta
            if context.directory:
                attr |= bold
                fg = blue
            elif context.executable and not \
                    any((context.media, context.container,
                        context.fifo, context.socket)):
                attr |= bold
                fg = magenta
            if context.socket:
                fg = cyan
                attr |= bold
            if context.fifo or context.device:
                fg = cyan
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and cyan or red  
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (magenta, cyan):
                    fg = cyan
                else:
                    fg = magenta
            if not context.selected and (context.cut or context.copied):
                fg = black
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = cyan
            if context.badinfo:
                if attr & reverse:
                    bg = cyan
                else:
                    fg = cyan

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and magenta or blue 
            elif context.directory:
                fg = blue
            elif context.tab:
                if context.good:
                    bg = magenta
            elif context.link:
                fg = cyan

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = cyan
                elif context.bad:
                    fg = cyan
            if context.marked:
                attr |= bold | reverse
                fg = cyan
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = magenta
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = blue
                attr &= ~bold
            if context.vcscommit:
                fg = cyan
                attr &= ~bold


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color


        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = cyan
            elif context.vcschanged:
                fg = magenta
            elif context.vcsunknown:
                fg = magenta
            elif context.vcsstaged:
                fg = magenta
            elif context.vcssync:
                fg = magenta
            elif context.vcsignomagenta:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = magenta
            elif context.vcsbehind:
                fg = magenta
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = cyan
            elif context.vcsunknown:
                fg = magenta

        return fg, bg, attr
