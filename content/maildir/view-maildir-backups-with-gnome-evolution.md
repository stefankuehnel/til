+++
title = "View Maildir backups with Gnome Evolution"
date = 2026-05-09
+++

Webhosting providers often create backups of mail accounts in
Maildir format, a common directory-based email storage format. When you 
need to inspect the contents of such a backup, Gnome Evolution can open 
Maildir directories directly, without requiring import or conversion.

To view a Maildir backup in Evolution:

1. Install and open Evolution.
2. Click ☰, then navigate to **File → New → Email Account** to open the
   Configuration Assistant.
3. In the **Identity** section, fill in any email address (e.g.
   `john.doe@example.com`) and click **Next**.
4. In the **Receive E-Mails** section, change **Server Type** from `IMAP` to
   `Maildir-format mail directories`. Use the **messages folder** field to
   select the `Maildir` directory on your file system. Click **Next**.
5. In **Receiving Options**, click **Next** without changes.
6. In **Sending E-Mails**, change **Server Type** from `SMTP` to `None`.
   Click **Next**.
7. In the **Account Summary**, verify the configuration and click **Next**.
8. In the **Finish** section, click **Apply**.

After these steps, the Maildir directory is accessible as a local mail
account within Evolution, allowing you to browse and search through the
backed-up emails.

## Bibliography

Klapper, A., Gonzalez, A., Tobias , Barbara M., & Bull, P. (2026). GNOME
/ evolution. In *Home*.
[https://gitlab.gnome.org/GNOME/evolution/-/wikis/home](https://gitlab.gnome.org/GNOME/evolution/-/wikis/home)

Maildir. (2026). In *Wikipedia*.
[https://en.wikipedia.org/w/index.php?title=Maildir&oldid=1337936532](https://en.wikipedia.org/w/index.php?title=Maildir&oldid=1337936532)