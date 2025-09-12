;;; mail-config.el --- Email configuration (mu4e) -*- lexical-binding: t; -*-

(setq user-mail-address "hukaidonghkd@gmail.com")

(after! mu4e
  (setq mu4e-drafts-folder "/Drafts")
  (setq mu4e-sent-folder "/Sent")
  (setq mu4e-refile-folder "/Archive")
  (setq mu4e-get-mail-command "mbsync --all")
  (setq mu4e-update-interval 300)
  (setq mu4e-headers-auto-update t))

;;; mail-config.el ends here