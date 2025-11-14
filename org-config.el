;;; org-config.el --- Org mode configuration -*- lexical-binding: t; -*-

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(after! org
  (add-hook 'org-mode-hook
            (lambda () (setq buffer-save-without-query t)))

  (setq org-refile-targets '((nil :maxlevel . 3)
                             (org-agenda-files :maxlevel . 3)))

  (setq org-refile-use-outline-path 'file)

  (setq org-outline-path-complete-in-steps nil)

  (setq org-refile-allow-creating-parent-nodes 'confirm)

  (add-to-list 'org-capture-templates
               '("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox")
                 "* TODO %?\nSCHEDULED: %t\n%i\n%a" :prepend t)))

;;; org-config.el ends here
