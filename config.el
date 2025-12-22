(setq user-full-name "Kaidong Hu"
      user-mail-address "hukaidonghkd@gmail.com")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13 :weight 'demibold))
(setq display-line-numbers-type t)
(setq initial-frame-alist '((width . 180) (height . 55)))
(setq org-directory "~/org/")

(after! org
  (add-hook 'org-mode-hook
            (lambda () (setq buffer-save-without-query t)))
  (setq org-refile-targets '((nil :maxlevel . 3) (org-agenda-files :maxlevel . 3)))
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (add-to-list 'org-capture-templates
               '("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox")
                 "* TODO %?\nSCHEDULED: %t\n%i\n%a" :prepend t)))
