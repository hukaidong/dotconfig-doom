;;; org-config.el --- Org mode configuration -*- lexical-binding: t; -*-

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(add-hook 'org-mode-hook
          (lambda () (setq buffer-save-without-query t)))

(setq org-refile-targets '((nil :maxlevel . 3)
                           (org-agenda-files :maxlevel . 3)))

(setq org-refile-use-outline-path 'file)

(setq org-outline-path-complete-in-steps nil)

(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-latex-compiler "lualatex")

(setq org-preview-latex-default-process 'dvisvgm)
(setq org-preview-latex-process-alist
      '((dvisvgm :programs ("xelatex" "dvisvgm")
                 :description "xdv > svg"
                 :message "you need to install the programs: xelatex and dvisvgm."
                 :image-input-type "xdv"
                 :image-output-type "svg"
                 :image-size-adjust (1.7 . 1.5)
                 :latex-compiler ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                 :image-converter ("dvisvgm %f -n -b min -c %S -o %O"))))

(after! org
  (add-to-list 'org-capture-templates
               '("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox")
                 "* TODO %?\nSCHEDULED: %t\n%i\n%a" :prepend t)))

(provide 'org-config)
;;; org-config.el ends here