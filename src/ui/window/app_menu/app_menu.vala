
[GtkTemplate (ui = "/io/github/daudix/Memo/app_menu.ui")]
public class Memo.AppMenu : Adw.Bin {

    [GtkChild] unowned Gtk.PopoverMenu popover;

    construct {
	    popover.add_child (new ThemeSelector (), "theme");
    }
}
