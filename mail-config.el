;;; mail-config.el --- Email configuration (mu4e) -*- lexical-binding: t; -*-

(after! mu4e
  (setq mu4e-contexts
        (list
         ;; Work account
         (make-mu4e-context
          :name "Home"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/Home" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "hukaidonghkd@gmail.com")
                  (user-full-name    . "Kaidong Hu")
                  (mu4e-drafts-folder  . "/Home/[Gmail]/Drafts")
                  (mu4e-sent-folder  . "/Home/[Gmail]/Sent Mail")
                  (mu4e-refile-folder  . "/Home/[Gmail]/All Mail")
                  (mu4e-trash-folder . "/Home/[Gmail]/Trash")
                  ))
         ;; Work account
         (make-mu4e-context
          :name "Work"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/Work" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "kaidong.hu@rutgers.edu")
                  (user-full-name    . "Kaidong Hu")
                  (mu4e-drafts-folder  . "/Work/Drafts")
                  (mu4e-sent-folder  . "/Work/Sent")
                  (mu4e-refile-folder  . "/Work/Archive")
                  (mu4e-trash-folder . "/Work/Trash")
                  ))
         ))
  (setq mu4e-get-mail-command "mbsync --all")
  (setq mu4e-update-interval 300)
  (setq mu4e-headers-auto-update t))

;; Start davmail using Doom's add-hook! macro
(add-hook! 'after-init-hook
  (start-process "davmail" nil "systemctl" "--user" "start" "davmail"))

;;; mail-config.el ends here
