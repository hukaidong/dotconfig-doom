(require 'ring)

;; Pre-declare projectile variables to avoid "Defining as dynamic an already
;; lexical var" errors in Emacs 28+. The magit module uses these in `let' forms
;; before projectile is loaded.
(defvar projectile-verbose nil)
(defvar projectile-require-project-root nil)
(defvar projectile-enable-caching nil)

;; Disable which-key-mode (enabled by Doom core in doom-keybinds.el)
(remove-hook 'doom-first-input-hook #'which-key-mode)

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

;;; Bibliography paths
(after! bibtex-completion
  (setq bibtex-completion-bibliography '("~/.config/references.bib")
        bibtex-completion-library-path '("~/papers/")
        bibtex-completion-notes-path "~/org/roam/refs/"

        ;; Use org-cite format when inserting citations in org files
        bibtex-completion-format-citation-functions
        '((org-mode . bibtex-completion-format-citation-org-cite)
          (latex-mode . bibtex-completion-format-citation-cite)
          (default . bibtex-completion-format-citation-default))

        ;; Template for literature notes (one file per entry)
        bibtex-completion-notes-template-multiple-files
        (concat "#+title: ${title}\n"
                "#+filetags: :reference:\n\n"
                "* ${title}\n"
                ":PROPERTIES:\n"
                ":ROAM_REFS: [cite:@${=key=}]\n"
                ":AUTHOR: ${author-or-editor}\n"
                ":YEAR: ${year}\n"
                ":END:\n\n"
                "** Summary\n\n"
                "** Notes\n\n")))

;;; Configure bibtex autokey format: author + year + first title word
;;; Example output: smith2023deep, jones2024reinforcement
(after! bibtex
  (setq bibtex-autokey-year-length 4                    ; use full year: 2023
        bibtex-autokey-name-year-separator ""           ; no separator between name and year
        bibtex-autokey-year-title-separator ""          ; no separator between year and title
        bibtex-autokey-titleword-separator ""           ; no separator between title words
        bibtex-autokey-titlewords 1                     ; use 1 word from title
        bibtex-autokey-titlewords-stretch 0             ; don't add extra words
        bibtex-autokey-titleword-length nil             ; use full word (nil = no limit)
        bibtex-autokey-titleword-ignore                 ; words to skip
        '("A" "An" "On" "The" "A" "For" "And" "Of" "In" "To"
          "a" "an" "on" "the" "for" "and" "of" "in" "to")))

;;; Org-cite configuration
(after! oc
  (setq org-cite-global-bibliography '("~/.config/references.bib")
        org-cite-export-processors '((latex biblatex)
                                     (t csl))))

;;; For faster CrossRef responses
(after! biblio
  (setq biblio-crossref-user-email-address "hukaidong@gmail.com"))

;;; Org-roam-bibtex integration
(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq orb-preformat-keywords '("citekey" "title" "author-or-editor" "year" "url" "file")
        orb-process-file-keyword t
        orb-attached-file-extensions '("pdf" "epub")))
